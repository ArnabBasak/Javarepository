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
ResultSet avgeodfailresultset = avgeodfail.executeQuery();
String avgfailcount = "";
while(avgeodfailresultset.next())
{
	avgfailcount = avgeodfailresultset.getString(1);
}
PreparedStatement avgeodsuccess = connection.prepareStatement("select count(*) from deployment where eod_duration != 0");
ResultSet avgeodsuccessresultset = avgeodsuccess.executeQuery();
String avgsuccesscount = "";
while(avgeodsuccessresultset.next())
{
	avgsuccesscount = avgeodsuccessresultset.getString(1);
}
PreparedStatement avgreplicationsuccess = connection.prepareStatement("select count(*) from deployment where replication_duration != 0");
ResultSet avgreplicationsuccessresultset = avgreplicationsuccess.executeQuery();
String avgsuccessreplication = "";
while(avgreplicationsuccessresultset.next())
{
	avgsuccessreplication = avgreplicationsuccessresultset.getString(1);
}
PreparedStatement avgreplicationfail = connection.prepareStatement("select count(*) from deployment where replication_duration = 0");
ResultSet avgreplicationfailresultset = avgreplicationfail.executeQuery();
String avgreplfail = "";
while(avgreplicationfailresultset.next())
{
	avgreplfail = avgreplicationfailresultset.getString(1);
}
int rollout = Integer.parseInt(totalrolloutcount);
int avgstorefailing = (Integer.parseInt(failedstores)/rollout);
int avgstoresuccessful = (Integer.parseInt(successfulstores)/rollout);
int avgeodfailed = (Integer.parseInt(avgfailcount)/rollout);
int aveeodsucces = (Integer.parseInt(avgsuccesscount)/rollout);
int avgreplicationsuccesscount = (Integer.parseInt(avgsuccessreplication)/rollout);
int avgreplicationfailcount = (Integer.parseInt(avgreplfail)/rollout);
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
              <p class="name">EOD Success-Failure Distribution on Release Date<br><br><p class="name" style="color: darkgreen;">Average Successful&nbsp;&nbsp;&nbsp;<%out.println(aveeodsucces);%></p><p class="name" style="color: red;">Average Failure&nbsp;&nbsp;&nbsp;<%out.println(avgeodfailed);%></p></p>
            </div>
          </div>
        </div>
        	  	  	  <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Replication Success-Failure Distribution on Release Date<br><br><p class="name" style="color: darkgreen;">Average Successful&nbsp;&nbsp;&nbsp;<%out.println(avgreplicationsuccesscount);%></p><p class="name" style="color: red;">Average Failure&nbsp;&nbsp;&nbsp;<%out.println(avgreplicationfailcount);%></p></p></p>
            </div>
          </div>
        </div>
                 <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Deployment Success-Failure distribution on Release Date<br><br><p class="name" style="color: darkgreen;">Average Successful&nbsp;&nbsp;&nbsp;<%out.println(avgstoresuccessful);%></p><p class="name" style="color: red;">Average Failure&nbsp;&nbsp;&nbsp;<%out.println(avgstorefailing);%></p></p></p></p>
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
          ['Failed', 'Successful'],         /*color mapping */     
          ['Stores with EOD Failures',110], //#cc0000
          ['Stores with Replication Failures',40], //#ff0066
          ['Stores with Upgrade Failures', 128], //#993366
          ['Stores with Successful EOD',667], // #66ff33
          ['Stores with Successful Replication', 737], //#008000
          ['Stores with Successful Upgrades',650] //#00cc66
          
		           
        ]);

        var options = {
          is3D: true,
          backgroundColor: 'transparent',
          width: 800,
          height: 400,
          title: 'Deployment : Success-Failure distribution',
          colors: ['#cc0000','#ff0066','#993366','#66ff33','#008000','#00cc66']
        };

        var chart = new google.visualization.PieChart(document.getElementById('deploymentpiechart_3d'));
        chart.draw(data, options);
      }
    </script>
    <div>
					<table>
						<tr style="align-content: center;">
							<td style="align-items: center;">
								<div id="deploymentpiechart_3d">
									<script
										src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
								</div>
							</td>
							</tr>
								</table>
				</div>
    </div>
      <!-- end inner content -->
    </div>  
  <!-- end content -->
  </div>
</body>
</html>