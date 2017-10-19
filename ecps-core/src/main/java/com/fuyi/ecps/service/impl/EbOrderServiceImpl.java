package com.fuyi.ecps.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbOrderDao;
import com.fuyi.ecps.dao.EbOrderDetailDao;
import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.exception.EbStockException;
import com.fuyi.ecps.model.EbOrder;
import com.fuyi.ecps.model.EbOrderDetail;
import com.fuyi.ecps.model.TaskBean;
import com.fuyi.ecps.service.EbCartService;
import com.fuyi.ecps.service.EbOrderService;
import com.fuyi.ecps.service.FlowService;

@Service
public class EbOrderServiceImpl implements EbOrderService {
	
	@Autowired
	private EbOrderDao orderDao;
	
	@Autowired
	private EbOrderDetailDao orderDetailDao;
	
	@Autowired
	private EbSkuDao skuDao;
	
	@Autowired
	private EbCartService cartService;
	
	@Autowired
	private FlowService flowService;

	/**
	 * 保存订单和订单详情
	 */
	public String saveOrder(EbOrder order, List<EbOrderDetail> orderDetailList, 
			HttpServletResponse response, HttpServletRequest request) throws EbStockException {
		//保存订单,其中mapper文件中配置返回主键orderId到order对象中
		orderDao.saveOrder(order);
		
		Map<String, Object> map = new HashMap<String, Object>();
		for(EbOrderDetail detail:orderDetailList) {
			//保存订单详情
			detail.setOrderId(order.getOrderId());
			orderDetailDao.saveOrderDetail(detail);
			
			//减库存
			map.put("skuId", detail.getSkuId());
			map.put("quantity", detail.getQuantity());
			int flag = skuDao.updateStock(map);
			if(flag == 0) {
				throw new EbStockException("库存不足");
			}
		}
		//清空购物车
		cartService.clearCart(request, response);
		//开启一个订单流程实例，到未付款节点
		String processInstanceId = flowService.startProcessInstance(order.getOrderId());
		return processInstanceId;
	}

	@Override
	public void pay(String processInstanceId, Long orderId) {
		//更新订单为已付款状态
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsPaid((short)1);
		orderDao.updateOrder(order);
		//订单流程到已付款节点
		flowService.completeTaskByProcessInstanceId(processInstanceId, "支付");
	}

	@Override
	public List<TaskBean> selectNoPaidOrder(Short isCall, String assingnee) {
		List<TaskBean> tbList = flowService.selectTaskBeanByAssignee(assingnee);
		List<TaskBean> result = new ArrayList<TaskBean>();
		for (TaskBean taskBean : tbList) {
			EbOrder order = orderDao.selectOrderById(new Long(taskBean.getBusinessKey()));
			if(order.getIsCall().shortValue() == isCall.shortValue()) {
				taskBean.setOrder(order);
				result.add(taskBean);
			}
		}
		return result;
	}

	@Override
	public EbOrder selectOrderAndDetailById(Long orderId) {
		return orderDao.selectOrderAndDetailById(orderId);
	}

	@Override
	public void updateCall(Long orderId) {
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsCall((short)1);
		orderDao.updateOrder(order);
	}

	@Override
	public List<TaskBean> selectPaidOrder(String assignee) {
		List<TaskBean> tbList = flowService.selectTaskBeanByAssignee(assignee);
		List<TaskBean> result = new ArrayList<TaskBean>();
		for (TaskBean taskBean : tbList) {
			EbOrder order = orderDao.selectOrderById(new Long(taskBean.getBusinessKey()));
			taskBean.setOrder(order);
			result.add(taskBean);
		}
		return result;
	}

	@Override
	public TaskBean selectTaskBeanByOrderIdAndTaskId(Long orderId, String taskId) {
		EbOrder order = orderDao.selectOrderAndDetailById(orderId);
		TaskBean tb = flowService.selectTaskBeanByTaskId(taskId);
		tb.setOrder(order);
		return tb;
	}

	@Override
	public void completeTask(String taskId, String outcome, Long orderId) {
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setUpdateTime(new Date());
		flowService.completeTaskByTaskId(taskId, outcome);
	}

}
