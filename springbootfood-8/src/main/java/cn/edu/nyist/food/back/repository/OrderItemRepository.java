package cn.edu.nyist.food.back.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.OrderItem;

@Repository(value="backOrderItemRepository")
public interface OrderItemRepository extends JpaRepository<OrderItem, Integer>{

	void deleteOrderItemByOrderId(List<String> orderId);
	
	List<OrderItem> findByOrderId(String orderId);
	
    //根据订单编号和商品id进行查询,因为我们数据库里面orderId与productId是联合主键，所以查询的结果，必然只会是一条记录
    OrderItem findByOrderIdAndProductId(String orderId,Integer productId);
    
    //批量删除订单项
    @Transactional
    void deleteOrderItemByOrderIdAndProductId(String orderId,Integer productId);

}
