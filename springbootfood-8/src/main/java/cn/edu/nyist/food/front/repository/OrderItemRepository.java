package cn.edu.nyist.food.front.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.OrderItem;
@Repository("frontOrderItemRepository")
public interface OrderItemRepository extends JpaRepository<OrderItem,Integer>{
	
   List<OrderItem> findByOrderId(String orderId);
  //删除订单项
   void deleteOrderItemByOrderId(String orderid);

      
}
