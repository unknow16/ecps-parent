package com.fuyi.ecps.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbOrderDao;
import com.fuyi.ecps.dao.EbOrderDetailDao;
import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.exception.EbStockException;
import com.fuyi.ecps.model.EbOrder;
import com.fuyi.ecps.model.EbOrderDetail;
import com.fuyi.ecps.service.EbCartService;
import com.fuyi.ecps.service.EbOrderService;

@Service
public class EbOrderServiceImpl implements EbOrderService {
	
	@Autowired
	private EbOrderDao orderDao;
	
	@Autowired
	private EbOrderDetailDao orderDetailDao;
	
	@Autowired
	private EbSkuDao skuDao;
	
	@Autowired
	private EbCartService cartService;

	public void saveOrder(EbOrder order, List<EbOrderDetail> orderDetailList, 
			HttpServletResponse response, HttpServletRequest request) throws EbStockException {
		orderDao.saveOrder(order);
		
		Map<String, Object> map = new HashMap<String, Object>();
		for(EbOrderDetail detail:orderDetailList) {
			detail.setOrderId(order.getOrderId());
			orderDetailDao.saveOrderDetail(detail);
			
			//减库存
			map.put("skuId", detail.getSkuId());
			map.put("quantity", detail.getQuantity());
			int flag = skuDao.updateStock(map);
			if(flag == 0) {
				throw new EbStockException("库存不足");
			}
		}
		cartService.clearCart(request, response);
	}

}
