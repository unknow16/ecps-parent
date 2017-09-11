package com.fuyi.ecps.controller;

import java.io.IOException;
import java.io.Writer;
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

	/**
	 * 商品管理
	 * @return
	 */
	@RequestMapping("/toItemIndex.do")
	public String toItemIndex() {
		return "item/index";
	}
	
	/**
	 * 品牌列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/listBrand.do")
	public String listBrand(Model model) {
		List<EbBrand> brandList = ebBrandService.selectBrand();
		model.addAttribute("brandList", brandList);
		return "item/listbrand";
	}
	
	/**
	 * 去添加品牌页
	 * @return
	 */
	@RequestMapping("/toAddBrand.do")
	public String toAddBrand() {
		return "item/addbrand";
	}
	
	/**
	 * 校验品牌重复
	 * @param brandName
	 */
	@RequestMapping("/validBrandName.do")
	public void validBrandName(String brandName, Writer out) {
		List<EbBrand> bList = ebBrandService.selectBrandByName(brandName);
		String flag = "no";
		if(bList.size() > 0) {
			flag = "yes";
		}
		try {
			out.write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加品牌
	 * @param brand
	 * @return
	 */
	@RequestMapping("/addBrand.do")
	public String addBrand(EbBrand brand) {
		ebBrandService.saveBrand(brand);;
		return "redirect:listBrand.do";
	}
	
	@RequestMapping("/getBrand.do")
	public String getBrand(Long brandId, Model model) {
		EbBrand brand = ebBrandService.getBrandById(brandId);
		model.addAttribute("brand", brand);
		return "item/editbrand";
	}
	
	@RequestMapping("/deleteBrand.do")
	public String deleteBrand(Long brandId) {
		ebBrandService.deleteBrand(brandId);
		return "redirect:listBrand.do";
	}
	
	@RequestMapping("/updateBrand.do")
	public String updateBrand(EbBrand brand) {
		ebBrandService.updateBrand(brand);
		return "redirect:listBrand.do";
	}
}
