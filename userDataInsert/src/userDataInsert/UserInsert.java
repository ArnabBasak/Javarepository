package userDataInsert;
import java.sql.*;
import java.util.Scanner;


public class UserInsert {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("enter first name");
		String firstname = in.next();
		System.out.println("enter last name");
		String lastname = in.next();
		try{
			String myurl = "jdbc:mysql://localhost:3306/test";
			Connection conn = DriverManager.getConnection(myurl,"root","baban123");
			PreparedStatement pstm = conn.prepareStatement("insert into student values(?,?)");
			pstm.setString(1,firstname);
			pstm.setString(2, lastname);
			int i = pstm.executeUpdate();
			System.out.println(i+" records inserted");
			}
		catch(Exception e)
		{
			System.err.println("Got an exception");
			System.err.println(e.getMessage());
		}
			

	}

}
