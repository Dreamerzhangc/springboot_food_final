package cn.edu.nyist.food.back.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import cn.edu.nyist.food.model.RestaturantType;
@Repository
public interface RestanrantTypeReposity extends CrudRepository<RestaturantType, Integer>{
	
	List<RestaturantType> findAll();
}
