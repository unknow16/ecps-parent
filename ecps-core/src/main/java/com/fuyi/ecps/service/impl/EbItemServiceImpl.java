package com.fuyi.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbItemDao;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.service.EbItemService;
import com.fuyi.ecps.utils.Page;

@Service
public class EbItemServiceImpl implements EbItemService {

	@Autowired
	private EbItemDao itemDao;
	
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

}
