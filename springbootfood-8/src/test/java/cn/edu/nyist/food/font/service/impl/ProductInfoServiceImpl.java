package cn.edu.nyist.food.font.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import cn.edu.nyist.food.front.service.ProductInfoService;
import cn.edu.nyist.food.model.ProductInfo;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductInfoServiceImpl {
@Autowired
private ProductInfoService productInfoService;
@Test
public void findOne() {
	ProductInfo result = productInfoService.findById(1);
	System.out.println(result);
}
}
