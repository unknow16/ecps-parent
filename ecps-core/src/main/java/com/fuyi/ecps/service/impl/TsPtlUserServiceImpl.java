package com.fuyi.ecps.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.TsPtlUserDao;
import com.fuyi.ecps.model.TsPtlUser;
import com.fuyi.ecps.service.TsPtlUserService;

@Service
public class TsPtlUserServiceImpl implements TsPtlUserService {
	
	@Autowired
	private TsPtlUserDao userDao;

	public TsPtlUser selectUserByUsernameAndPassword(String username, String password) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("username", username);
		map.put("password", password);
		
		TsPtlUser user = userDao.selectUserByUsernameAndPassword(map);
		return user;
	}

}
