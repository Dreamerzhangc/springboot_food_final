package cn.edu.nyist.food.back.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.back.repository.ProductTypeReposity;
import cn.edu.nyist.food.back.service.ProductTypeService;

import cn.edu.nyist.food.model.ProductType;


@Service("bcakProductTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {
	
	@Autowired
	private ProductTypeReposity productCategoryReposity;

	@Override
	public List<ProductType> findProductTypes() {
		return productCategoryReposity.findAll();
	}

}
