 package com.fuyi.ecps.dao;

import java.util.List;

import com.fuyi.ecps.model.EbFeature;

public interface EbFeatureDao {
	
	public List<EbFeature> selectCommFeature();
	public List<EbFeature> selectSpecFeature();
	public List<EbFeature> selectIsSelFeature();

}
