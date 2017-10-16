package com.fuyi.ecps.dao;

import java.util.List;
import java.util.Map;

import com.fuyi.ecps.model.EbSku;

public interface EbSkuDao {

	void saveSku(List<EbSku> skuList, long itemId);
	
	EbSku getSkuById(Long skuId);
	
	EbSku getSkuDetailById(Long skuId);
	
	int updateStock(Map<String, Object> map);
}
