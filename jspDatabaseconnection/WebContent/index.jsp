<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simple insert</title>
</head>
<body align="center">
	<form action="insert.jsp" method="post">
		<h1>
			First Name:<input type="text" name="firstname" required>
		</h1>
		<br>
		<h1>
			last Name:<input type="text" name="lastname" required>
		</h1>
		<br> <input type="submit" value="insert">
	</form>
</body>
</html>