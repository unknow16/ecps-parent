package com.fuyi.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbBrandDao;
import com.fuyi.ecps.model.EbBrand;
import com.fuyi.ecps.service.EbBrandService;

@Service
public class EbBrandServiceImpl implements EbBrandService {

	@Autowired
	private EbBrandDao brandDao;

	public void saveBrand(EbBrand brand) {
		brandDao.saveBrand(brand);
	}

	public EbBrand getBrandById(Long brandId) {
		return brandDao.getBrandById(brandId);
	}

	public void updateBrand(EbBrand brand) {
		brandDao.updateBrand(brand);
	}

	public void deleteBrand(Long brandId) {
		EbBrand brand = this.getBrandById(brandId);
		brandDao.deleteBrand(brandId);
		/*Client client = Client.create();
		WebResource wr = client.resource(ECPSUtils.readProp("file_path")
				+ brand.getImgs());
		wr.delete();*/
	}

	public List<EbBrand> selectBrand() {
		return brandDao.selectBrand();
	}

	public List<EbBrand> selectBrandByName(String brandName) {
		return brandDao.selectBrandByName(brandName);
	}
}
