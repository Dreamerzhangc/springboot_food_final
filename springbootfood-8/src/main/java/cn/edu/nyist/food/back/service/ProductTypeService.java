package cn.edu.nyist.food.back.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ProductType;

public interface ProductTypeService {
  @Transactional(readOnly=true)
  List<ProductType> findProductTypes();
}
