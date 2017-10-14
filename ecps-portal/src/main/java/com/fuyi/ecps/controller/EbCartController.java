package com.fuyi.ecps.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbCart;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.service.EbCartService;
import com.fuyi.ecps.service.EbSkuService;
import com.fuyi.ecps.utils.ECPSUtils;

@Controller
@RequestMapping("/cart")
public class EbCartController {
	
	@Autowired
	private EbSkuService skuService;
	
	@Autowired
	private EbCartService cartService;
	
	@RequestMapping("/listCart.do")
	public String listCart(HttpServletRequest request, HttpServletResponse response, Model model) {
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
		return "shop/car";
	}
	
	@RequestMapping("/validStock.do")
	public void validStock(Long skuId, Integer quantity, PrintWriter out) {
		EbSku sku = skuService.getSkuById(skuId);
		String result = "yes";
		if(sku.getStockInventory() < quantity) {
			result = "no";
		}
		out.write(result);
	}
	
	/**
	 * @param skuId
	 * @param quantity
	 * @param out
	 */
	@RequestMapping("/validStockCar.do")
	public void validStockCar(Long skuId, Integer quantity, HttpServletResponse resp) {
		EbSku sku = skuService.getSkuById(skuId);
		String result = "yes";
		if(sku.getStockInventory() < quantity) {
			result = "no";
		}
		
		JSONObject jo = new JSONObject();
		jo.accumulate("result", result);
		jo.accumulate("stock", sku.getStockInventory());
		
		ECPSUtils.printJSON(jo.toString(), resp);
	}
	
	@RequestMapping("/validCookie.do")
	public void validCookie(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		String result = cartService.validCart(request, response);
		out.write(result);
	}
	
	@RequestMapping("/addCart.do")
	public void addCart(HttpServletRequest request, HttpServletResponse response, Long skuId, Integer quantity, PrintWriter out) {
		cartService.addCart(request, response, skuId, quantity);
		out.write("success");
	}
	
	@RequestMapping("/addCartNum.do")
	public String addCartNum(HttpServletRequest request, HttpServletResponse response, Long skuId) {
		cartService.addNum(request, response, skuId);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/reduceCart.do")
	public String reduceCart(HttpServletRequest request, HttpServletResponse response, Long skuId) {
		cartService.reduceNum(request, response, skuId);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(HttpServletRequest request, HttpServletResponse response, Long skuId) {
		cartService.deleteCart(request, response, skuId);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/validCart.do")
	public void validCart(HttpServletRequest request, HttpServletResponse response) {
		String result = cartService.validCart(request, response);
		ECPSUtils.printJSON(result, response);
	}
}
