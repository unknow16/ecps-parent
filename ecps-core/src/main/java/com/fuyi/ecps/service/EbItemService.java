package com.fuyi.ecps.service;

import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.utils.Page;


public interface EbItemService {
	
	public Page selectItemByCondition(QueryCondition qc);
	
}
