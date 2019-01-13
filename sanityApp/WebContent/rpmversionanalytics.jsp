<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RM version</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"></link>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'></link>
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
	 PreparedStatement livestoreversions = connection.prepareStatement("select * from dashboard where releaseversion like 'D2.4.46%'");
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
	 PreparedStatement sdtrollout = connection.prepareStatement("select schedule from dashboard where phase like '%SDT store rollout%'");
	 ResultSet sdtrollResultSet = sdtrollout.executeQuery(); 
%>
 <div class="wrapper">
  <div class="wrapper_container">
  <!-- start content -->
    <div class="site-wrapper active" id="target">
      <div class="site-wrapper_left-col">
        <!-- <a href="#" class="logo">Specsavers</a> -->
        <a href="dashboard.jsp" class="logo" style="font-size: 20px;">BACK</a>
        <div class="left-nav">
           <a href="analytics.jsp"><i class="fa fa-pie-chart"></i>Analytics</a>
		  <a href="dfouronenonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>Rollout Analytics</a>
		  <a href="rhelanalytics.jsp"><i class="fa fa-pie-chart"></i>RHEL Analytics</a>
		  <a href="bridgecountanalytics.jsp"><i class="fa fa-pie-chart"></i>Bridge Analytics</a>
          <a href="releaseversionanalytics.jsp"><i class="fa fa-pie-chart"></i>Release Analytics</a>
          <a href="pilotanalytics.jsp"><i class="fa fa-pie-chart"></i>Pilot Analytics</a>
          <a href="rpmversionanalytics.jsp" class="active"><i class="fa fa-pie-chart"></i>RPM version Analytics</a>
        </div>
      </div>
	        <div class="site-wrapper_top-bar">
	  <img src="images/Specsavers.png" height="50"/>
      </div>
      <!-- inner content -->
      <div class="row">
		<div class = "blink"><a><div class="col-1">
         <div class="user-item">
            <div class="user-item_info">
            <p class="name"></p>
          </div>
        </div>
		</div></a></div>
		<div class="row">
		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name"></p>
               
            </div>
          </div>
        </div></a>
				<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name"></p>
            </div>
          </div>
        </div></a>
		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name"></p>
            </div>
          </div>
        </div></a>
		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name"></p>
            </div>
          </div>
        </div></a>
		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name"></p>
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