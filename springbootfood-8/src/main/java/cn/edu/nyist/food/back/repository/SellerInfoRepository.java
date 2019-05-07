package cn.edu.nyist.food.back.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.Restaurant;
@Repository
public interface SellerInfoRepository extends JpaRepository<Restaurant,Integer>,JpaSpecificationExecutor<Restaurant> 
	{
	
	
}
