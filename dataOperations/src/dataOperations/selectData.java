package dataOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class selectData {
	public selectData()
	{
		try {
			String url = "jdbc:mysql://localhost:3306/student";
			Connection con = DriverManager.getConnection(url,"root","library");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from studentname");
			while(rs.next())
			{
				String firstName = rs.getString("firstname");
				String lastName = rs.getString("lastname");
				System.out.println("data fetched from the database is: ");
				System.out.format("%s, %s \n",firstName, lastName);
			}
			con.close();			
		}
		catch(Exception e)
		{
			System.err.println("Got an exception");
			System.err.println(e.getMessage());
		}
	}


}
