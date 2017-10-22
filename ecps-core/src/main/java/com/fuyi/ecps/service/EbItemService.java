package com.fuyi.ecps.service;

import java.util.List;

import com.fuyi.ecps.model.EbItem;
import com.fuyi.ecps.model.EbItemClob;
import com.fuyi.ecps.model.EbParaValue;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.model.QueryCondition;
import com.fuyi.ecps.utils.Page;


public interface EbItemService {
	
	public Page selectItemByCondition(QueryCondition qc);
	
	public void saveItem(EbItem item, EbItemClob itemClob, List<EbParaValue> paraList, List<EbSku> skuList);
	
	/**
	 * 审核商品
	 * @param itemId 商品id
	 * @param auditStatus 是否通过 1通过 2不通过 0待审核
	 * @param notes 审核意见
	 */
	public void auditItem(Long itemId, Short auditStatus, String notes);
	
	/**
	 * 上下架商品
	 * @param itemId 商品id
	 * @param showStatus 0上架 1下架
	 */
	public void showItem(Long itemId, Short showStatus);
	
	/**
	 * price: 4000-4999
	 * brandId: 1003
	 * paraStr: Android,直板,5寸
	 * @return
	 */
	public List<EbItem> listItem(String price, Long brandId, String paraStr);
	
	public EbItem selectItemDetailById(Long itemId);
	
	public String publishItem(Long itemId, String password);
}
