package com.sanityapp;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class LoginDao {
	public static boolean validate(String username,String password)
	{
		boolean status = false;
		String databasedriver = null;
		String dbpassword = null;
		String url = null;
		String dbusername = null;
		Properties prop = new Properties();
		InputStream input = null;
		try {
			String filename = "dbcon.properties";
			input = LoginDao.class.getClassLoader().getResourceAsStream(filename);
			prop.load(input);
			databasedriver = prop.getProperty("dbdriver");
			dbpassword = prop.getProperty("password");
			url = prop.getProperty("dburl");
			dbusername = prop.getProperty("username");
		}catch(Exception e)
		{
			System.out.println(e);
		}
		try {
			Class.forName(databasedriver).newInstance();
			Connection connection = DriverManager.getConnection(url,dbusername,dbpassword);
			PreparedStatement ps = connection.prepareStatement("select username,password from users where username = ? and password = ?");
			ps.setString(1, username);
			ps.setString(2,password);
			ResultSet rs = ps.executeQuery();
			status = rs.next();		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
		
	}

}
