package com.fuyi.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbShipAddrDao;
import com.fuyi.ecps.model.EbShipAddr;

@Repository
public class EbShipAddrDaoImpl extends SqlSessionDaoSupport implements EbShipAddrDao {

	String ns = "com.fuyi.ecps.sqlMap.EbShipAddrMapper.";

	public List<EbShipAddr> selectAddrByUserId(Long userId) {
		return this.getSqlSession().selectList(ns + "selectAddrByUserId", userId);
	}

	public EbShipAddr getShipAddrById(Long shipAddrId) {
		return this.getSqlSession().selectOne(ns + "selectByPrimaryKey", shipAddrId);
	}

	public void insertAddr(EbShipAddr addr) {
		this.getSqlSession().insert(ns + "insert", addr);
	}

	public void updateAddr(EbShipAddr addr) {
		this.getSqlSession().update(ns + "updateByPrimaryKeySelective", addr);
	}

	public void updateDefaultAddr(Long userId) {
		this.getSqlSession().update(ns + "updateDefaultAddr", userId);
	}
}
