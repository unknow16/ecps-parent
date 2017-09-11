package com.rl.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rl.ecps.model.EbBrand;
import com.rl.ecps.model.EbFeature;
import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.service.EbBrandService;
import com.rl.ecps.service.EbFeatureService;
import com.rl.ecps.service.EbItemService;
import com.rl.ecps.utils.Page;

@Controller
@RequestMapping("/item")
public class EbItemController {
	
	@Autowired
	private EbItemService itemService;
	
	@Autowired
	private EbBrandService brandService;
	@Autowired
	private EbFeatureService featureService;
	/**
	 * 动态条件分页组合查询
	 * @param qc
	 * @param model
	 * @return
	 */
	@RequestMapping("/listItem.do")
	public String listItem(QueryCondition qc, Model model){
		List<EbBrand> bList = brandService.selectBrand();
		if(qc.getPageNo() == null){
			qc.setPageNo(1);
		}
		Page page = itemService.selectItemByCondition(qc);
		model.addAttribute("page", page);
		model.addAttribute("qc", qc);
		model.addAttribute("bList", bList);
		return "item/list";
	}
	@RequestMapping("/toAddItem.do")
	public String toAddItem(Model model){
		List<EbBrand> bList = brandService.selectBrand();
		List<EbFeature> commList = featureService.selectCommFeature();
		model.addAttribute("bList", bList);
		model.addAttribute("commList", commList);
		return "item/addItem";
	}
	
}
