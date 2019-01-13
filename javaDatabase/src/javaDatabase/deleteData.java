package javaDatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class deleteData {
	public deleteData()
	{
		try{
			String myurl = "jdbc:mysql://localhost:3306/test";
			Connection conn = DriverManager.getConnection(myurl,"root","baban123");
			Statement st = conn.createStatement();
			st.executeUpdate("delete from student where lastname ='basak'");
			conn.close();
			System.out.println("data deleted successfully");
			}
			catch(Exception e)
			{
				System.err.println(e.getMessage());
			}
	}
}
