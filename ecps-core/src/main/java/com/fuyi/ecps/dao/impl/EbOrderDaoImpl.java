package com.fuyi.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbOrderDao;
import com.fuyi.ecps.model.EbOrder;

@Repository
public class EbOrderDaoImpl extends SqlSessionDaoSupport implements EbOrderDao {
	
	String ns = "com.fuyi.ecps.sqlMap.EbOrderMapper.";

	public void saveOrder(EbOrder order) {
		this.getSqlSession().insert(ns + "insert", order);
	}

	@Override
	public void updateOrder(EbOrder order) {
		this.getSqlSession().update(ns + "updateByPrimaryKeySelective", order);
	}

	@Override
	public EbOrder selectOrderById(Long orderId) {
		return this.getSqlSession().selectOne(ns + "selectByPrimaryKey", orderId);
	}

	@Override
	public EbOrder selectOrderAndDetailById(Long orderId) {
		return this.getSqlSession().selectOne(ns + "selectOrderAndDetailById", orderId);
	}

}
