package com.fuyi.ecps.dao;

import java.util.List;

import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.QueryCondition;

public interface EbItemDao {
	
	public List<EbItem> selectItemByCondition(QueryCondition qc);
	
	public Integer selectItemByConditionCount(QueryCondition qc);

}
