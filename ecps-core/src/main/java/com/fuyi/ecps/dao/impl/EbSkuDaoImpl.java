package com.fuyi.ecps.dao.impl;

import java.util.List;
import java.util.Map;

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

	public EbSku getSkuById(Long skuId) {
		return this.getSqlSession().selectOne(ns + "selectByPrimaryKey", skuId);
	}

	public EbSku getSkuDetailById(Long skuId) {
		return this.getSqlSession().selectOne(ns + "selectSkuDetailById", skuId);
	}

	public int updateStock(Map<String, Object> map) {
		return this.getSqlSession().update(ns + "updateStock", map);
	}


}
