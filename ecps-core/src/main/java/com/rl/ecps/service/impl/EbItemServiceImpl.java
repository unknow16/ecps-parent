package com.rl.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rl.ecps.dao.EbItemDao;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.service.EbItemService;
import com.rl.ecps.utils.Page;
@Service
public class EbItemServiceImpl implements EbItemService {

	@Autowired
	private EbItemDao itemDao;
	
	public Page selectItemByCondition(QueryCondition qc) {
		//查询当前条件下的总记录数
		Integer totalCount = itemDao.selectItemByConditionCount(qc);
		//创建分页的page对象
		Page page = new Page();
		page.setPageNo(qc.getPageNo());
		page.setTotalCount(totalCount);
		//获得开始行号和结束行号
		Integer startNum = page.getStartNum();
		Integer endNum = page.getEndNum();
		qc.setStartNum(startNum);
		qc.setEndNum(endNum);
		List<EbItem> itemList = itemDao.selectItemByCondition(qc);
		page.setList(itemList);
		return page;
	}

	

}
