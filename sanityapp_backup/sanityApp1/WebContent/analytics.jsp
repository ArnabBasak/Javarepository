<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analytics</title>
<link rel="stylesheet" href="css/analyticshomepage.css"></link>
</head>
<body>
<%
 if(session.getAttribute("username") == null)
 {
	 response.sendRedirect("index.jsp");
 }
%>
<div class="sp-container">
<br>
 <img src="images/Specsavers.png"/>
	<div class="sp-content">
	<nav id="navigationBar" >
  <ul>
    <li>
      <a href="dashboard.jsp" class="link">Home</a>
    </li>
    <li>
      <a href="pilotanalytics.jsp" class="link">Pilot</a>
    </li>
    <li>
      <a href="sdtrolloutanalytics.jsp" class="link">SDT Rollout</a>
    </li>
    <li>
      <a href="nonsdtrolloutanalytics.jsp" class="link">NON SDT Rollout</a>
    </li>
    <li>
      <a href="basicanalytics.jsp" class="link">Basic Checks</a>
    </li>
  </ul>
</nav>
		<h2 class="frame-1">WELCOME</h2>
		<h2 class="frame-2">TO</h2>
		<h2 class="frame-3">POST DEPLOYMENT TESTING ANALYTICS</h2>
		<h2 class="frame-4">FOR LIVE STORES</h2>
		<h2 class="frame-5">
			<span>POST</span>
			<span>DEPLOYMENT</span>
			<span>ANALYTICS</span>
		</h2>
	</div>
</div>
</body>
</html>