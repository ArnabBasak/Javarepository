<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RHEL Analytics</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"></link>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'></link>
<link rel="stylesheet" href="css/styledashboard.css" type="text/css"></link>
</head>
<body style="overflow: auto;">
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
Connection con = DriverManager.getConnection(url,dbusername,dbpassword);
PreparedStatement rhelsixstores = con.prepareStatement("select count(*) From devserver where rhelversion like '%release 6.0%'");
ResultSet rhelsixstoresresultset = rhelsixstores.executeQuery();
String rhelsixcount = "";
while(rhelsixstoresresultset.next())
{
	rhelsixcount = rhelsixstoresresultset.getString(1);
}
PreparedStatement rhelfourstores = con.prepareStatement("select count(*) from devserver where rhelversion like '%release 4%'");
ResultSet rhelfourstoresresultset = rhelfourstores.executeQuery();
String rhelfourcount="";
while(rhelfourstoresresultset.next())
{
	rhelfourcount = rhelfourstoresresultset.getString(1);
}
PreparedStatement rhelsixpointsixstores = con.prepareStatement("select count(*) from devserver where rhelversion like '%release 6.6%'");
ResultSet rhelsixpointsixstoresresultset = rhelsixpointsixstores.executeQuery();
String rhelsixpointsixstorescount = "";
while(rhelsixpointsixstoresresultset.next())
{
	rhelsixpointsixstorescount = rhelsixpointsixstoresresultset.getString(1);
}
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
		  <a href="rhelanalytics.jsp" class="active"><i class="fa fa-pie-chart"></i>RHEL Analytics</a>
		  <a href="bridgecountanalytics.jsp"><i class="fa fa-pie-chart"></i>Bridge Analytics</a>
          <a href="releaseversionanalytics.jsp"><i class="fa fa-pie-chart"></i>Release Analytics</a>
		 <!--  <a href="analytics.jsp"><i class="fa fa-user"></i>back</a> -->
        </div>
      </div>
	        <div class="site-wrapper_top-bar">
	  <img src="images/Specsavers.png" height="50"/>
      </div>
      <!-- inner content -->
      <div class="row">
	  	  	  <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Total RHEL 6 dev stores</p><p><%out.println(rhelsixcount);%></p>
            </div>
          </div>
        </div>
		<a><div class="col-1">
         <div class="user-item">
            <div class="user-item_info">
            <p class="name">Total RHEL 4 dev stores</p><p><%out.println(rhelfourcount);%></p>
          </div>
        </div>
		</div></a>
		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total RHEL 6.6 dev stores</p><p><%out.println(rhelsixpointsixstorescount);%></p>
               
            </div>
          </div>
        </div></a>
      </div>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['devserver', 'rhelversion'],
		  ['RHEL 4 ', 3],
          ['RHEL 6', 12],
          ['RHEL 6.6', 4]
		           
        ]);

        var options = {
          is3D: true,
          backgroundColor: 'transparent',
          width: 600,
          height: 500,
          title: 'RHEL version statistics for devlopment servers',
          colors: ['#00ccff','#336699','#ff0000']
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
 <div id="piechart_3d">
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</div>
      </div>
      <!-- end inner content -->
    </div>  
  <!-- end content -->
  </div>
</body>
</html>