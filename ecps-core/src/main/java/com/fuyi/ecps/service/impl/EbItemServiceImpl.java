package com.fuyi.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbItemClobDao;
import com.fuyi.ecps.dao.EbItemDao;
import com.fuyi.ecps.dao.EbParaValueDao;
import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.EbItemClob;
import com.fuyi.ecps.model.EbParaValue;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.service.EbItemService;
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

}
