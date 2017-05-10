package com.iwt.nit.aws.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.log4j.Logger;

	

public class DbUtils {
	private static Logger LOGGER = Logger.getLogger(DbUtils.class);
	private static Connection connection = null;

	public static Connection getConnection() {
		LOGGER.info("Connection method is stared");
		if (connection != null)
			return connection;
		else {
			try {
				 Properties prop = new Properties();
				InputStream inputStream = DbUtils.class.getClassLoader().getResourceAsStream("db.properties");
				prop.load(inputStream);
				System.out.println(prop);
				// KEY VALUE (EX: jdbc.driverClassName  Value com.mysql.jdbc.Driver
				String driver = prop.getProperty("jdbc.driverClassName");
				String url = prop.getProperty("jdbc.databaseurl");
				String user = prop.getProperty("jdbc.username");
				String password = prop.getProperty("jdbc.password");
			
				Class.forName(driver);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				LOGGER.error("Error into the dbUtils:db error" + e.getMessage());
			} catch (SQLException e) {
				e.printStackTrace();
				LOGGER.error("Error into the dbUtils:db error" + e.getMessage());
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				LOGGER.error("Error into the dbUtils:file not found"
						+ e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				LOGGER.error("Error into the dbUtils:file not found"
						+ e.getMessage());
			}
			LOGGER.info("Connection method is ended");
			return connection;
		}

	}

	public static void main(String[] args) {
		
		Connection con=DbUtils.getConnection();
		System.out.println(con.getClass());//class com.mysql.jdbc.JDBC4Connection
	}
}