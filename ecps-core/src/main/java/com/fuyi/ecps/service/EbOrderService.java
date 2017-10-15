package com.fuyi.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fuyi.ecps.model.EbOrder;
import com.fuyi.ecps.model.EbOrderDetail;

public interface EbOrderService {
	
	public void saveOrder(EbOrder order, List<EbOrderDetail> orderDetailList, HttpServletResponse response, HttpServletRequest request);

}
