package com.fuyi.ecps.service;

import com.fuyi.ecps.model.TsPtlUser;

public interface TsPtlUserService {

	public TsPtlUser selectUserByUserIdAndPassword(String username, String password);
}
