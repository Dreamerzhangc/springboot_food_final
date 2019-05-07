package cn.edu.nyist.food.front.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.ProductInfo;
@Repository("frontProductInfoRepository")
public interface ProductInfoRepository extends JpaRepository<ProductInfo,Integer>,JpaSpecificationExecutor<ProductInfo> {
	
}
