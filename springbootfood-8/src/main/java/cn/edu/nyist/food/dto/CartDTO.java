package cn.edu.nyist.food.dto;

/*购物车*/
public class CartDTO {
	/** 商品Id. */
	private Integer productId;

	/** 数量. */
	private Integer productQuantity;

	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public CartDTO(Integer productId, Integer productQuantity) {
		super();
		this.productId = productId;
		this.productQuantity = productQuantity;
	}
    

	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}


	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}
	
}
