package com.fuyi.ecps.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

public class FlowOrderListener implements TaskListener {

	private static final long serialVersionUID = -2385849158094755812L;

	@Override
	public void notify(DelegateTask delegateTask) {
		String key = delegateTask.getTaskDefinitionKey();
		delegateTask.setAssignee(key + "er");
	}

}
