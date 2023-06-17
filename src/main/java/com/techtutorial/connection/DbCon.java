package com.techtutorial.connection;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {

	private static Connection connection = null;

	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if (connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers_cart", "root", "Pass@123");
		}
		return connection;
	}
}
