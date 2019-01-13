<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"></link>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'></link>
<link rel="stylesheet" href="css/styledashboard.css" type="text/css"></link>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
 if(session.getAttribute("username") == null)
 {
	 response.sendRedirect("index.jsp");
 }
%>
<%	
	 ResourceBundle prop = ResourceBundle.getBundle("dbcon");
	 String databasedriver = prop.getString("dbdriver");
	 String dbpassword = prop.getString("password");
	 String url = prop.getString("dburl");
	 String dbusername = prop.getString("username");
	 Class.forName(databasedriver).newInstance();
	 Connection connection = DriverManager.getConnection(url,dbusername,dbpassword);
	 PreparedStatement livestoreversions = connection.prepareStatement("select * from dashboard where schedule like 'finished'");
	 ResultSet livestoreversionresultset = livestoreversions.executeQuery();
	 PreparedStatement pilotversions = connection.prepareStatement("select releaseversion from dashboard where schedule like 'yet to scheduled'");
	 ResultSet pilotversionresultset = pilotversions.executeQuery();
	 PreparedStatement pilotone = connection.prepareStatement("select schedule from dashboard where phase like '%pilot 1%'");
	 ResultSet pilotoneresultset = pilotone.executeQuery();
	 PreparedStatement pilottwo = connection.prepareStatement("select schedule from dashboard where phase like '%pilot 2%'");
	 ResultSet pilottworesultset = pilottwo.executeQuery();
	 PreparedStatement pilotthree = connection.prepareStatement("select schedule from dashboard where phase like '%pilot 3%'");
	 ResultSet pilotthreeresultset = pilotthree.executeQuery();
	 PreparedStatement nonsdtrollout = connection.prepareStatement("select schedule from dashboard where phase like '%NONSDT store rollout%'");
	 ResultSet nonsdtrolloutresultset = nonsdtrollout.executeQuery();
	 PreparedStatement sdtrollout = connection.prepareStatement("select schedule from dashboard where phase like 'SDT store rollout%'");
	 ResultSet sdtrollResultSet = sdtrollout.executeQuery();
%>
	<div class="wrapper">
		<div class="wrapper_container">
			<!-- start content -->
			<div class="site-wrapper active" id="target">
				<div class="site-wrapper_left-col">
					<a href="#" class="logo">Specsavers</a>
					<div class="left-nav">
						<a href="dashboard.jsp" class="active"><i class="fa fa-home"></i>Dashboard</a>
						<a href="pilotchecks.jsp"><i class="fa fa-cog"></i>Pilot
							Checks</a> <a href="rolloutchecks.jsp"><i class="fa fa-cog"></i>Rollout
							Checks</a> <a href="basicchecks.jsp"><i class="fa fa-cog"></i>Basic
							Checks</a> <a href="analytics.jsp"><i class="fa fa-pie-chart"></i>Analytics</a>
						<a href="logout.jsp"><i class="fa fa-user"></i>Logout</a>
					</div>
				</div>
				<div class="site-wrapper_top-bar">
					<img src="images/Specsavers.png" height="50" />
				</div>
				<!-- inner content -->
				<div class="row">
					<div class="col-1">
						<div class="user-item">
							<div class="user-item_info">
								<p class="name">current live version</p>
								<%if(livestoreversionresultset.next()){out.print("<p>"+livestoreversionresultset.getString("releaseversion")+"</p>");} %>
							</div>
						</div>
					</div>
					<div class="blink">
						<a><div class="col-1">
								<div class="user-item">
									<div class="user-item_info">
										<p class="name">Pilot</p>
										<%if(pilotversionresultset.next()){out.print("<p>"+pilotversionresultset.getString("releaseversion")+"</p>");}%>
									</div>
								</div>
							</div></a>
					</div>
					<div class="row">
						<a><div class="col-1">
								<div class="user-item">
									<div class="user-item_info">
										<p class="name">Pilot 1 is on</p>
										<%if(pilotoneresultset.next()){out.print("<p>"+pilotoneresultset.getString("schedule")+"</p>");}%>

									</div>
								</div>
							</div></a> <a><div class="col-1">
								<div class="user-item">
									<div class="user-item_info">
										<p class="name">Pilot 2 is on</p>
										<%if(pilottworesultset.next()){out.print("<p>"+pilottworesultset.getString("schedule")+"</p>");}%>
									</div>
								</div>
							</div></a> <a><div class="col-1">
								<div class="user-item">
									<div class="user-item_info">
										<p class="name">Pilot 3 is on</p>
										<%if(pilotthreeresultset.next()){out.print("<p>"+pilotthreeresultset.getString("schedule")+"</p>");}%>
									</div>
								</div>
							</div></a> <a><div class="col-1">
								<div class="user-item">
									<div class="user-item_info">
										<p class="name">Rollout NON SDT</p>
										<%if(nonsdtrolloutresultset.next()){out.print("<p>"+nonsdtrolloutresultset.getString("schedule")+"</p>");}%>
									</div>
								</div>
							</div></a> <a><div class="col-1">
								<div class="user-item">
									<div class="user-item_info">
										<p class="name">Rollout SDT</p>
										<%if(sdtrollResultSet.next()){out.print("<p>"+sdtrollResultSet.getString("schedule")+"</p>");}%>
									</div>
								</div>
							</div></a>
					</div>
				</div>
			</div>
			<!-- end inner content -->
		</div>
		<!-- end content -->
	</div>
	</div>
</body>
</html>