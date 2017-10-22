package com.fuyi.ecps.dao;

import java.util.List;
import java.util.Map;

import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.QueryCondition;

public interface EbItemDao {
	
	public List<EbItem> selectItemByCondition(QueryCondition qc);
	
	public Integer selectItemByConditionCount(QueryCondition qc);

	public void saveItem(EbItem item);
	
	public List<EbItem> listItem(Map<String, Object> map);
	
	public EbItem selectItemDetailById(Long itemId);
	
	public void updateItem(EbItem item);
}
