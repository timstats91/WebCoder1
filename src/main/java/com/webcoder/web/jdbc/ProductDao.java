package com.webcoder.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

public class ProductDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public ProductDao (Connection con) {
		this.con = con;
	}
	
	
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "Select * from courses";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("Course_ID"));
				row.setName(rs.getString("Course_Name"));
				row.setPrice(rs.getInt("Course_Price"));
				products.add(row);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<Cart>();
		
		try {
			if (cartList.size() > 0) {
				for (Cart item:cartList) {
					query = "select * from courses where Course_Id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1,item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("Course_Id"));
						row.setName(rs.getString("Course_Name"));
						row.setPrice(rs.getInt("Course_Price"));
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	public int getTotalCartPrice(ArrayList<Cart> cartList) {
		int sum = 0;
		
		try {
			if (cartList.size()>0) {
				for (Cart item:cartList) {
					query = "select course_price from courses where course_id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while (rs.next()) {
						sum += rs.getInt("course_price");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sum;
	}
}
