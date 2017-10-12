package com.fuyi.ecps.service;

import com.fuyi.ecps.model.TsPtlUser;

public interface TsPtlUserService {
	
	public TsPtlUser selectUserByUsernameAndPassword(String username, String password);

}
