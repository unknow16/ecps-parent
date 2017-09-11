package com.rl.ecps.service;

import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.utils.Page;


public interface EbItemService {
	
	public Page selectItemByCondition(QueryCondition qc);
	
}
