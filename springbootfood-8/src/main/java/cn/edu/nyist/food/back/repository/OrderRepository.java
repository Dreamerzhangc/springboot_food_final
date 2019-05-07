package cn.edu.nyist.food.back.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.Order;

@Repository(value="backOrderRepository")
public interface OrderRepository extends JpaRepository<Order, String>,JpaSpecificationExecutor<Order>{
    //根据订单状态查询
	List<Order> findByOrderStatus(Integer orderStatus);
	//批量删除订单
	void deleteOrderItemByOrderId(List<String> orderIds);
	
}
