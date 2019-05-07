package cn.edu.nyist.food.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//管理员信息表
@Entity
@Table(name = "manager")
public class ManagerInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String username;
	private String password;
	private int role;
	private int seller_id;
	private int status;

	public ManagerInfo() {

	}

	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}






	public int getSeller_id() {
		return seller_id;
	}



	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public int getRole() {
		return role;
	}



	public void setRole(int role) {
		this.role = role;
	}



}
