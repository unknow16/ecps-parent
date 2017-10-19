package com.fuyi.ecps.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FMUtils {

	public void outputFile(String ftlName, String fileName, Map<String, Object> map) throws Exception {
		//创建fm的配置
		Configuration cf = new Configuration();
		//设置默认编码格式
		cf.setDefaultEncoding("UTF-8");
		//设置模版的包路径
		cf.setClassForTemplateLoading(this.getClass(), "/com/fuyi/ecps/ftl");
		//获得包的模版
		Template template = cf.getTemplate(ftlName);
		
		String path = "E:\\workspace-eclipse-mars\\ecps-parent\\ecps-portal\\src\\main\\webapp\\static";
		
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(path + "/" + fileName)), "UTF-8"));
		template.process(map, writer);
	}
}
