package javaDatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Dataupdate {
	public Dataupdate()
	{
		try{
			String myurl = "jdbc:mysql://localhost:3306/test";
			Connection conn = DriverManager.getConnection(myurl,"root","baban123");
			Statement st = conn.createStatement();
			st.executeUpdate("update student set firstname = 'Arnab' where lastname = 'basak'");
			conn.close();
			System.out.println("data updated successfully");
			}
			catch(Exception e)
			{
				System.err.println(e.getMessage());
			}
	}

}
