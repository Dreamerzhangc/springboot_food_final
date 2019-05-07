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

import cn.edu.nyist.food.back.repository.SellerInfoRepository;
import cn.edu.nyist.food.back.service.SellerInfoService;
import cn.edu.nyist.food.constant.PageConstant;
import cn.edu.nyist.food.model.ProductInfo;
import cn.edu.nyist.food.model.RestaturantType;
import cn.edu.nyist.food.model.Restaurant;
@Service
public class SellerInfoServiceImpl implements SellerInfoService {
	@Autowired
	private SellerInfoRepository sellerInfoRepository;

	@Override
	public Page<Restaurant> findAllSellrtInfos(int pageNo, String res_name,int seller_id, int res_type, String sortName) {
       // 根据temp进行升序或者降序判断 0升序 1降序 ,-1不进行排序 ,String sortName默认值为空串
		Sort sort = null;
		sort = new Sort(Sort.Direction.ASC, sortName);
		// 进行条件分页
		Pageable pageable = new PageRequest(pageNo - 1, PageConstant.PAGE_SIZE, sort);
		return sellerInfoRepository.findAll(new Specification<Restaurant>() {
			@Override
			public Predicate toPredicate(Root<Restaurant> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> ls = new ArrayList<Predicate>();
				if (res_type != -1) {
					Predicate p1 = cb.equal(root.get("resType"), res_type);
					ls.add(p1);
				}
				if (res_name != null && !res_name.equals("")) {
					Predicate p2 = cb.like(root.get("resName").as(String.class), "%" +res_name + "%");
					ls.add(p2);
				}
				
				Predicate[] arr = new Predicate[ls.size()];
				return cb.and(ls.toArray(arr));

			}
		}, pageable);
	}

	@Override
	public Page<Restaurant> findBySelleridSellrtInfos(int pageNo, int seller_id, String res_name, int res_type,
			String sortName) {
		// 根据temp进行升序或者降序判断 0升序 1降序 ,-1不进行排序 ,String sortName默认值为空串
		Sort sort = null;
		
		sort = new Sort(Sort.Direction.ASC, sortName);
		System.out.println("1    "+pageNo+" "+seller_id+" "+res_name+" "+res_type);
		// 进行条件分页
		Pageable pageable = new PageRequest(pageNo - 1, PageConstant.PAGE_SIZE, sort);
		return sellerInfoRepository.findAll(new Specification<Restaurant>() {
			@Override
			public Predicate toPredicate(Root<Restaurant> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> ls = new ArrayList<Predicate>();
				if (res_type != -1) {
					Predicate p1 = cb.equal(root.get("resType"), res_type);
					ls.add(p1);
				}
				if (res_name != null && !res_name.equals("")) {
					Predicate p2 = cb.like(root.get("resName").as(String.class), "%" +res_name + "%");
					ls.add(p2);
				}
				Predicate p = cb.equal(root.get("sellerId"), seller_id);
				ls.add(p);
				Predicate[] arr = new Predicate[ls.size()];
				return cb.and(ls.toArray(arr));

			}
		}, pageable);
	}

	@Override
	public List<RestaturantType> findRestarantTypes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant findBySeller(int seller_id) {
		// TODO Auto-generated method stub
		return sellerInfoRepository.findOne(seller_id);
	}

	@Override
	public void del(Integer id) {
		sellerInfoRepository.delete(id);
		
	}

}
