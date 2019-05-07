package cn.edu.nyist.food.back.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.back.repository.OrderRepository;
import cn.edu.nyist.food.back.service.OrderService;
import cn.edu.nyist.food.constant.PageConstant;
import cn.edu.nyist.food.model.Order;
@Service("backOrderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired 
	private OrderRepository orderRepository;
	//查找订单 分页 按订单号查询  --todo可能需要排序--
	@Override
	public Page<Order> findAllOrders(int pageNo,int sellerId, String buyerName,int orderStatus) {
		//先进行订单表的查询，查看订单表中有没有关于此卖家的订单信息，如果没有，则不查询
		int flag=0;//用来标志这个商家有没有订单业务
		List<Order> orders = orderRepository.findAll();
		for (Order order : orders) {
			if(order.getSellerId()==sellerId) {
				flag=1;
			}
		}
		//如果为0，则证明没有订单业务，所以没有对应的商家订单信息，直接接返回null
		if(flag==0) {
			return null;
		}
		//进行条件分页 
		Pageable pageable = new PageRequest(pageNo-1, PageConstant.ORDER_PAGE_SIZE);
		return orderRepository.findAll(new Specification<Order>() {
			@Override
			public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> ls = new ArrayList<Predicate>();
				if (buyerName != null && !buyerName.equals("")) {
					Predicate p2 = cb.like(root.get("buyerName").as(String.class), "%" +buyerName+ "%");
					ls.add(p2);
				}
				if(orderStatus!=-1) {
					Predicate p2=cb.equal(root.get("orderStatus"), orderStatus);
					ls.add(p2);
				}
				Predicate p=cb.equal(root.get("sellerId"),sellerId);
				ls.add(p);
				Predicate[] arr = new Predicate[ls.size()];
				return cb.and(ls.toArray(arr));
			}
		}, pageable);
	}
	
	
	//根据订单状态查询
	@Override
	public List<Order> findByOrderStatus() {
		
		return null;
	}

	@Override
	public void saveOrderStatus(String orderId, int orderStatus) {
		Order order=orderRepository.findOne(orderId);
		order.setOrderStatus(orderStatus);
		orderRepository.save(order);
	}


	@Override
	public void deleteBatch(List<String> orderIds) {
	   orderRepository.deleteOrderItemByOrderId(orderIds);
	}

}
