package com.fuyi.ecps.service;

import java.util.List;

import com.fuyi.ecps.model.TaskBean;

public interface FlowService {

	/**
	 * 部署流程定义
	 */
	public void deployFlow();
	
	/**
	 * 启动一个流程实例
	 * 在提交一个订单时，开启一个实例
	 * @param orderId
	 * @return
	 */
	public String startProcessInstance(Long orderId);
	
	/**
	 * 完成任务
	 * @param processInstanceId
	 * @param outcome
	 */
	public void completeTaskByProcessInstanceId(String processInstanceId, String outcome);
	
	/**
	 * 查询taskBean
	 * @param assingnee 待办人
	 * @return
	 */
	public List<TaskBean> selectTaskBeanByAssignee(String assingnee);
	
	/**
	 * 查询taskBean 
	 * @param taskId 任务id
	 * @return
	 */
	public TaskBean selectTaskBeanByTaskId(String taskId);
	
	/**
	 * 办理任务
	 * @param taskId
	 * @param outcome
	 */
	public void completeTaskByTaskId(String taskId, String outcome);
}
