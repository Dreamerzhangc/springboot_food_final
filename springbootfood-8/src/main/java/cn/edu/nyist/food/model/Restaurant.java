package cn.edu.nyist.food.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="restaurant")
public class Restaurant implements Serializable {
	/**
	 * 餐厅详情信息
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer resId;
	private String  resName;
	private Integer resType;
	private String resMessage;
	private String resAddress;
	private String resPhone;
	private Integer  foodId;
	private String resLogo;
	private Integer resStatus;
	private Date  resCreatetime;
	private Integer resSellNum;
	private  Integer sellerId;
	public Restaurant() {
		
	}
	public Integer getResId() {
		return resId;
	}
	public void setResId(Integer resId) {
		this.resId = resId;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public Integer getResType() {
		return resType;
	}
	public void setResType(Integer resType) {
		this.resType = resType;
	}
	public String getResMessage() {
		return resMessage;
	}
	public void setResMessage(String resMessage) {
		this.resMessage = resMessage;
	}
	public String getResAddress() {
		return resAddress;
	}
	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}
	public String getResPhone() {
		return resPhone;
	}
	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}
	public Integer getFoodId() {
		return foodId;
	}
	public void setFoodId(Integer foodId) {
		this.foodId = foodId;
	}
	public String getResLogo() {
		return resLogo;
	}
	public void setResLogo(String resLogo) {
		this.resLogo = resLogo;
	}
	public Integer getResStatus() {
		return resStatus;
	}
	public void setResStatus(Integer resStatus) {
		this.resStatus = resStatus;
	}
	public Date getResCreatetime() {
		return resCreatetime;
	}
	public void setResCreatetime(Date resCreatetime) {
		this.resCreatetime = resCreatetime;
	}
	public Integer getResSellNum() {
		return resSellNum;
	}
	public void setResSellNum(Integer resSellNum) {
		this.resSellNum = resSellNum;
	}
	public Integer getSellerId() {
		return sellerId;
	}
	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}
	@Override
	public String toString() {
		return "Restaurant [resId=" + resId + ", resName=" + resName + ", resType=" + resType + ", resMessage="
				+ resMessage + ", resAddress=" + resAddress + ", resPhone=" + resPhone + ", foodId=" + foodId
				+ ", resLogo=" + resLogo + ", resStatus=" + resStatus + ", resCreatetime=" + resCreatetime
				+ ", resSellNum=" + resSellNum + ", sellerId=" + sellerId + "]";
	}
	
	
	
	
	
	
	

}
