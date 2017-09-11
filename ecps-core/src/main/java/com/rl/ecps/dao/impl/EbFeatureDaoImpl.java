package com.rl.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.rl.ecps.dao.EbBrandDao;
import com.rl.ecps.dao.EbFeatureDao;
import com.rl.ecps.model.EbBrand;
import com.rl.ecps.model.EbFeature;
@Repository
public class EbFeatureDaoImpl extends SqlSessionDaoSupport implements EbFeatureDao {

	String ns = "com.rl.ecps.sqlMap.EbFeatureMapper.";

	public List<EbFeature> selectCommFeature() {
		return this.getSqlSession().selectList(ns+"selectCommFeature");
	}

	public List<EbFeature> selectSpecFeature() {
		return this.getSqlSession().selectList(ns+"selectSpecFeature");
	}

	public List<EbFeature> selectIsSelFeature() {
		return this.getSqlSession().selectList(ns+"selectIsSelFeature");
	}
	
	
}
