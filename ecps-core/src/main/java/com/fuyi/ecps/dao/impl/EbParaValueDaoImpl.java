package com.fuyi.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbParaValueDao;
import com.fuyi.ecps.model.EbParaValue;

@Repository
public class EbParaValueDaoImpl extends SqlSessionDaoSupport implements EbParaValueDao {

	String ns = "com.fuyi.ecps.sqlMap.EbParaValueMapper.";
	
	public void saveParaValue(List<EbParaValue> paraValueList, long itemId) {
		SqlSession session = this.getSqlSession();
		for(EbParaValue value : paraValueList) {
			value.setItemId(itemId);
			session.insert(ns + "insert", value);
		}
	}

}
