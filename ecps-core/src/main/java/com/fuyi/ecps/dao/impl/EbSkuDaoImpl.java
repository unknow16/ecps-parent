package com.fuyi.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbItemClobDao;
import com.fuyi.ecps.dao.EbParaValueDao;
import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.model.EbItemClob;
import com.fuyi.ecps.model.EbParaValue;
import com.fuyi.ecps.model.EbSku;

@Repository
public class EbSkuDaoImpl extends SqlSessionDaoSupport implements EbSkuDao {

	String ns = "com.fuyi.ecps.sqlMap.EbSkuMapper.";

	public void saveSku(List<EbSku> skuList, long itemId) {
		
	}


}
