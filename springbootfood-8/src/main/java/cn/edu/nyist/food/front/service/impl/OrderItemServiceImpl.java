package cn.edu.nyist.food.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.front.repository.OrderItemRepository;
import cn.edu.nyist.food.front.service.OrderItemService;
import cn.edu.nyist.food.model.OrderItem;

@Service("frontOrderItemService")
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    private OrderItemRepository orderItemRepository;
   
    //通过订单id查询所有订单项
	@Override
	public List<OrderItem> findAll(String orderId) {
		return orderItemRepository.findByOrderId(orderId);
	}
    //保存订单项到数据库中
	@Override
	public OrderItem save(OrderItem orderItem) {
		return orderItemRepository.save(orderItem);
	}
	//删除订单项
	@Override
	public void delOrderItemByOrderid(String orderid) {
		System.out.println(orderid+"------------------------------------");
		List<OrderItem> orderItems=orderItemRepository.findByOrderId(orderid);
		for (OrderItem orderItem : orderItems) {
			orderItemRepository.delete(orderItem.getProductId());
		}
		
	}
	

}
