package com.fuyi.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbOrder;
import com.fuyi.ecps.model.TaskBean;
import com.fuyi.ecps.service.EbOrderService;

@RequestMapping("/order")
@Controller
public class EbOrderController {
	
	@Autowired
	private EbOrderService orderService;

	@RequestMapping("/index.do")
	public String index() {
		return "order/index";
	}
	
	/**
	 * 未付款单列表
	 * @param isCall 是否已外呼
	 * @param assignee 待办人
	 * @param model
	 * @return
	 */
	@RequestMapping("/listNoPay.do")
	public String listNoPay(Short isCall, String assignee, Model model) {
		List<TaskBean> result = orderService.selectNoPaidOrder(isCall, assignee);
		model.addAttribute("noPaidOrderList", result);
		model.addAttribute("isCall", isCall);
		return "order/orderPay/orderPay";
	}
	
	/**
	 * 未付款单中查看单详情
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectOrderAndDetail.do")
	public String selectOrderAndDetail(Long orderId, Model model) {
		EbOrder order = orderService.selectOrderAndDetailById(orderId);
		model.addAttribute("order", order);
		return "order/orderPay/detail";
	}
	
	/**
	 * 进行外呼
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/callOrder.do")
	public String callOrder(Long orderId) {
		orderService.updateCall(orderId);
		return "redirect:/order/listNoPay.do?isCall=1&assignee=noPaidOrderer";
	}
	
	/**
	 * 已付款单列表
	 * @param assignee
	 * @param model
	 * @return
	 */
	@RequestMapping("/listOrderCall.do")
	public String listOrderCall(String assignee, Model model) {
		List<TaskBean> result = orderService.selectPaidOrder(assignee);
		model.addAttribute("paidOrderList", result);
		return "order/orderCall/orderCall";
	}
	
	/**
	 * 查询已付款单详情
	 * @param orderId
	 * @param taskId
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectPaidOrderAndDetail.do")
	public String selectPaidOrderAndDetail(Long orderId, String taskId, Model model) {
		TaskBean tb = orderService.selectTaskBeanByOrderIdAndTaskId(orderId, taskId);
		model.addAttribute("tb", tb);
		return "order/orderCall/detail";
	}
	
	/**
	 * 已付款可选操作()
	 * @param taskId
	 * @param outcome
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/completeTask.do")
	public String completeTask(String taskId, String outcome, Long orderId) {
		orderService.completeTask(taskId, outcome, orderId);
		return "redirect:listOrderCall.do?assignee=paidOrderer";
	}
}
