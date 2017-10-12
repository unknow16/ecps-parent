package com.fuyi.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbItemClobDao;
import com.fuyi.ecps.model.EbItemClob;

@Repository
public class EbItemClobDaoImpl extends SqlSessionDaoSupport implements EbItemClobDao {

	String ns = "com.fuyi.ecps.sqlMap.EbItemClobMapper.";

	public void saveItemClob(EbItemClob itemClob, Long itemId) {
		itemClob.setItemId(itemId);
		getSqlSession().insert(ns + "insert", itemClob);
	}

}
