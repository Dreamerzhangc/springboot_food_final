package cn.edu.nyist.food.back.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.back.repository.ProductTypeReposity;
import cn.edu.nyist.food.back.repository.RestanrantTypeReposity;
import cn.edu.nyist.food.back.repository.SellerInfoRepository;
import cn.edu.nyist.food.back.service.ProductTypeService;
import cn.edu.nyist.food.back.service.RestarantTypeService;
import cn.edu.nyist.food.model.ProductType;
import cn.edu.nyist.food.model.RestaturantType;


@Service()
public class ResarantTypeServiceImpl implements RestarantTypeService {
	@Autowired
	private RestanrantTypeReposity restanrantTypeReposity;
	@Override
	public List<RestaturantType> findRestarantTypes() {
		// TODO Auto-generated method stub
		return restanrantTypeReposity.findAll();
	}
	
	

}
