package dataOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class insertData {
	public insertData()
	{
	try {
		String url = "jdbc:mysql://localhost:3306/student";
		Connection con = DriverManager.getConnection(url,"root","library");
		Statement st = con.createStatement();
		st.executeUpdate("INSERT INTO studentname "+"Values ('arnab','basak')");
		con.close();
		System.out.println("data inserted successfully");
	}
	catch(Exception e)
	{
		System.err.println("Got an exception");
		System.err.println(e.getMessage());
	}
}
}
