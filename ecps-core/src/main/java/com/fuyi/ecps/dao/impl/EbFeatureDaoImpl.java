package com.fuyi.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fuyi.ecps.dao.EbFeatureDao;
import com.fuyi.ecps.model.EbFeature;

@Repository
public class EbFeatureDaoImpl extends SqlSessionDaoSupport implements EbFeatureDao {

	private String ns = "com.fuyi.ecps.sqlMap.EbFeatureMapper.";
	
	public List<EbFeature> selectCommFeature() {
		return this.getSqlSession().selectList(ns + "selectCommFeature");
	}

	public List<EbFeature> selectSpecFeature() {
		return this.getSqlSession().selectList(ns + "selectSpecFeature");
	}

	public List<EbFeature> selectIsSelFeature() {
		return this.getSqlSession().selectList(ns + "selectIsSelFeature");
	}

}
