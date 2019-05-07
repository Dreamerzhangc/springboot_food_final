package cn.edu.nyist.food.back.service;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ManagerInfo;

public interface ManagerService {
	@Transactional(readOnly = true)
	ManagerInfo findSellerInfo(String username, String password, int role);
}
