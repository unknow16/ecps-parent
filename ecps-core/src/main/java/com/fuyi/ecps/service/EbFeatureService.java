package com.fuyi.ecps.service;

import java.util.List;

import com.fuyi.ecps.model.EbFeature;

public interface EbFeatureService {
	
	
	public List<EbFeature> selectCommFeature();
	public List<EbFeature> selectSpecFeature();
	public List<EbFeature> selectIsSelFeature();
}
