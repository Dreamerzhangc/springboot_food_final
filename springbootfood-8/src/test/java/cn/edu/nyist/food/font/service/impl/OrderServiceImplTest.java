package cn.edu.nyist.food.font.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import cn.edu.nyist.food.dto.CartDTO;
import cn.edu.nyist.food.front.service.OrderService;
import cn.edu.nyist.food.model.Order;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderServiceImplTest {
@Autowired
private OrderService orderService;
@Test
public void create() {
	CartDTO cartDTO=new CartDTO();
	List<CartDTO> carts=new ArrayList<>();
	cartDTO.setProductId(1);
	cartDTO.setProductQuantity(2);
	carts.add(cartDTO);
	Order order=new Order();

	order.setBuyerName("zhangsan");
	order.setBuyerAddress("南阳");
	order.setBuyerPhone("1888888888");
	order.setOrderAmount(100.88);
	order.setOrderStatus(1);
	order.setSellerId(1);
	order.setPayStatus(0);
	Order result = orderService.create(carts, order);
	System.out.println(result);
	
}
//@Test
public void findAll() {
	
	List<Order> ls = orderService.findList("zhangsan");
	System.out.println(ls);
}
//@Test
public void findByOrderId() {
	Order result = orderService.findByOrderId("1537519760834506400");
	System.out.println(result);
}
//@Test
public void paid() {
	Order paid = orderService.paid("1537519760834506400");
	System.out.println(paid);
} 
//@Test
public void cancel() {
	Boolean result = orderService.cancel("1537520715896110212 ");
	System.out.println(result);
}
}
