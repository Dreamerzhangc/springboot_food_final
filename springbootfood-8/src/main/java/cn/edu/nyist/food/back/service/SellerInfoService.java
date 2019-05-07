package cn.edu.nyist.food.back.service;

import java.util.List;

import org.springframework.data.domain.Page;

import cn.edu.nyist.food.model.RestaturantType;
import cn.edu.nyist.food.model.Restaurant;

public interface SellerInfoService {
    //超级管理员管理所有商家信息
	//Page<Restaurant> findAllSellrtInfos(int pageNo, String res_name, int res_type, int res_type2, String sortName);
    //管理员管理自家商家信息
	Page<Restaurant> findBySelleridSellrtInfos(int pageNo, int i, String res_name, int res_type, String sortName);
	//查询所有商家类型
	List<RestaturantType> findRestarantTypes();
	Restaurant findBySeller(int seller_id);
	//超级管理员管理所有商家信息
	Page<Restaurant> findAllSellrtInfos(int pageNo, String resName, int seller_id, int resType, String sortName);
	void del(Integer id);

}
