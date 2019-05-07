package cn.edu.nyist.food.back.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ProductInfo;

public interface ProductInfoService {
	//添加商品
	@Transactional
	ProductInfo save(ProductInfo productInfo);
	//查找商品  1. 分页 2. 筛选 3. [可以根据管理员选择进行排序商品信息 可能升序或者降序] int temp 设置默认值-1 ,设置0升序 ,1降序
	@Transactional(readOnly=true)
	Page<ProductInfo> findAllProductInfos(int pageNo,int sellerId,String productName,int productType,String sortName);
    //根据id查找
	@Transactional(readOnly=true)
	ProductInfo findById(int productId);
	//删除商品
	@Transactional
	void del(Integer productId);
	//修改商品
	@Transactional
	ProductInfo update(ProductInfo productInfo);
	//批量删除商品
	@Transactional
	void deleteBatch(List<Integer> productIds);
}
