package com.fuyi.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.model.EbFeature;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.service.EbBrandService;
import com.fuyi.ecps.service.EbFeatureService;
import com.fuyi.ecps.service.EbItemService;

@Controller
@RequestMapping("/item")
public class EbItemController {
	
	@Autowired
	private EbBrandService brandService;
	
	@Autowired
	private EbFeatureService featureService;
	
	@Autowired
	private EbItemService itemService;
	
	@RequestMapping("toIndex.do")
	public String toIndex(Model model) {
		List<EbBrand> brandList = brandService.selectBrand();
		List<EbFeature> IsSelFeatureList = featureService.selectIsSelFeature();
		
		model.addAttribute("brandList", brandList);
		model.addAttribute("IsSelFeatureList", IsSelFeatureList);
		return "index";
	}
	
	@RequestMapping("listItem.do")
	public String listItem(String price, Long brandId, String paraStr, Model model) {
		List<EbItem> itemList = itemService.listItem(price, brandId, paraStr);
		model.addAttribute("itemList", itemList);
		return "phoneClassification";
	}
}
