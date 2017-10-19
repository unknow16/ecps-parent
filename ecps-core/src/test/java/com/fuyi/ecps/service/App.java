package com.fuyi.ecps.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		FlowService fs = (FlowService) ctx.getBean("flowServiceImpl");
		fs.deployFlow();
	}
}
