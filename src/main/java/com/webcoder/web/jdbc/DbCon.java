package com.webcoder.web.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (connection==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://heroku_f74e8d21b96e493:3306/webcoder","b680b5531a1f90","b58779b1");
			System.out.print("connected");
			
		}
		return connection;
	}
}
