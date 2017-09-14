package com.fuyi.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbItemClobDao;
import com.fuyi.ecps.dao.EbParaValueDao;
import com.fuyi.ecps.model.EbItemClob;
import com.fuyi.ecps.model.EbParaValue;

@Repository
public class EbItemClobDaoImpl extends SqlSessionDaoSupport implements EbItemClobDao {

	String ns = "com.fuyi.ecps.sqlMap.EbItemClobMapper.";

	public void saveItemClob(EbItemClob itemClob, Long itemId) {
		itemClob.setItemId(itemId);
		getSqlSession().insert(ns + "insert", itemClob);
	}

}
