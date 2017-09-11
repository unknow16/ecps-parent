package com.fuyi.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.service.EbBrandService;

@Controller
@RequestMapping("/brand")
public class EbBrandController {
	
	@Autowired
	private EbBrandService ebBrandService;

	@RequestMapping("/toItemIndex.do")
	public String toItemIndex() {
		return "item/index";
	}
	
	@RequestMapping("/listBrand.do")
	public String listBrand(Model model) {
		List<EbBrand> brandList = ebBrandService.selectBrand();
		model.addAttribute("brandList", brandList);
		return "item/listbrand";
	}
	
	@RequestMapping("/toAddBrand.do")
	public String toAddBrand() {
		return "item/addbrand";
	}
}
