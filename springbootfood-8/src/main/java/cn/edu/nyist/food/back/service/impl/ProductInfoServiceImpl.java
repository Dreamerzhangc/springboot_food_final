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
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.back.repository.OrderItemRepository;
import cn.edu.nyist.food.back.repository.OrderRepository;
import cn.edu.nyist.food.back.repository.ProductInfoRepository;
import cn.edu.nyist.food.back.service.ProductInfoService;
import cn.edu.nyist.food.constant.PageConstant;
import cn.edu.nyist.food.model.Order;
import cn.edu.nyist.food.model.OrderItem;
import cn.edu.nyist.food.model.ProductInfo;

@Service("backProductInfoService")
public class ProductInfoServiceImpl implements ProductInfoService {
	@Autowired
	private ProductInfoRepository productInfoRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private OrderItemRepository orderItemRepository;

	// **单元测试通过**
	@Override
	public ProductInfo save(ProductInfo productInfo) {
		return productInfoRepository.save(productInfo);
	}

	// 分页排序 [根据价格降序排序] **单元测试通过**
	@Override
	public Page<ProductInfo> findAllProductInfos(int pageNo, int sellerId, String productName, int productType,
			String sortName) {
		// 根据temp进行升序或者降序判断 0升序 1降序 ,-1不进行排序 ,String sortName默认值为空串
		Sort sort = null;
		
		sort = new Sort(Sort.Direction.ASC, sortName);
		
		// 进行条件分页
		Pageable pageable = new PageRequest(pageNo - 1, PageConstant.PAGE_SIZE, sort);
		return productInfoRepository.findAll(new Specification<ProductInfo>() {
			@Override
			public Predicate toPredicate(Root<ProductInfo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> ls = new ArrayList<Predicate>();
				if (productType != -1) {
					Predicate p1 = cb.equal(root.get("productTid"), productType);
					ls.add(p1);
				}
				if (productName != null && !productName.equals("")) {
					Predicate p2 = cb.like(root.get("productName").as(String.class), "%" + productName + "%");
					ls.add(p2);
				}
				Predicate p = cb.equal(root.get("sellerId"), sellerId);
				ls.add(p);
				Predicate[] arr = new Predicate[ls.size()];
				return cb.and(ls.toArray(arr));

			}
		}, pageable);
	}

	// **单元测试通过**
	@Override
	public ProductInfo findById(int productId) {
		return productInfoRepository.findOne(productId);
	}

	// **单元测试通过**
	@Override
	public void del(Integer productId) {
		// 这里删除的是已处理过的订单的商品信息或者是没有订单项的商品信息
		// 1.先获得所有已经处理的订单记录
		List<Order> orders = orderRepository.findByOrderStatus(1);
		//System.out.println(orders.get(0).getOrderId() + "----------------------------------------");
		if (!orders.isEmpty()) {
			for (Order order : orders) {
				// 这里进行判断，若查不到，则不执行，若查到则执行
				OrderItem orderItem = orderItemRepository.findByOrderIdAndProductId(order.getOrderId(), productId);
				if (orderItem != null) {
					if (orderItem.getProductId() == productId) {
						System.out.println(productId + "+++++++++++++++++++++++++++++++++++++++++++");
						orderItemRepository.deleteOrderItemByOrderIdAndProductId(order.getOrderId(), productId);
						System.out.println("*************************************");
						break;
					}
				}
			}
		}
		productInfoRepository.delete(productId);
	}

	// **单元测试通过**
	@Override
	public ProductInfo update(ProductInfo productInfo) {
		return productInfoRepository.saveAndFlush(productInfo);
	}

	@Override
	public void deleteBatch(List<Integer> productIds) {
		// 1.首先查出所有已经处理的订单信息
		List<Order> orders = orderRepository.findByOrderStatus(1);
		//
		List<OrderItem> orderItems = new ArrayList<>();
		// 2.通过查看已处理的订单编号，来找订单中订单项的记录内容
		for (Order order : orders) {
			// 3.通过查询我们从前端传来的商品id，来进行处理
			for (Integer productId : productIds) {
				// 这里进行判断，若查不到，则不执行，若查到则执行
				if (orderItemRepository.findByOrderIdAndProductId(order.getOrderId(), productId) != null) {
					orderItems.add(orderItemRepository.findByOrderIdAndProductId(order.getOrderId(), productId));
				}
			}
		}
		// 若查询结果为空，那么没必要处理
		if (orderItems.size() > 0) {
			List<Integer> prodructDelByIds = new ArrayList<>();

			for (OrderItem orderItem : orderItems) {
				// 删除订单项中的订单与商品的记录
				orderItemRepository.deleteOrderItemByOrderIdAndProductId(orderItem.getOrderId(),
						orderItem.getProductId());

				prodructDelByIds.add(orderItem.getProductId());
			}
			for (Integer productId : prodructDelByIds) {
				productInfoRepository.delete(productId);
			}
			return;
		}
		
		for (Integer productId : productIds) {
			productInfoRepository.delete(productId);
		}
	}

}
