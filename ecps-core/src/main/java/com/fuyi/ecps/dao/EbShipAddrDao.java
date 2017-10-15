package com.fuyi.ecps.dao;

import java.util.List;

import com.fuyi.ecps.model.EbShipAddr;

public interface EbShipAddrDao {
	
	public List<EbShipAddr> selectAddrByUserId(Long userId);

	public EbShipAddr getShipAddrById(Long shipAddrId);

	public void insertAddr(EbShipAddr addr);
	public void updateAddr(EbShipAddr addr);
	
	public void updateDefaultAddr(Long userId);
}
