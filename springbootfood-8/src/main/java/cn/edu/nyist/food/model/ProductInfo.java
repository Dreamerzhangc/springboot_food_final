package cn.edu.nyist.food.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 商品类
 * */
@Entity
@Table(name = "product")
public class ProductInfo implements Serializable {

	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer productId;
	private Integer sellerId;
	private String productName;// 名字
	private Double productPrice;// 单价
	private Integer productStock;// 库存
	private String productDescription;// 描述
	private String productPhoto;// 图片
	private Integer productTid;// 类目编号
	public ProductInfo() {

	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	public Integer getSellerId() {
		return sellerId;
	}
	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductStock() {
		return productStock;
	}

	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public Integer getProductTid() {
		return productTid;
	}

	public void setProductTid(Integer productTid) {
		this.productTid = productTid;
	}



	@Override
	public String toString() {
		return "ProductInfo [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productStock=" + productStock + ", productDescription=" + productDescription + ", productPhoto="
				+ productPhoto + ", productTid=" + productTid + "]";
	}
    

}
