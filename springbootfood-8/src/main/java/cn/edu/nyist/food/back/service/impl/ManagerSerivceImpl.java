package cn.edu.nyist.food.back.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.back.repository.ManagerReposity;
import cn.edu.nyist.food.back.repository.SellerInfoRepository;
import cn.edu.nyist.food.back.service.ManagerService;
import cn.edu.nyist.food.model.ManagerInfo;
@Service
public class ManagerSerivceImpl implements ManagerService{
    @Autowired
    private ManagerReposity managerReposity;
	@Override
	public ManagerInfo findSellerInfo(String username, String password,int role) {
		return managerReposity.findByUsernameAndPasswordAndRole(username, password,role);
	}

}
