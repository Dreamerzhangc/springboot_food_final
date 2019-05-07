package cn.edu.nyist.food.back.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.ProductType;
@Repository("backProductTypeRepository")
public interface ProductTypeReposity extends CrudRepository<ProductType, Integer>{
	
	List<ProductType> findAll();
}
