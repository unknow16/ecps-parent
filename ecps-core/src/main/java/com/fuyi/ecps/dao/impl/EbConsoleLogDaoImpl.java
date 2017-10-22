package com.fuyi.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbConsoleLogDao;
import com.fuyi.ecps.model.EbConsoleLog;

@Repository
public class EbConsoleLogDaoImpl extends SqlSessionDaoSupport implements EbConsoleLogDao {

	private String ns = "com.fuyi.ecps.sqlMap.EbConsoleLogMapper.";
	
	@Override
	public void saveConsoleLog(EbConsoleLog consoleLog) {
		this.getSqlSession().insert(ns + "insert", consoleLog);
	}

}
