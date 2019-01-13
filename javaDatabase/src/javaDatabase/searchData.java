package javaDatabase;
import java.sql.*;

public class searchData {
	public searchData()
	{
		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Connection con = DriverManager.getConnection(url,"root","baban123");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from student");
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
