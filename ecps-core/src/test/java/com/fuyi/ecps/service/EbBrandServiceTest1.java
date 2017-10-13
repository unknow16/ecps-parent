package com.fuyi.ecps.service;

import static org.junit.Assert.fail;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.utils.FMUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class EbBrandServiceTest1 {
	
	@Autowired
	private EbBrandService service;
	
	@Autowired
	private EbItemService itemService;

	@Test
	public void testSaveBrand() {
		EbBrand ebBrand = new EbBrand();
		ebBrand.setBrandId(11l);
		ebBrand.setBrandDesc("很大大");
		ebBrand.setBrandName("鸭梨");
		ebBrand.setBrandSort(1);
		ebBrand.setImgs("http://www.baidu.com");
		ebBrand.setWebsite("http://www.baidu.com");
		service.saveBrand(ebBrand);
	}
	
	@Test
	public void testGeneratePage() throws Exception {
		EbItem item = itemService.selectItemDetailById(3061l);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", item);
		FMUtils fm = new FMUtils();
		fm.outputFile("productDetail.ftl", item.getItemId() + ".html", map);
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
