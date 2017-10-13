package com.fuyi.ecps.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.service.EbSkuService;

@Service
public class EbSkuServiceImpl implements EbSkuService {
	
	@Autowired
	private EbSkuDao skuDao;

	public EbSku getSkuById(Long skuId) {
		return skuDao.getSkuById(skuId);
	}


}
