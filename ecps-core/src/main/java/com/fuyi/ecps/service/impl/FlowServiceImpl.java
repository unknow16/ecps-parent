package com.fuyi.ecps.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.model.TaskBean;
import com.fuyi.ecps.service.FlowService;

@Service
public class FlowServiceImpl implements FlowService {

	@Autowired
	private RepositoryService repositoryService;
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private TaskService taskService;
	
	@Override
	public void deployFlow() {
		DeploymentBuilder builder = repositoryService.createDeployment();
		builder.addClasspathResource("com/fuyi/ecps/diagrams/OrderFlow.bpmn");
		builder.addClasspathResource("com/fuyi/ecps/diagrams/OrderFlow.png");
		builder.deploy();
	}

	@Override
	public String startProcessInstance(Long orderId) {
		ProcessInstance pi = runtimeService.startProcessInstanceByKey("OrderFlow", orderId+"");
		return pi.getId();
	}

	@Override
	public void completeTaskByProcessInstanceId(String processInstanceId, String outcome) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("outcome", outcome);
		Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
		taskService.complete(task.getId(), map);
	}

	@Override
	public List<TaskBean> selectTaskBeanByAssignee(String assignee) {
		List<Task> taskList = taskService.createTaskQuery()
		.processDefinitionKey("OrderFlow")
		.taskAssignee(assignee)
		.orderByTaskCreateTime()
		.desc()
		.list();
		List<TaskBean> tbList = new ArrayList<TaskBean>();
		ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery();
		for (Task task : taskList) {
			TaskBean taskBean = new TaskBean();
			taskBean.setTask(task);
			ProcessInstance pi = query.processInstanceId(task.getProcessInstanceId()).singleResult();
			taskBean.setBusinessKey(pi.getBusinessKey());
			tbList.add(taskBean);
		}
		return tbList;
	}

	@Override
	public TaskBean selectTaskBeanByTaskId(String taskId) {
		Task task = taskService.createTaskQuery().processDefinitionKey("OrderFlow")
				.taskId(taskId).singleResult();
		TaskBean tb = new TaskBean();
		tb.setTask(task);
		tb.setOutcomes(getOutcomes(task));
		return tb;
	}

	public List<String> getOutcomes(Task task) {
		List<String> outcomes = new ArrayList<String>();
		
		//获得流程定义的对象
		ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(task.getProcessDefinitionId());
		//获得流程实例对象
		ProcessInstance pi = runtimeService.createProcessInstanceQuery().processDefinitionKey("OrderFlow").processInstanceId(task.getProcessInstanceId()).singleResult();
		//获得活动的节点
		ActivityImpl ai = processDefinition.findActivity(pi.getActivityId());
		//获得当前活动节点往外走的路线
		List<PvmTransition> ptList = ai.getOutgoingTransitions();
		for (PvmTransition pt : ptList) {
			String name = (String) pt.getProperty("name");
			outcomes.add(name);
		}
		return outcomes;
	}

	@Override
	public void completeTaskByTaskId(String taskId, String outcome) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("outcome", outcome);
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		taskService.complete(task.getId(), map);
	}
}
