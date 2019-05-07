package cn.edu.nyist.food.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.dto.CartDTO;
import cn.edu.nyist.food.exception.FoodException;
import cn.edu.nyist.food.front.repository.OrderRepository;
import cn.edu.nyist.food.front.service.OrderItemService;
import cn.edu.nyist.food.front.service.OrderService;
import cn.edu.nyist.food.front.service.ProductInfoService;
import cn.edu.nyist.food.model.Order;
import cn.edu.nyist.food.model.OrderItem;
import cn.edu.nyist.food.model.ProductInfo;

@Service("frontOrderService")
public class OrderServiceImpl implements OrderService{
	//订单repository层
    @Autowired
    private OrderRepository orderRepository;
    //订单项service层
    @Autowired
    private OrderItemService orderItemService;
    //商品service层
    @Autowired
    private ProductInfoService productInfoService;
    //创建订单  ***测试通过***
	@Override
	public Order create(List<CartDTO> cartDTO,Order order) {
	    /////////////保存订单
	    Order orderResult = orderRepository.save(order);
	    //
	    if(orderResult==null) {
	    	throw new FoodException("保存订单失败!!!");
	    }
	    //循环拿到所有购物车中的商品
	    for (CartDTO cart : cartDTO) {
	    	//拿到每件商品的id
			int productId=cart.getProductId();
			//根据每件商品的id查到每件商品
			ProductInfo productInfo = productInfoService.findById(productId);
			//拿到每件商品的数量
			int productQuantity=cart.getProductQuantity();
			//减库存量
			productInfo.setProductStock(productInfo.getProductStock()-productQuantity);
			//保存修改过的每件商品
			productInfoService.update(productInfo);
			/////////////保存商品项			
			OrderItem orderItem=new OrderItem();
			//设置订单项的id
			orderItem.setOrderId(order.getOrderId());
			//设置订单项的商品id
			orderItem.setProductId(productId);
			//设置订单项的商品数量
			orderItem.setProductQuantity(productQuantity);
			//保存订单项
			OrderItem orderItemResult = orderItemService.save(orderItem);
		    if(orderItemResult==null) {
		    	throw new FoodException("保存订单项失败!!!");
		    }    	   
	    }
		return orderResult;
	}
	//***测试通过***
	@Override
	public Order findByOrderId(String orderId) {
		return orderRepository.findByOrderId(orderId);
	}
    //***测试通过***
	@Override
	public List<Order> findList(String buyerName) {
		return orderRepository.findByBuyerName(buyerName);
	}
	//***测试通过***
    //通过orderId取消订单
	@Override
	public Boolean cancel(String orderId) {
		//一.把订单状态置零,把支付状态置零
		Order order = orderRepository.findByOrderId(orderId);
		order.setOrderStatus(0);
		order.setPayStatus(0);
		orderRepository.save(order);
		//二.把商品表ProductInfo的库存恢复
		//1.先先获取到OrderItem 订单项 拿到商品id
		List<OrderItem> orderItemList = orderItemService.findAll(orderId);
		for (OrderItem orderItem : orderItemList) {
			//获取订单项中具体商品的数量
			Integer productQuantity = orderItem.getProductQuantity();
			System.out.println("--------------"+productQuantity);
			//获取商品id
			Integer productId = orderItem.getProductId();
			//拿到具体商品
			ProductInfo productInfo = productInfoService.findById(productId);
			Integer productStock = productInfo.getProductStock();
			//恢复商品表的库存
			productInfo.setProductStock(productStock+productQuantity);
			//更新商品表
			productInfoService.update(productInfo);
		}
		return true;
	}
     //***测试通过***
	//支付 要改变支付状态
	@Override
	public Order paid(String orderId) {
		Order order = orderRepository.findOne(orderId);
		//支付状态默认是0 改为1表示已经支付
		order.setPayStatus(1);
		Order order2 = orderRepository.save(order);
		return order2;
	}
	
	//删除订单
	@Override
	public void delOrderById(String orderid) {
		
		orderRepository.delete(orderid);
		
	}
	//修改订单状态
	@Override
	public Order update(Order order) {
		
		return orderRepository.save(order);
	}  
}
