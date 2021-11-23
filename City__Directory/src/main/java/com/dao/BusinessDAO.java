package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Business;

public class BusinessDAO {
	
	private Connection conn;

	public BusinessDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean saveBusiness(Business b)
	{
		boolean f=false;
		try {
		
			String sql = "insert into business(business_name,business_owner,business_mob,business_type,business_adds,business_city,business_pin,userId) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,b.getBname());
			ps.setString(2,b.getOname());
			ps.setString(3,b.getPhone());
			ps.setString(4,b.getB_type());
			ps.setString(5,b.getAddress());
			ps.setString(6,b.getCity());
			ps.setString(7,b.getPin());
			ps.setInt(8,b.getUserId());
			int i =ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return f;
	
	}
	public List<Business> getAllBusiness(int uId)
	{
		List<Business> list = new ArrayList<Business>();
		Business b=null;
		try {
			String sql= "select * from business where userId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, uId);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b =new Business();
				b.setId(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setOname(rs.getString(3));
				b.setPhone(rs.getString(4));
				b.setB_type(rs.getString(5));
				b.setAddress(rs.getString(6));
				b.setCity(rs.getNString(7));
				b.setPin(rs.getString(8));
				list.add(b);
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public Business getBusinessByID(int bid) {
		
		Business b =new Business();
		try {
		PreparedStatement ps = conn.prepareStatement("select * from business where id=?");
		ps.setInt(1, bid);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			b.setId(rs.getInt(1));
			b.setBname(rs.getString(2));
			b.setOname(rs.getString(3));
			b.setPhone(rs.getString(4));
			b.setB_type(rs.getString(5));
			b.setAddress(rs.getString(6));
			b.setCity(rs.getNString(7));
			b.setPin(rs.getString(8));
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public boolean updateDetails(Business b) 
	{
		boolean f=false;
		try {
		
			String sql ="update business set business_name=?,business_owner=?,business_mob=?,business_type=?,business_adds=?,business_city=?,business_pin=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,b.getBname());
			ps.setString(2,b.getOname());
			ps.setString(3,b.getPhone());
			ps.setString(4,b.getB_type());
			ps.setString(5,b.getAddress());
			ps.setString(6,b.getCity());
			ps.setString(7,b.getPin());
			ps.setInt(8,b.getId());
			int i =ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteDetailsById(int id)
	{
		boolean f=false;
		try {
			String sql="delete from business where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Business> getDirectory()
	{
		List<Business> list=new ArrayList<Business>();
		Business b=null;
		try {
			String sql="select * from business";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b =new Business();
				b.setId(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setOname(rs.getString(3));
				b.setPhone(rs.getString(4));
				b.setB_type(rs.getString(5));
				b.setAddress(rs.getString(6));
				b.setCity(rs.getNString(7));
				b.setPin(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

