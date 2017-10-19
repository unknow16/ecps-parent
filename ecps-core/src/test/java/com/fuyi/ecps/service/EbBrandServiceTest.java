package com.fuyi.ecps.service;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.service.impl.EbBrandServiceImpl;

public class EbBrandServiceTest {
	
	ApplicationContext ctx;
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans.xml");
	}

	@Test
	public void testSaveBrand() {
		EbBrandService service = (EbBrandService) ctx.getBean("ebBrandServiceImpl");
		EbBrand ebBrand = new EbBrand();
		ebBrand.setBrandId(33l);
		ebBrand.setBrandDesc("很大");
		ebBrand.setBrandName("苹果");
		ebBrand.setBrandSort(1);
		ebBrand.setImgs("http://www.baidu.com");
		ebBrand.setWebsite("http://www.baidu.com");
		service.saveBrand(ebBrand);
	}
	
	@Test
	public void testDeploy() {
		FlowService fs = (FlowService) ctx.getBean("flowServiceImpl");
		fs.deployFlow();
	}

	@Test
	public void testGetBrandById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectBrandByName() {
		fail("Not yet implemented");
	}

}
