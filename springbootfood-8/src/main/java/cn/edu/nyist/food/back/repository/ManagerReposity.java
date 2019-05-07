package cn.edu.nyist.food.back.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.ManagerInfo;
@Repository
public interface ManagerReposity extends CrudRepository<ManagerInfo, Integer>{

	ManagerInfo findByUsernameAndPasswordAndRole(String username, String password, int role);
	
	
}
