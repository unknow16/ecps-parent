package com.fuyi.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fuyi.ecps.model.EbCart;

public interface EbCartService {

	public void addCart(HttpServletRequest request, HttpServletResponse response, Long skuId, Integer quantity);
	
	public List<EbCart> listCart(HttpServletRequest request, HttpServletResponse response);
	
	public void addNum(HttpServletRequest request, HttpServletResponse response, Long skuId);
	public void reduceNum(HttpServletRequest request, HttpServletResponse response, Long skuId);
	
	public void deleteCart(HttpServletRequest request, HttpServletResponse response, Long skuId);
	
	public void clearCart(HttpServletRequest request, HttpServletResponse response);
	
	public String validCookie(HttpServletRequest request, HttpServletResponse response);
	public String validCart(HttpServletRequest request, HttpServletResponse response);
}
