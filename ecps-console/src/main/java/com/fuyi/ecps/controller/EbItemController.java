package com.fuyi.ecps.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.model.EbFeature;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.EbItemClob;
import com.fuyi.ecps.model.EbParaValue;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.model.EbSpecValue;
import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.service.EbBrandService;
import com.fuyi.ecps.service.EbFeatureService;
import com.fuyi.ecps.service.EbItemService;
import com.fuyi.ecps.utils.ECPSUtils;
import com.fuyi.ecps.utils.Page;

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
	 * 上下架商品页
	 * @param qc
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 去添加商品页
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddItem.do")
	public String toAddItem(Model model) {
		//所有品牌
		List<EbBrand> brandList = brandService.selectBrand();
		//商品的属性，不影响价格
		List<EbFeature> commList = featureService.selectCommFeature();
		//影响价格的属性
		List<EbFeature> specList = featureService.selectSpecFeature();
		
		model.addAttribute("brandList", brandList);
		model.addAttribute("commList", commList);
		model.addAttribute("specList", specList);
		
		return "item/addItem";
	}
	
	/**
	 * 添加商品
	 * @param item
	 * @param itemClob
	 * @param request
	 * @param divNum
	 * @return
	 */
	@RequestMapping("/addItem.do")
	public String addItem(EbItem item, EbItemClob itemClob, HttpServletRequest request, Integer divNum) {
		item.setItemNo(new SimpleDateFormat("yyyyMMddHHmmssSSSS").format(new Date()));
		
		List<EbFeature> commFeatureList = featureService.selectCommFeature();
		List<EbParaValue> paraValueList = new ArrayList<EbParaValue>();
		for(EbFeature feature : commFeatureList) {
			Long featureId = feature.getFeatureId();
			
			if(feature.getInputType() == 3) { //多选checkbox
				String[] valsArr = request.getParameterValues(featureId + "");
				if(valsArr != null && valsArr.length > 0 ){
					
					String vals = "";
					for(String val : valsArr) {
						vals += val + ",";
					}
					vals = vals.substring(0, vals.length()-1);
					EbParaValue paraValue = new EbParaValue();
					paraValue.setFeatureId(featureId);
					paraValue.setParaValue(vals);
					paraValueList.add(paraValue);
				}
				
			} else {
				String val = request.getParameter(featureId + "");
				if(StringUtils.isNotBlank(val)){
					EbParaValue paraValue = new EbParaValue();
					paraValue.setFeatureId(featureId);
					paraValue.setParaValue(val);
					paraValueList.add(paraValue);
				}
			}
		}
		
		List<EbSku> skuList = new ArrayList<EbSku>();
		for(int i=1; i<=divNum; i++) {
			String skuPrice = request.getParameter("skuPrice" + i);
			String stock = request.getParameter("stockInventory" + i);
			if(StringUtils.isNotBlank(stock) && StringUtils.isNotBlank(skuPrice)) {
				String skuType = request.getParameter("skuType" + i);
				String showStatus = request.getParameter("showStatus" + i);
				String sort = request.getParameter("sort" + i);
				String marketPrice = request.getParameter("marketPrice" + i);
				String skuUpperLimit = request.getParameter("skuUpperLimit" + i);
				String sku = request.getParameter("sku" + i);
				String location = request.getParameter("location" + i);
				
				EbSku ebSku = new EbSku();
				ebSku.setSkuPrice(new BigDecimal(skuPrice));
				ebSku.setStockInventory(new Integer(stock));
				
				if(StringUtils.isNotBlank(skuType) && !StringUtils.equals(skuType, "")){
					ebSku.setSkuType(new Short(skuType));
				}
				if(StringUtils.isNotBlank(showStatus) && !StringUtils.equals(showStatus, "")){
					ebSku.setShowStatus(new Short(showStatus));
				}
				if(StringUtils.isNotBlank(sort) && !StringUtils.equals(sort, "")){
					ebSku.setSkuSort(new Integer(sort));
				}
				if(StringUtils.isNotBlank(marketPrice) && !StringUtils.equals(marketPrice, "")){
					ebSku.setMarketPrice(new BigDecimal(marketPrice));
				}
				if(StringUtils.isNotBlank(skuUpperLimit) && !StringUtils.equals(skuUpperLimit, "")){
					ebSku.setSkuUpperLimit(new Integer(skuUpperLimit));
				}
				ebSku.setSku(sku);
				ebSku.setLocation(location);
				
				//获取当前sku的规格值
				List<EbSpecValue> specValueList = new ArrayList<EbSpecValue>();
				List<EbFeature> specFeature = featureService.selectSpecFeature();
				for(EbFeature feature : specFeature) {
					Long featureId = feature.getFeatureId();
					String val = request.getParameter(featureId + "specradio" + i);
					
					EbSpecValue specVal = new EbSpecValue();
					specVal.setFeatureId(featureId);
					specVal.setSpecValue(val);
					specValueList.add(specVal);
				}
				
				ebSku.setSpecValueList(specValueList);
				skuList.add(ebSku);
			}
		}
		
		itemService.saveItem(item, itemClob, paraValueList, skuList);
		return "redirect:listItem.do?showStatus=1&auditStatus=1";
	}
	
	/**
	 * 商品审核列表
	 * @param qc
	 * @param model
	 * @return
	 */
	@RequestMapping("/listAudit.do")
	public String listAudit(QueryCondition qc, Model model) {
		if(qc.getPageNo() == null) {
			qc.setPageNo(1);
		}
		Page page = itemService.selectItemByCondition(qc);
		List<EbBrand> brandList = brandService.selectBrand();
		
		model.addAttribute("qc", qc);
		model.addAttribute("page", page);
		model.addAttribute("brandList", brandList);
		return "item/listAudit";
	}
	
	/**
	 * 审核商品
	 * @param itemId
	 * @param auditStatus
	 * @param notes
	 * @return
	 */
	@RequestMapping("/auditItem.do")
	public String auditItem(Long itemId, Short auditStatus, String notes) {
		itemService.auditItem(itemId, auditStatus, notes);
		return "redirect:listAudit.do?auditStatus=0&showStatus=1"; //showStatus=1为下架
	}
	
	/**
	 * 上下架商品
	 * @param itemId
	 * @param showStatus
	 * @return
	 */
	@RequestMapping("/showItem.do")
	public String showItem(Long itemId, Short showStatus){
		itemService.showItem(itemId, showStatus);
		String flag = "0";
		if(showStatus.shortValue() == 0) {
			flag = "1";
		}
		return "redirect:listItem.do?showStatus=" + flag + "&auditStatus=1";
	}
	
	/**
	 * 商品属性列表
	 * @return
	 */
	@RequestMapping("/listFeature.do")
	public String listFeature() {
		return "item/listfeature";
	}
	
	/**
	 * 发布商品静态化页面
	 * @param itemId
	 * @param out
	 */
	@RequestMapping("/publishItem.do")
	public void publishItem(Long itemId, PrintWriter out) {
		
		String password = ECPSUtils.readProp("ws_password");
		String result = itemService.publishItem(itemId, password);
		out.write(result);
	}
}
