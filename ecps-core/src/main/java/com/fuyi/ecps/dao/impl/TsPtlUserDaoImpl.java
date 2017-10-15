package com.fuyi.ecps.dao.impl;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.TsPtlUserDao;
import com.fuyi.ecps.model.TsPtlUser;

@Repository
public class TsPtlUserDaoImpl extends SqlSessionDaoSupport implements TsPtlUserDao {

	String ns = "com.fuyi.ecps.sqlMap.TsPtlUserMapper.";

	public TsPtlUser selectUserByUserIdAndPassword(Map<String, String> map) {
		return this.getSqlSession().selectOne(ns + "selectUserByUserIdAndPassword", map);
	}

	
}
