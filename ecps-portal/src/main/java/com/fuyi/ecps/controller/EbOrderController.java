package com.fuyi.ecps.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbCart;
import com.fuyi.ecps.model.TsPtlUser;
import com.fuyi.ecps.service.EbCartService;
import com.fuyi.ecps.service.EbSkuService;

@RequestMapping("/order")
@Controller
public class EbOrderController {
	
	@Autowired
	private EbSkuService skuService;
	
	@Autowired
	private EbCartService cartService;

	@RequestMapping("/toSubmitOrder.do")
	public String toSubmitOrder(HttpServletResponse response, HttpServletRequest request, Model model, HttpSession session) {
		List<EbCart> cartList = cartService.listCart(request, response);
		Integer itemNum = 0;
		BigDecimal totalPrice = new BigDecimal(0);
		for (EbCart ebCart : cartList) {
			itemNum = itemNum + ebCart.getQuantity();
			totalPrice = totalPrice
					.add(ebCart.getSku().getSkuPrice()
					.multiply(new BigDecimal(ebCart.getQuantity())));
		}
		model.addAttribute("itemNum", itemNum);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("cartList", cartList);
		
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		if(user != null) {
			//收货地址
		} else {
			return "redirect:/user/toLogin.do";
		}
		return "shop/confirmProductCase";
	}
}
