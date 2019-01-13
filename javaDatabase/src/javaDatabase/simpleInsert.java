package javaDatabase;
import java.sql.*;

public class simpleInsert {

	public simpleInsert() {
		try{
		String myurl = "jdbc:mysql://localhost:3306/test";
		Connection conn = DriverManager.getConnection(myurl,"root","baban123");
		Statement st = conn.createStatement();
		st.executeUpdate("INSERT INTO student "+"Values ('Roshni','Bukane')");
		conn.close();
		System.out.println("data inserted successfully");
		}
		catch(Exception e)
		{
			System.err.println(e.getMessage());
		}
	}

}
