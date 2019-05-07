package cn.edu.nyist.food.back.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.OrderItem;

public interface OrderItemService {

	@Transactional(readOnly=true)
	List<OrderItem> findAllItems(String orderId);
	//批量删除订单项
	@Transactional
    void deleteBatch(List<String> orderIds);
}
