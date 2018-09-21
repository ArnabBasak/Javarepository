package userInputdataOperations;
import java.util.*;
import java.sql.*;

public class userInsert {
	public userInsert()
	{
		Scanner in = new Scanner(System.in);
		System.out.println("enter first name");
		String firstname = in.next();
		System.out.println("enter last name");
		String lastname = in.next();
		try {
			String url = "jdbc:mysql://localhost:3306/student";
			Connection con = DriverManager.getConnection(url,"root","library");
			PreparedStatement pstm = con.prepareStatement("insert into studentname values(?,?)");
			pstm.setString(1, firstname);
			pstm.setString(2, lastname);
			int i = pstm.executeUpdate();
			System.out.println(i+ " records inserted ");
			
		}
		catch(Exception e)
		{
			System.err.println("Got an exception");
			System.err.println(e.getMessage());
		}
	}
		

}
