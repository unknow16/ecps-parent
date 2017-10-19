package com.fuyi.ecps.dao;

import com.fuyi.ecps.model.EbOrder;

public interface EbOrderDao {

	public void saveOrder(EbOrder order);

	public void updateOrder(EbOrder order);
	
	public EbOrder selectOrderById(Long orderId);
	
	public EbOrder selectOrderAndDetailById(Long orderId);
}
