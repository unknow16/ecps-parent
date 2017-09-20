package com.fuyi.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.model.EbSpecValue;

@Repository
public class EbSkuDaoImpl extends SqlSessionDaoSupport implements EbSkuDao {

	String ns = "com.fuyi.ecps.sqlMap.EbSkuMapper.";
	String ns1 = "com.fuyi.ecps.sqlMap.EbSpecValueMapper.";

	public void saveSku(List<EbSku> skuList, long itemId) {
		SqlSession session = this.getSqlSession();
		for(EbSku sku : skuList) {
			//设置商品外键
			sku.setItemId(itemId);
			//保存sku并且返回skuid
			session.insert(ns + "insert", sku);
			
			List<EbSpecValue> specValueList = sku.getSpecValueList();
			for(EbSpecValue sv : specValueList) {
				sv.setSkuId(sku.getSkuId());
				session.insert(ns1 + "insert", sv);
			}
		}
	}


}
