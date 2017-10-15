package com.fuyi.ecps.service;

import java.util.List;

import com.fuyi.ecps.model.EbShipAddr;

public interface EbShipAddrService {
	
	public List<EbShipAddr> selectAddrByUserId(Long userId);

	public EbShipAddr getShipAddrById(Long shipAddrId);
	
	public void saveOrUpdateAddr(EbShipAddr addr);

	public void updateDefaultAddr(Long shipAddrId, Long userId);
}
