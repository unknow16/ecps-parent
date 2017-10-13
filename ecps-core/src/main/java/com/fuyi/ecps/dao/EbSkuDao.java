package com.fuyi.ecps.dao;

import java.util.List;

import com.fuyi.ecps.model.EbSku;

public interface EbSkuDao {

	void saveSku(List<EbSku> skuList, long itemId);
	
	EbSku getSkuById(Long skuId);
}
