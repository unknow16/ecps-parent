package com.rl.ecps.dao;

import java.util.List;

import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.QueryCondition;

public interface EbItemDao {
	
	public List<EbItem> selectItemByCondition(QueryCondition qc);
	
	
	public Integer selectItemByConditionCount(QueryCondition qc);

}
