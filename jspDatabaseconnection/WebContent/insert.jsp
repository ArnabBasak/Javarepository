<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
try{
	String fname = request.getParameter("firstname");
	String lname = request.getParameter("lastname");
	String connectionURL = "jdbc:mysql://localhost:3306/test";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL,"root","baban123");
	PreparedStatement pst = connection.prepareStatement("INSERT INTO STUDENT VALUES(?,?)");
	pst.setString(1,fname);
	pst.setString(2,lname);
	pst.executeUpdate();
	out.println("record inserted successfully");
	
}
catch(Exception e)
{
		out.println(e);
}
%>
</body>
</html>