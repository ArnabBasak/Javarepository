package dataOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class updateData {
	public updateData()
	{
		try {
			String url = "jdbc:mysql://localhost:3306/student";
			Connection con = DriverManager.getConnection(url,"root","library");
			Statement st = con.createStatement();
			st.executeUpdate("UPDATE studentname set firstname = 'Arnab' where lastname = 'basak'");
			con.close();
			System.out.println("data updated successfully");
		}
		catch(Exception e)
		{
			System.err.println("Got an exception");
			System.err.println(e.getMessage());
		}
	}
}

