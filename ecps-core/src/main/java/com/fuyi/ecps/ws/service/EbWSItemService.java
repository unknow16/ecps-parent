package com.fuyi.ecps.ws.service;

import javax.jws.WebService;

@WebService
public interface EbWSItemService {

	public String publishItem(Long itemId, String password) throws Exception;
}
