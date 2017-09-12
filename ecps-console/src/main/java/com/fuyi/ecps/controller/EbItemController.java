package com.fuyi.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.service.EbBrandService;
import com.fuyi.ecps.service.EbItemService;
import com.fuyi.ecps.utils.Page;

@Controller
@RequestMapping("/item")
public class EbItemController {
	
	@Autowired
	private EbItemService itemService;
	
	@Autowired
	private EbBrandService brandService;

	@RequestMapping("/listItem.do")
	public String listItem(QueryCondition qc, Model model) {
		if(qc.getPageNo() == null) {
			qc.setPageNo(1);
		}
		Page page = itemService.selectItemByCondition(qc);
		List<EbBrand> brandList = brandService.selectBrand();
		
		model.addAttribute("qc", qc);
		model.addAttribute("page", page);
		model.addAttribute("brandList", brandList);
		
		return "item/list";
	}
}