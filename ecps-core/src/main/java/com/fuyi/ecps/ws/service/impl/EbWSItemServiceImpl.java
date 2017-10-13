package com.fuyi.ecps.ws.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbItemDao;
import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.utils.ECPSUtils;
import com.fuyi.ecps.utils.FMUtils;
import com.fuyi.ecps.ws.service.EbWSItemService;

@Service
public class EbWSItemServiceImpl implements EbWSItemService {

	@Autowired
	private EbItemDao itemDao;
	
	public String publishItem(Long itemId, String password) throws Exception {
		
		String pass = ECPSUtils.readProp("ws_password");
		if(StringUtils.equals(password, pass)) {
			EbItem item = itemDao.selectItemDetailById(itemId);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("item", item);
			FMUtils fm = new FMUtils();
			fm.outputFile("productDetail.ftl", item.getItemId() + ".html", map);
			
			return "success";
		} else {
			
			
			return "pass_error";
		}
	}

}
