package com.entity;

public class Business {
	
	private int id;
	private String bname;
	private String oname;
	private String phone;
	private String b_type;
	private String address;
	private String city;
	private String pin;
	private int userId;
	public Business() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Business(String bname, String oname, String phone, String b_type, String address, String city, String pin, int userId) {
		super();
		this.bname = bname;
		this.oname = oname;
		this.phone = phone;
		this.b_type = b_type;
		this.address = address;
		this.city = city;
		this.pin = pin;
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
