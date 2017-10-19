package com.fuyi.ecps.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.exception.EbStockException;
import com.fuyi.ecps.model.EbCart;
import com.fuyi.ecps.model.EbOrder;
import com.fuyi.ecps.model.EbOrderDetail;
import com.fuyi.ecps.model.EbShipAddr;
import com.fuyi.ecps.model.EbSpecValue;
import com.fuyi.ecps.model.TsPtlUser;
import com.fuyi.ecps.service.EbCartService;
import com.fuyi.ecps.service.EbOrderService;
import com.fuyi.ecps.service.EbShipAddrService;

@RequestMapping("/order")
@Controller
public class EbOrderController {
	
	@Autowired
	private EbCartService cartService;
	
	@Autowired
	private EbShipAddrService shipAddrService;
	
	@Autowired
	private EbOrderService orderService;

	/**
	 * 去订单预提交
	 * @param response
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 */
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
			List<EbShipAddr> addrList = shipAddrService.selectAddrByUserId(user.getPtlUserId());
			model.addAttribute("addrList", addrList);
		} else {
			return "redirect:/user/toLogin.do";
		}
		return "shop/confirmProductCase";
	}
	
	/**
	 * 提交订单
	 * @param order
	 * @param address
	 * @param response
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @throws Exception
	 */
	@RequestMapping("/submitOrder.do")
	public String submitOrder(EbOrder order, String address,
			HttpServletResponse response, HttpServletRequest request, 
			HttpSession session, Model model) throws Exception, Exception {
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		if(user != null) {
			order.setPtlUserId(user.getPtlUserId());
			order.setUsername(user.getUsername());
		}
		order.setOrderNum(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		
		if(!StringUtils.equals("add", address)) {
			EbShipAddr addr = shipAddrService.getShipAddrById(new Long(address));
			BeanUtils.copyProperties(order, addr);
		}
		
		List<EbCart> cartList = cartService.listCart(request, response);
		List<EbOrderDetail> orderDetailList = new ArrayList<EbOrderDetail>();
		for(EbCart cart:cartList) {
			EbOrderDetail orderDetail = new EbOrderDetail();
			orderDetail.setItemId(cart.getSku().getItem().getItemId());
			orderDetail.setItemName(cart.getSku().getItem().getItemName());
			orderDetail.setItemNo(cart.getSku().getItem().getItemNo());
			orderDetail.setSkuId(cart.getSkuId());
			
			String specVal = "";
			List<EbSpecValue> specValueList = cart.getSku().getSpecValueList();
			for (EbSpecValue ebSpecValue : specValueList) {
				specVal = specVal + ebSpecValue.getSpecValue() + ",";
			}
			specVal = specVal.substring(0, specVal.length()-1);
			orderDetail.setSkuSpec(specVal);
			orderDetail.setQuantity(cart.getQuantity());
			orderDetail.setSkuPrice(cart.getSku().getSkuPrice());
			orderDetail.setMarketPrice(cart.getSku().getMarketPrice());
			orderDetailList.add(orderDetail);
		}
		try {
			String processInstanceId = orderService.saveOrder(order, orderDetailList, response, request);
			model.addAttribute("order", order);
			model.addAttribute("processInstanceId", processInstanceId);
		} catch (Exception e) {
			if(e instanceof EbStockException ) {
				model.addAttribute("tip", "stock_error");
			}
		}
		return "shop/confirmProductCase2";
	}
	
	/**
	 * 支付付款
	 * @param processInstanceId
	 * @param orderId
	 * @param out
	 */
	@RequestMapping("/pay.do")
	public void pay(String processInstanceId, Long orderId, PrintWriter out) {
		orderService.pay(processInstanceId, orderId);
		out.write("success");
	}
}
