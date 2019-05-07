package cn.edu.nyist.food.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.front.repository.BuyerAddressRepository;
import cn.edu.nyist.food.front.repository.BuyerInfoRepository;
import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.model.BuyerAddress;
import cn.edu.nyist.food.model.BuyerInfo;

@Service
public class BuyerInfoServiceImpl implements BuyerInfoService{
	@Autowired
	private BuyerInfoRepository buyerInfoRepository;
	
	@Autowired
	private BuyerAddressRepository buyerAddressRepository;
	
	@Override
	public BuyerInfo find(String buyerName, String buyerPwd) {
		
		return buyerInfoRepository.findByBuyerNameAndBuyerPwd(buyerName, buyerPwd);
	}

	@Override
	public BuyerInfo findBuyerByName(String name) {
		
		return buyerInfoRepository.findByBuyerName(name);
	}

	@Override
	public BuyerInfo saveBuyer(BuyerInfo buyerInfo) {
	
		return buyerInfoRepository.save(buyerInfo);
	}

	@Override
	public BuyerAddress saveAddress(BuyerAddress buyerAddress) {
		return buyerAddressRepository.save(buyerAddress);
		
	}

	@Override
	public List<BuyerAddress> findByBid(int bid) {
		
		return buyerAddressRepository.findByBid(bid);
	}

	@Override
	public void  deleAddress(int id) {
		  buyerAddressRepository.delete(id);
		
	}

	@Override
	public BuyerAddress findById(int aid) {
		//下单选择的用户地址
		return buyerAddressRepository.findOne(aid);
	}
	@Override
	public BuyerInfo findBuyerByPwd(String pwd) {
		
		return buyerInfoRepository.findByBuyerPwd(pwd);
	}
	

	

}
