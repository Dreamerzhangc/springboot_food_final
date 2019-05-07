package cn.edu.nyist.food.back.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ProductType;
import cn.edu.nyist.food.model.RestaturantType;

public interface RestarantTypeService {
	@Transactional(readOnly=true)
	List<RestaturantType> findRestarantTypes();
  
 
}
