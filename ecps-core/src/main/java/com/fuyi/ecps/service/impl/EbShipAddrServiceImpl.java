package com.fuyi.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbShipAddrDao;
import com.fuyi.ecps.model.EbShipAddr;
import com.fuyi.ecps.service.EbShipAddrService;

@Service
public class EbShipAddrServiceImpl implements EbShipAddrService {
	
	@Autowired
	private EbShipAddrDao shipAddrDao;

	public List<EbShipAddr> selectAddrByUserId(Long userId) {
		return shipAddrDao.selectAddrByUserId(userId);
	}

	public EbShipAddr getShipAddrById(Long shipAddrId) {
		return shipAddrDao.getShipAddrById(shipAddrId);
	}

	public void saveOrUpdateAddr(EbShipAddr addr) {
		//每次先把
		if(addr.getDefaultAddr() == 1) {
			shipAddrDao.updateDefaultAddr(addr.getPtlUserId());
		}
		
		if(addr.getShipAddrId() == null) {
			shipAddrDao.insertAddr(addr);
		} else {
			shipAddrDao.updateAddr(addr);
		}
	}

	public void updateDefaultAddr(Long shipAddrId, Long userId) {
		//清除上一个默认
		shipAddrDao.updateDefaultAddr(userId);
		
		//更新当前为默认
		EbShipAddr addr = new EbShipAddr();
		addr.setDefaultAddr((short)1);
		addr.setShipAddrId(shipAddrId);
		shipAddrDao.updateAddr(addr);
	}

	
}
