package cn.edu.nyist.food.back.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.Order;

public interface OrderService {
	// 查找订单 分页 按买家联系方式查询 --todo可能需要排序--
	@Transactional(readOnly = true)
	Page<Order> findAllOrders(int pageNo,int sellerId, String buyerName,int orderStatus);
	
	// 根据订单状态查询
	@Transactional(readOnly=true)
	List<Order> findByOrderStatus();

	//将订单状态进行修改，我们后端商家仅能对于订单状态进行修改
	@Transactional
	void saveOrderStatus(String orderId, int orderStatus);
	//批量删除订单
    @Transactional
    void deleteBatch(List<String> orderIds);
}
