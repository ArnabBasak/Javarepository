package dataOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class deleteData {
	public  deleteData()
	{
			try {
				String url = "jdbc:mysql://localhost:3306/student";
				Connection con = DriverManager.getConnection(url,"root","library");
				Statement st = con.createStatement();
				st.executeUpdate("delete from studentname where lastname = 'basak'");
				con.close();
				System.out.println("data deleted successfully");
			}
			catch(Exception e)
			{
				System.err.println("Got an exception");
				System.err.println(e.getMessage());
			}
		}
	}

