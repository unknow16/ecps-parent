package com.fuyi.ecps.dao;

import java.util.Map;

import com.fuyi.ecps.model.TsPtlUser;

public interface TsPtlUserDao {
	
	public TsPtlUser selectUserByUsernameAndPassword(Map<String, String> map);

}
