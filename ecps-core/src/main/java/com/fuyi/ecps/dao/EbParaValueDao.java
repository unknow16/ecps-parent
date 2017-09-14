package com.fuyi.ecps.dao;

import java.util.List;

import com.fuyi.ecps.model.EbParaValue;

public interface EbParaValueDao {

	void saveParaValue(List<EbParaValue> paraValueList, long itemId);
}
