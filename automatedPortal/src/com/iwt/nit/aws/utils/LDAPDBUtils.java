package com.iwt.nit.aws.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class LDAPDBUtils {

	private static Connection connection = null;

	public static Connection getConnection() {
		if (connection != null)
			return connection;
		else {
			try {
				Properties prop = new Properties();
				InputStream inputStream = LDAPDBUtils.class.getClassLoader()
						.getResourceAsStream("db.properties");
				prop.load(inputStream);
				String driver = prop.getProperty("jdbc.driverClassName");
				String url = prop.getProperty("jdbc.databaseurl");
				String user = prop.getProperty("jdbc.username");
				String password = prop.getProperty("jdbc.password");
				Class.forName(driver);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return connection;
		}

	}
	public static void main(String[] args) {
		try{
		Connection con=LDAPDBUtils.getConnection();
		System.out.println(con.getClass());
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select EMAIL from users");
        while(rs.next()){
        	String count=rs.getString("EMAIL");
        	System.out.println("Count values is "+count);
        }
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}