package com.webcoder.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public OrderDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrder(CoursesOwned model) {
		boolean result = false;
		
		try {
			
			
			query = "insert into courses_owned (user_id, course_id, owned_check) values(?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getUid());
			pst.setInt(2, model.getCid());
			pst.setBoolean(3, model.getOwned_check());
			pst.executeUpdate();
			result = true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
