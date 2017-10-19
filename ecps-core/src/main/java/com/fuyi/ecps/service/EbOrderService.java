package com.fuyi.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fuyi.ecps.exception.EbStockException;
import com.fuyi.ecps.model.EbOrder;
import com.fuyi.ecps.model.EbOrderDetail;
import com.fuyi.ecps.model.TaskBean;

public interface EbOrderService {
	
	/**
	 * 保存订单
	 * @param order 订单
	 * @param orderDetailList 订单商品
	 * @param response
	 * @param request
	 * @return
	 * @throws EbStockException
	 */
	public String saveOrder(EbOrder order, List<EbOrderDetail> orderDetailList, 
			HttpServletResponse response, HttpServletRequest request) throws EbStockException;

	/**
	 * 买家付款
	 * @param processInstanceId
	 * @param orderId
	 */
	public void pay(String processInstanceId, Long orderId);

	/**
	 * 查询未付款订单
	 * @param isCall 是否已外呼
	 * @param assignee 待办人
	 * @return
	 */
	public List<TaskBean> selectNoPaidOrder(Short isCall, String assignee);
	
	/**
	 * 查询订单详情
	 * @param orderId
	 * @return
	 */
	public EbOrder selectOrderAndDetailById(Long orderId);

	/**
	 * 更新外呼状态
	 * @param orderId
	 */
	public void updateCall(Long orderId);

	/**
	 * 查询已付款订单
	 * @param assignee 待办人
	 * @return
	 */
	public List<TaskBean> selectPaidOrder(String assignee);
	
	/**
	 * 查询taskBean
	 * @param orderId
	 * @param taskId
	 * @return
	 */
	public TaskBean selectTaskBeanByOrderIdAndTaskId(Long orderId, String taskId);
	
	/**
	 * 办理任务
	 * @param taskId
	 * @param outcome 分支名
	 * @param orderId
	 */
	public void completeTask(String taskId, String outcome, Long orderId);
}
