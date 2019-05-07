package cn.edu.nyist.food.front.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.Order;

@Repository("frontOrderRepository")
public interface OrderRepository extends JpaRepository<Order, String>, JpaSpecificationExecutor<Order> {
	
	Order findByOrderId(String OrderId);

	List<Order> findByBuyerName(String buyerName);
}
