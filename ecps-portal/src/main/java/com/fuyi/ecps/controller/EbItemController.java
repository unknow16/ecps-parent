package com.fuyi.ecps.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.model.EbFeature;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.service.EbBrandService;
import com.fuyi.ecps.service.EbFeatureService;
import com.fuyi.ecps.service.EbItemService;
import com.fuyi.ecps.service.EbSkuService;
import com.fuyi.ecps.utils.ECPSUtils;

@Controller
@RequestMapping("/item")
public class EbItemController {
	
	@Autowired
	private EbBrandService brandService;
	
	@Autowired
	private EbFeatureService featureService;
	
	@Autowired
	private EbItemService itemService;
	
	@Autowired
	private EbSkuService skuService;
	
	@RequestMapping("/toIndex.do")
	public String toIndex(Model model) {
		List<EbBrand> brandList = brandService.selectBrand();
		List<EbFeature> IsSelFeatureList = featureService.selectIsSelFeature();
		
		model.addAttribute("brandList", brandList);
		model.addAttribute("IsSelFeatureList", IsSelFeatureList);
		return "index";
	}
	
	@RequestMapping("/listItem.do")
	public String listItem(String price, Long brandId, String paraStr, Model model) {
		List<EbItem> itemList = itemService.listItem(price, brandId, paraStr);
		
		for (EbItem ebItem : itemList) {
			ebItem.setImgs("/upload/20171012174623176881.jpg");
		}
		model.addAttribute("itemList", itemList);
		return "phoneClassification";
	}
	
	/**
	 * 商品详情
	 * @param itemId
	 * @param model
	 * @return
	 */
	@RequestMapping("/productDetail.do")
	public String productDetail(Long itemId, Model model) {
		EbItem item = itemService.selectItemDetailById(itemId);
		model.addAttribute("item", item);
		return "productDetail";
	}
	
	
	@RequestMapping("/getSkuById.do")
	public void getSkuById(Long skuId, HttpServletResponse resp) {
		EbSku sku = skuService.getSkuById(skuId);
		JSONObject jo = new JSONObject();
		jo.accumulate("sku", sku);
		
		ECPSUtils.printJSON(jo.toString(), resp);
	}
}
