package com.rl.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbItemDao;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.QueryCondition;
@Repository
public class EbItemDaoImpl extends SqlSessionDaoSupport implements EbItemDao {

	String ns = "com.rl.ecps.sqlMap.EbItemMapper.";

	public List<EbItem> selectItemByCondition(QueryCondition qc) {
		return this.getSqlSession().selectList(ns+"selectItemByCondition", qc);
	}

	public Integer selectItemByConditionCount(QueryCondition qc) {
		return this.getSqlSession().selectOne(ns+"selectItemByConditionCount", qc);
	}
	
	

}
