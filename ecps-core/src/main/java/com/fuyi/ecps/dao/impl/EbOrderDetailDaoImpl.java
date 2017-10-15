package com.fuyi.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbOrderDetailDao;
import com.fuyi.ecps.model.EbOrderDetail;

@Repository
public class EbOrderDetailDaoImpl extends SqlSessionDaoSupport implements EbOrderDetailDao {

	String ns = "com.fuyi.ecps.sqlMap.EbOrderDetailMapper.";
	
	public void saveOrderDetail(EbOrderDetail orderDetail) {
		this.getSqlSession().insert(ns + "insert", orderDetail);
	}

}
