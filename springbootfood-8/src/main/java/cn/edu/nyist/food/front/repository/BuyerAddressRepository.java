package cn.edu.nyist.food.front.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import cn.edu.nyist.food.model.BuyerAddress;

public interface BuyerAddressRepository extends CrudRepository<BuyerAddress, Integer> {
   List<BuyerAddress>  findByBid(int bid);
}
