<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analytics</title>
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
PreparedStatement totalfailedstores = connection.prepareStatement("select count(*) from deployment where dep_duration = 0");
ResultSet totalfailedstoresresultset = totalfailedstores.executeQuery();
String failedstores = "";
while(totalfailedstoresresultset.next())
{
	failedstores = totalfailedstoresresultset.getString(1);
}
PreparedStatement totalsuccessfulstores = connection.prepareStatement("select count(*) from deployment where dep_duration != 0");
ResultSet totalsuccessfulstoresresultset = totalsuccessfulstores.executeQuery();
String successfulstores = "";
while(totalsuccessfulstoresresultset.next())
{
	successfulstores = totalsuccessfulstoresresultset.getString(1);
}
PreparedStatement totalrollout = connection.prepareStatement("select count(distinct version) from deployment");
ResultSet totalrolloutresultset = totalrollout.executeQuery();
String totalrolloutcount = "";
while(totalrolloutresultset.next())
{
	totalrolloutcount = totalrolloutresultset.getString(1);
}
PreparedStatement avgeodfail = connection.prepareStatement("select count(*) from deployment where eod_duration = 0");
ResultSet avgeodfailset = avgeodfail.executeQuery();
String totalavgeodfailcount = "";
while(avgeodfailset.next())
{
	totalavgeodfailcount = avgeodfailset.getString(1);
}
int rollout = Integer.parseInt(totalrolloutcount);
int avgstorefailing = (Integer.parseInt(failedstores)/rollout);
int avgstoresuccessful = (Integer.parseInt(successfulstores)/rollout);
int totalavgeodfail = (Integer.parseInt(totalavgeodfailcount)/rollout);
%>
<div class="wrapper">
  <div class="wrapper_container">
  <!-- start content -->
    <div class="site-wrapper active" id="target">
      <div class="site-wrapper_left-col">
       <!-- <a href="#" class="logo">Specsavers</a> -->
      <a href="dashboard.jsp" class="logo" style="font-size: 20px;">BACK</a>
       
        <div class="left-nav">
          <a href="analytics.jsp" class="active"><i class="fa fa-pie-chart"></i>Analytics</a>
		  <a href="dfouronenonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>Rollout Analytics</a>
		  <a href="rhelanalytics.jsp"><i class="fa fa-pie-chart"></i>RHEL Analytics</a>
		  <a href="bridgecountanalytics.jsp"><i class="fa fa-pie-chart"></i>Bridge Analytics</a>
          <a href="releaseversionanalytics.jsp"><i class="fa fa-pie-chart"></i>Release Analytics</a>
          <a href="pilotanalytics.jsp"><i class="fa fa-pie-chart"></i>Pilot Analytics</a>
       <!--    <a href="dashboard.jsp"><i class="fa fa-user"></i>back</a> -->
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
              <p class="name">Average store upgrade rollout failures</p><p><%out.println(avgstorefailing);%></p>
            </div>
          </div>
        </div>
        	  	  	  <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Average successful store upgrades</p><p><%out.println(avgstoresuccessful);%></p>
            </div>
          </div>
        </div>
                	  	  	  <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Average count of EOD failure</p><p><%out.println(totalavgeodfail);%></p>
            </div>
          </div>
        </div>
      </div>
      <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Failed', 'Successful'],
		  ['Stores with Upgrade Failures', 130],
          ['Stores with Successful Upgrades', 642],
          
		           
        ]);

        var options = {
          is3D: true,
          backgroundColor: 'transparent',
          width: 600,
          height: 200,
          title: 'Store Upgrade : Success-Failure distribution',
          colors: ['#00ccff','#336699','#ff0000']
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
    <div>
					<table>
						<tr style="align-content: center;">
							<td style="align-items: center;">
								<div id="piechart_3d">
									<script
										src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
								</div>
							</td>
							</tr>
							<tr>
							<td style="align-items: center;">
								<table align="center" cellpadding="5" cellspacing="5" border="5"
									style=height: relative; width:100%; overflow-y:auto; display: block"; >
									<thead>store failing in every release</thead>
									<tr>
									</tr>
									<!-- <b> successful stores list<b><br> -->
											<tr bgcolor="#A52A2A">
												<th style="layout: fixed; color: white; text-align: center"><b>Store
														Number</b></th>
												<th style="layout: fixed; color: white; text-align: center" ><b>Store
														Name</b></th>
											</tr> <%
 	PreparedStatement successfulstoreslist = connection.prepareStatement("select store,name from rollout41 where dep_duration=0 and name IN(select name from rollout42 where dep_duration=0 and name IN(select name from rollout43 where dep_duration=0 and name IN(select name from rollout44 where dep_duration=0 and name IN(select name from rollout45 where dep_duration=0 and name IN(select name from rollout where dep_duration = 0 and name IN(select name from rollout47 where dep_duration = 0) and name IN(select name from rollout48 where dep_duration = 0))))))");
 	ResultSet successfulstorelistresultset = successfulstoreslist.executeQuery();
 	while (successfulstorelistresultset.next()) {
 %>
											<tr bgcolor="#DEB887">
												<td style="padding-left: 30px;"><%=successfulstorelistresultset.getString("Store")%></td>
												<td  style="padding-left: 170px; padding-right: 50px; padding-right: 15px;" width="100%;"><%=successfulstorelistresultset.getString("Name")%></td>
											</tr> <%
 }
connection.close();
%>
								</table>

							</td>
						</tr>
					</table>
				</div>
    

				<%-- <div id="piechart_3d">
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</div>
<table align="center" cellpadding="50" cellspacing="125" border="15" style="height:relative; display:block";>
<tr>
</tr>
<b>List of stores failing in every release<b><br><br>
<tr bgcolor="#A52A2A">
<td style="layout:fixed; color:white; text-align:center; font:30px;"><b>Store Number&nbsp;&nbsp;&nbsp;</b></td>
<td style="layout:fixed; color:white;"><b>Store Name</b></td>
</tr>
<%
PreparedStatement successfulstoreslist = connection.prepareStatement(" select store,name from rollout41 where dep_duration=0 and name IN(select name from rollout42 where dep_duration=0 and name IN(select name from rollout43 where dep_duration=0 and name IN(select name from rollout44 where dep_duration=0 and name IN(select name from rollout45 where dep_duration=0 and name IN(select name from rollout where dep_duration = 0 and name IN(select name from rollout47 where dep_duration = 0))))))");
ResultSet successfulstorelistresultset = successfulstoreslist.executeQuery();
while(successfulstorelistresultset.next()){
%>
<tr bgcolor="#DEB887">
<td><%=successfulstorelistresultset.getString("Store") %></td>
<td><%=successfulstorelistresultset.getString("Name")%></td>
</tr>
<%
 }
connection.close();
%>
</table> --%>
    </div>
      <!-- end inner content -->
    </div>  
  <!-- end content -->
  </div>
</body>
</html>