package com.fuyi.ecps.controller;

import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fuyi.ecps.utils.ECPSUtils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

@Controller
@RequestMapping("/upload")
public class EbUploadController {

	@RequestMapping("/uploadPic.do")
	public void uploadPic(HttpServletRequest request, Writer out) {
	
		//将request转换成复杂类型
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
		
		//获得文件map，可能多个
		Map<String, MultipartFile> fileMap = req.getFileMap();
		//获得文件名keySet
		Set<String> keySet = fileMap.keySet();
		Iterator<String> iterator = keySet.iterator();
		//获得文件名
		String fileInputName = iterator.next();
		//根据文件key,获得文件对象
		MultipartFile mf = fileMap.get(fileInputName);
		
		try {
			//文件字节数组
			byte[] bs = mf.getBytes();
			
			String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			Random random = new Random();
			for(int i=0; i<3; i++) {
				fileName = fileName + random.nextInt(10);
			}
			
			//原文件名
			String originalFilename = mf.getOriginalFilename();
			//文件后缀
			String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			//绝对路径，展示使用
			String realPath = ECPSUtils.readProp("file_server_url") + "/upload/" + fileName + fileSuffix;
			//相对路径，存数据库
			String relativePath = "/upload/" + fileName + fileSuffix;
			
			//创建jersy的客户端
			Client client = Client.create();
			//创建web资源对象
			WebResource resource = client.resource(realPath);
			//上传
			resource.put(bs);
			
			//返回json
			JSONObject jo = new JSONObject();
			jo.accumulate("realPath", realPath);
			jo.accumulate("relativePath", relativePath);
			String result = jo.toString();
			out.write(result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
