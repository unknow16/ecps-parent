package com.fuyi.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbItemDao;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.QueryCondition;

@Repository
public class EbItemDaoImpl extends SqlSessionDaoSupport implements EbItemDao {

	String ns = "com.fuyi.ecps.sqlMap.EbItemMapper."; //com.fuyi.ecps.dao.EbItemMapper

	public List<EbItem> selectItemByCondition(QueryCondition qc) {
		return this.getSqlSession().selectList(ns + "selectItemListByCondition", qc);
	}

	public Integer selectItemByConditionCount(QueryCondition qc) {
		return this.getSqlSession().selectOne(ns + "selectItemListByConditionCount", qc);
	}

	public void saveItem(EbItem item) {
		this.getSqlSession().insert(ns + "insert", item);
	}

	public List<EbItem> listItem(Map<String, Object> map) {
		List<EbItem> items = this.getSqlSession().selectList(ns+"listItem", map);
		return items;
	}

	public EbItem selectItemDetailById(Long itemId) {
		return this.getSqlSession().selectOne(ns + "selectItemDetailById", itemId);
	}

	@Override
	public void updateItem(EbItem item) {
		this.getSqlSession().update(ns + "updateByPrimaryKeySelective", item);
	}
}
