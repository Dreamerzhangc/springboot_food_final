package cn.edu.nyist.food.front.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.dto.CartDTO;
import cn.edu.nyist.food.model.Order;

public interface OrderService {
    //创建订单
	@Transactional
	Order create(List<CartDTO> carts,Order order);
    //通过订单id查询单个订单
	@Transactional(readOnly=true)
	Order findByOrderId(String OrderId);
	//买家查询订单列表
	List<Order> findList(String buyerName);
	//通过orderId取消订单
	@Transactional
	Boolean cancel(String orderId);
	//支付订单
	@Transactional
	Order paid(String  orderId);
	//修改订单状态
	@Transactional 
	Order update(Order order);
	//删除订单
	@Transactional
	void delOrderById(String orderId);
}
