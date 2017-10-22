package com.fuyi.ecps.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbConsoleLogDao;
import com.fuyi.ecps.dao.EbItemClobDao;
import com.fuyi.ecps.dao.EbItemDao;
import com.fuyi.ecps.dao.EbParaValueDao;
import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.model.EbConsoleLog;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.EbItemClob;
import com.fuyi.ecps.model.EbParaValue;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.service.EbItemService;
import com.fuyi.ecps.stub.EbWSItemService;
import com.fuyi.ecps.stub.EbWSItemServiceService;
import com.fuyi.ecps.utils.Page;

@Service
public class EbItemServiceImpl implements EbItemService {

	@Autowired
	private EbItemDao itemDao;
	
	@Autowired
	private EbParaValueDao paraValueDao;
	
	@Autowired
	private EbSkuDao skuDao;
	
	@Autowired
	private EbItemClobDao itemClobDao;
	
	@Autowired
	private EbConsoleLogDao consoleLogDao;
	
	/**
	 * 根据条件查询商品
	 */
	public Page selectItemByCondition(QueryCondition qc) {
		//总记录数
		Integer count = itemDao.selectItemByConditionCount(qc);
		
		Page page = new Page();
		page.setPageNo(qc.getPageNo());
		page.setTotalCount(count);
		
		qc.setStartNum(page.getStartNum());
		qc.setEndNum(page.getEndNum());
		
		List<EbItem> itemList = itemDao.selectItemByCondition(qc);
		
		page.setList(itemList);
		
		return page;
	}

	public void saveItem(EbItem item, EbItemClob itemClob,
			List<EbParaValue> paraList, List<EbSku> skuList) {
		itemDao.saveItem(item);
		paraValueDao.saveParaValue(paraList, item.getItemId());
		itemClobDao.saveItemClob(itemClob, item.getItemId());
		skuDao.saveSku(skuList, item.getItemId());
		
	}

	public List<EbItem> listItem(String price, Long brandId, String paraStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(price) && !StringUtils.equals(price, "")) {
			String[] prices = price.split("-");
			map.put("minPrice", prices[0]);
			map.put("maxPrice", prices[1]);
		}
		
		map.put("brandId", brandId);
		
		if(StringUtils.isNotBlank(paraStr) && !StringUtils.equals(paraStr, "")) {
			String[] paraList = paraStr.split(",");
			map.put("paraList", paraList);
		}
		return itemDao.listItem(map);
	}

	public EbItem selectItemDetailById(Long itemId) {
		return itemDao.selectItemDetailById(itemId);
	}

	public String publishItem(Long itemId, String password) {
		//创建服务访问点集合的对象
		EbWSItemServiceService wsItemServiceService = new EbWSItemServiceService();
		//获取服务访问点绑定的类，使用服务访问点的name的值前面的get方法 getEbWSItemServicePort
		EbWSItemService wsItemService = wsItemServiceService.getEbWSItemServicePort();
		
		return wsItemService.publishItem(itemId, password);
	}

	@Override
	public void auditItem(Long itemId, Short auditStatus, String notes) {
		//更新商品审核状态
		EbItem item = new EbItem();
		item.setItemId(itemId);
		item.setAuditStatus(auditStatus);
		itemDao.updateItem(item);
		
		//记录审核日志
		EbConsoleLog log = new EbConsoleLog();
		log.setNotes(notes);
		log.setEntityId(itemId);
		log.setEntityName("商品表");
		log.setOpTime(new Date());
		if(auditStatus.shortValue() == 1) {
			log.setOpType("审核商品通过");
		} else {
			log.setOpType("审核商品不通过");
		}
		log.setTableName("EB_ITEM");
		log.setUserId(1l);
		consoleLogDao.saveConsoleLog(log);
	}

	@Override
	public void showItem(Long itemId, Short showStatus) {
		//更新商品上下架状态
		EbItem item = new EbItem();
		item.setItemId(itemId);
		item.setShowStatus(showStatus);
		item.setOnSaleTime(new Date());
		item.setUpdateTime(new Date());
		itemDao.updateItem(item);
		
		//记录日志
		EbConsoleLog log = new EbConsoleLog();
		log.setEntityId(itemId);
		log.setEntityName("商品表");
		log.setOpTime(new Date());
		if(showStatus.shortValue() == 1) {
			log.setOpType("商品下架");
		} else {
			log.setOpType("商品上架");
		}
		log.setTableName("EB_ITEM");
		log.setUserId(1l);
		consoleLogDao.saveConsoleLog(log);
	}

}
