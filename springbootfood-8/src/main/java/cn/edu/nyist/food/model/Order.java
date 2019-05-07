package cn.edu.nyist.food.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_master")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String orderId;//订单id
	private Integer sellerId;//卖家id
	private String buyerName;//买家称呼比如昵称
	private String buyerPhone;//买家联系方式
	private String buyerAddress;//买家地址
	private Double orderAmount;//订单总金额
	private Integer orderStatus = 0;
	private Integer payStatus = 0;
	private Date createTime;
	private Date updateTime;
    
	public Order() {

	}

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Integer getSellerId() {
		return sellerId;
	}


	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}


	public String getBuyerName() {
		return buyerName;
	}


	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}


	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getBuyerAddress() {
		return buyerAddress;
	}

	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}

	

	public Double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}
    
	

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}



}
