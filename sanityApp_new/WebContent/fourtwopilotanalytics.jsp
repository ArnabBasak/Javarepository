<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>D2.4.42 Pilot analytics</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"></link>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'></link>
<link rel="stylesheet" href="css/styledashboard.css" type="text/css"></link>
</head>
<body>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        ['Failed', 'Success'],
   		['EOD Failures',1 ],//#cc0000
   		['Replication Failures',0], //#ff0066
   		['Upgrade Failures', 1], //#993366
        ['Successful EOD',7 ],// #66ff33
        ['Successful Replication', 8], //#008000
        ['Successful Upgrades',7] //#00cc66
		           
        ]);

        var options = {
          is3D: true,
          backgroundColor: 'transparent',
          width: 550,
          height: 300, 
          title: 'Store Upgrade : Success-Failure distribution',
          colors: ['#cc0000','#ff0066','#993366','#66ff33','#008000','#00cc66']
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
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

//pilot 1 date
PreparedStatement pilot1 = connection.prepareStatement("select pilot_Date from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1'limit 1;");
ResultSet pilot1resultset = pilot1.executeQuery();
String pilot1date = "";
while(pilot1resultset.next())
{
	pilot1date = pilot1resultset.getString(1);
}
//pilot 2 date
PreparedStatement pilot2 = connection.prepareStatement("select pilot_Date from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2'limit 1;");
ResultSet pilot2resultset = pilot2.executeQuery();
String pilot2date = "";
while(pilot2resultset.next())
{
	pilot2date = pilot2resultset.getString(1);
}
//pilot 3 date
PreparedStatement pilot3 = connection.prepareStatement("select pilot_Date from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3'limit 1;");
ResultSet pilot3resultset = pilot3.executeQuery();
String pilot3date = "";
while(pilot3resultset.next())
{
	pilot3date = pilot3resultset.getString(1);
}
//total pilot stores
PreparedStatement totalpilotstores = connection.prepareStatement("select count(*) from pilot where version = 'D2.4.42'");
ResultSet totalpilotstoresresultset = totalpilotstores.executeQuery();
String totalpilotstorecount = "";
while(totalpilotstoresresultset.next())
{
	totalpilotstorecount = totalpilotstoresresultset.getString(1);
}
//pilot 1 stores
PreparedStatement totalpilot1stores = connection.prepareStatement("select count(*) from pilot where pilot_type = 'pilot 1' and version = 'D2.4.42'");
ResultSet totalpillot1storesresultset = totalpilot1stores.executeQuery();
String totalpilot1storescount = "";
while(totalpillot1storesresultset.next())
{
	totalpilot1storescount = totalpillot1storesresultset.getString(1);
}
//total pilot 2 stores
PreparedStatement totalpilot2stores = connection.prepareStatement("select count(*) from pilot where pilot_type = 'pilot 2' and version = 'D2.4.42'");
ResultSet totalpillot2storesresultset = totalpilot2stores.executeQuery();
String totalpilot2storescount = "";
while(totalpillot2storesresultset.next())
{
	totalpilot2storescount = totalpillot2storesresultset.getString(1);
}
//total pilot 3 stores
PreparedStatement totalpilot3stores = connection.prepareStatement("select count(*) from pilot where pilot_type = 'pilot 3' and version = 'D2.4.42'");
ResultSet totalpillot3storesresultset = totalpilot3stores.executeQuery();
String totalpilot3storescount = "";
while(totalpillot3storesresultset.next())
{
	totalpilot3storescount = totalpillot3storesresultset.getString(1);
}
//total failed stores
PreparedStatement totalfailedstores = connection.prepareStatement("select count(*) from pilot where dep_duration = 0 and version = 'D2.4.42'");
ResultSet totalfailedstoresresultset = totalfailedstores.executeQuery();
String totalfailedstorecount = "";
while(totalfailedstoresresultset.next())
{
	totalfailedstorecount = totalfailedstoresresultset.getString(1);
}
//totals succssfulstores
PreparedStatement totalsuccessfulstores = connection.prepareStatement("select count(*) from pilot where dep_duration != 0 and version = 'D2.4.42'");
ResultSet totalsuccessfulstoresresultset = totalsuccessfulstores.executeQuery();
String successfulstorecount = "";
while(totalsuccessfulstoresresultset.next())
{
	successfulstorecount = totalsuccessfulstoresresultset.getString(1);
}
//total successfuleod
PreparedStatement successeod = connection.prepareStatement("select count(*) From pilot where eod_duration != 0 and version = 'D2.4.42'");
ResultSet successeodresultset = successeod.executeQuery();
String successeodcount = "";
while(successeodresultset.next())
{
	successeodcount = successeodresultset.getString(1);
}
//total successful replication
PreparedStatement successfulrep = connection.prepareStatement("select count(*) From pilot where replication_duration != 0 and version = 'D2.4.42'");
ResultSet successfulrepresultset = successfulrep.executeQuery();
String successfulrepcount = "";
while(successfulrepresultset.next())
{
	successfulrepcount = successfulrepresultset.getString(1);
}
//total failed replication
PreparedStatement failrep = connection.prepareStatement("select count(*) From pilot where replication_duration = 0 and version = 'D2.4.42'");
ResultSet failrepresultset = failrep.executeQuery();
String failrepcount = "";
while(failrepresultset.next())
{
	failrepcount = failrepresultset.getString(1);
}
//total failed eod
PreparedStatement faileod = connection.prepareStatement("select count(*) From pilot where eod_duration = 0  and version = 'D2.4.42'");
ResultSet faileodresultset = faileod.executeQuery();
String faileodcount = "";
while(faileodresultset.next())
{
	faileodcount = faileodresultset.getString(1);
}
//total pilot 1 failed stores
PreparedStatement pilot1fail = connection.prepareStatement("select count(*) from pilot where dep_duration = 0 and version = 'D2.4.42' and pilot_type = 'pilot 1'");
ResultSet pilot1failresultset = pilot1fail.executeQuery();
String pilot1failedstores = "";
while(pilot1failresultset.next())
{
	pilot1failedstores = pilot1failresultset.getString(1);
}
//total pilot 1 successful stores
PreparedStatement pilot1success = connection.prepareStatement("select count(*) from pilot where dep_duration != 0 and version = 'D2.4.42' and pilot_type = 'pilot 1'");
ResultSet pilot1successresultset = pilot1success.executeQuery();
String pilot1successfulstores = "";
while(pilot1successresultset.next())
{
	pilot1successfulstores = pilot1successresultset.getString(1);
}
//max pilot 1 max eod
PreparedStatement pilot1maxeod = connection.prepareStatement("select name,eod_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and eod_duration in(select max(eod_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1')");
ResultSet pilot1maxeodresultset = pilot1maxeod.executeQuery();
String pilot1maxeodcount = "";
String pilot1maxeodstore = "";
while(pilot1maxeodresultset.next())
{
	pilot1maxeodstore = pilot1maxeodresultset.getString(1);
	pilot1maxeodcount = pilot1maxeodresultset.getString(2);
}
//min pilot 1 min eod
PreparedStatement pilot1mineod = connection.prepareStatement("select name,eod_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and eod_duration in(select min(eod_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and eod_duration!=0)");
ResultSet pilot1mineodresultset = pilot1mineod.executeQuery();
String pilot1mineodcount = "";
String pilot1mineodstore = "";
while(pilot1mineodresultset.next())
{
	pilot1mineodstore = pilot1mineodresultset.getString(1);
	pilot1mineodcount = pilot1mineodresultset.getString(2);
}
//max pilot 1 replication
PreparedStatement pilot1maxrep = connection.prepareStatement("select name,replication_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and replication_duration in(select max(replication_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1')");
ResultSet pilot1maxrepresultset = pilot1maxrep.executeQuery();
String pilot1maxrepcount = "";
String pilot1maxrepstore = "";
while(pilot1maxrepresultset.next())
{
	pilot1maxrepstore = pilot1maxrepresultset.getString(1);
	pilot1maxrepcount = pilot1maxrepresultset.getString(2);
}
//min pilot 1 replication
PreparedStatement pilot1minrep = connection.prepareStatement("select name,replication_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and replication_duration in(select min(replication_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and replication_duration!=0)");
ResultSet pilot1minrepresultset = pilot1minrep.executeQuery();
String pilot1minrepcount = "";
String pilot1minrepstore = "";
while(pilot1minrepresultset.next())
{
	pilot1minrepstore = pilot1minrepresultset.getString(1);
	pilot1minrepcount = pilot1minrepresultset.getString(2);
}
//pilot 1 max deployment
PreparedStatement pilot1maxdep = connection.prepareStatement("select name,dep_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and dep_duration in(select max(dep_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1')");
ResultSet pilot1maxdepresultset = pilot1maxdep.executeQuery();
String pilot1maxdepstore = "";
String pilot1maxdepcount = "";
while(pilot1maxdepresultset.next())
{
	pilot1maxdepstore = pilot1maxdepresultset.getString(1);
	pilot1maxdepcount = pilot1maxdepresultset.getString(2);
}
//pilot 1 min deployment
PreparedStatement pilot1mindep = connection.prepareStatement("select name,dep_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and dep_duration IN(select min(dep_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 1' and dep_duration!=0);");
ResultSet pilot1mindepresultset = pilot1mindep.executeQuery();
String pilot1mindepstore = "";
String pilot1mindepcount = "";
while(pilot1mindepresultset.next())
{
	pilot1mindepstore = pilot1mindepresultset.getString(1);
	pilot1mindepcount = pilot1mindepresultset.getString(2);
}
//pilot 2 failed stores
PreparedStatement pilot2fail = connection.prepareStatement("select count(*) from pilot where dep_duration = 0 and version = 'D2.4.42' and pilot_type = 'pilot 2'");
ResultSet pilot2failresultset = pilot2fail.executeQuery();
String pilot2failedstores = "";
while(pilot2failresultset.next())
{
	pilot2failedstores = pilot2failresultset.getString(1);
}
//pilot 2 successful stores
PreparedStatement pilot2success = connection.prepareStatement("select count(*) from pilot where dep_duration != 0 and version = 'D2.4.42' and pilot_type = 'pilot 2'");
ResultSet pilot2successresultset = pilot2success.executeQuery();
String pilot2successfulstores = "";
while(pilot2successresultset.next())
{
	pilot2successfulstores = pilot2successresultset.getString(1);
}
//pilot 2 max eod
PreparedStatement pilot2maxeod = connection.prepareStatement("select name,eod_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and eod_duration in(select max(eod_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2')");
ResultSet pilot2maxeodresultset = pilot2maxeod.executeQuery();
String pilot2maxeodcount = "";
String pilot2maxeodstore = "";
while(pilot2maxeodresultset.next())
{
	pilot2maxeodstore = pilot2maxeodresultset.getString(1);
	pilot2maxeodcount = pilot2maxeodresultset.getString(2);
}
//pilot 2 min eod
PreparedStatement pilot2mineod = connection.prepareStatement("select name,eod_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and eod_duration in(select min(eod_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and eod_duration!=0)");
ResultSet pilot2mineodresultset = pilot2mineod.executeQuery();
String pilot2mineodcount = "";
String pilot2mineodstore = "";
while(pilot2mineodresultset.next())
{
	pilot2mineodstore = pilot2mineodresultset.getString(1);
	pilot2mineodcount = pilot2mineodresultset.getString(2);
}
//max pilot 2 replication
PreparedStatement pilot2maxrep = connection.prepareStatement("select name,replication_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and replication_duration in(select max(replication_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2')");
ResultSet pilot2maxrepresultset = pilot2maxrep.executeQuery();
String pilot2maxrepcount = "";
String pilot2maxrepstore = "";
while(pilot2maxrepresultset.next())
{
	pilot2maxrepstore = pilot2maxrepresultset.getString(1);
	pilot2maxrepcount = pilot2maxrepresultset.getString(2);
}
//min pilot 2 replication
PreparedStatement pilot2minrep = connection.prepareStatement("select name,replication_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and replication_duration in(select min(replication_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and replication_duration!=0)");
ResultSet pilot2minrepresultset = pilot2minrep.executeQuery();
String pilot2minrepcount = "";
String pilot2minrepstore = "";
while(pilot2minrepresultset.next())
{
	pilot2minrepstore = pilot2minrepresultset.getString(1);
	pilot2minrepcount = pilot2minrepresultset.getString(2);
}
//Pilot 2 max deployment
PreparedStatement pilot2maxdep = connection.prepareStatement("select name,dep_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and dep_duration IN(select max(dep_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2');");
ResultSet pilot2maxdepresultset = pilot2maxdep.executeQuery();
String pilot2maxdepstore = "";
String pilot2maxdepcount = "";
while(pilot2maxdepresultset.next())
{
	pilot2maxdepstore = pilot2maxdepresultset.getString(1);
	pilot2maxdepcount = pilot2maxdepresultset.getString(2);
}
// Pilot 2 min deployment
PreparedStatement pilot2mindep = connection.prepareStatement("select name,dep_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and dep_duration IN(select min(dep_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 2' and dep_duration!=0);");
ResultSet pilot2mindepresultset = pilot2mindep.executeQuery();
String pilot2mindepstore = "";
String pilot2mindepcount = "";
while(pilot2mindepresultset.next())
{
	pilot2mindepstore = pilot2mindepresultset.getString(1);
	pilot2mindepcount = pilot2mindepresultset.getString(2);
}
//pilot 3 failed stores
PreparedStatement pilot3fail = connection.prepareStatement("select count(*) from pilot where dep_duration = 0 and version = 'D2.4.42' and pilot_type = 'pilot 3'");
ResultSet pilot3failresultset = pilot3fail.executeQuery();
String pilot3failedstores = "";
while(pilot3failresultset.next())
{
	pilot3failedstores = pilot3failresultset.getString(1);
}
//pilot 3 successful stores
PreparedStatement pilot3success = connection.prepareStatement("select count(*) from pilot where dep_duration != 0 and version = 'D2.4.42' and pilot_type = 'pilot 3'");
ResultSet pilot3successresultset = pilot3success.executeQuery();
String pilot3successfulstores = "";
while(pilot3successresultset.next())
{
	pilot3successfulstores = pilot3successresultset.getString(1);
}
//pilot 3 max eod
PreparedStatement pilot3maxeod = connection.prepareStatement("select name,eod_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and eod_duration in(select max(eod_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3')");
ResultSet pilot3maxeodresultset = pilot3maxeod.executeQuery();
String pilot3maxeodcount = "";
String pilot3maxeodstore = "";
while(pilot3maxeodresultset.next())
{
	pilot3maxeodstore = pilot3maxeodresultset.getString(1);
	pilot3maxeodcount = pilot3maxeodresultset.getString(2);
}
//pilot 3 min eod
PreparedStatement pilot3mineod = connection.prepareStatement("select name,eod_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and eod_duration in(select min(eod_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3')");
ResultSet pilot3mineodresultset = pilot3mineod.executeQuery();
String pilot3mineodcount = "";
String pilot3mineodstore = "";
while(pilot3mineodresultset.next())
{
	pilot3mineodstore = pilot3mineodresultset.getString(1);
	pilot3mineodcount = pilot3mineodresultset.getString(2);
}
//max pilot 3 replication
PreparedStatement pilot3maxrep = connection.prepareStatement("select name,replication_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and replication_duration IN(select max(replication_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' );");
ResultSet pilot3maxrepresultset = pilot3maxrep.executeQuery();
String pilot3maxrepcount = "";
String pilot3maxrepstore = "";
while(pilot3maxrepresultset.next())
{
	pilot3maxrepstore = pilot3maxrepresultset.getString(1);
	pilot3maxrepcount = pilot3maxrepresultset.getString(2);
}
//min pilot 1 replication
PreparedStatement pilot3minrep = connection.prepareStatement("select name,replication_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and replication_duration in(select min(replication_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and replication_duration!=0)");
ResultSet pilot3minrepresultset = pilot3minrep.executeQuery();
String pilot3minrepcount = "";
String pilot3minrepstore = "";
while(pilot3minrepresultset.next())
{
	pilot3minrepstore = pilot3minrepresultset.getString(1);
	pilot3minrepcount = pilot3minrepresultset.getString(2);
}
//Pilot 3 max deployment
PreparedStatement pilot3maxdep = connection.prepareStatement("select name,dep_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and dep_duration in(select max(dep_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3')");
ResultSet pilot3maxdepresultset = pilot3maxdep.executeQuery();
String pilot3maxdepstore = "";
String pilot3maxdepcount = "";
while(pilot3maxdepresultset.next())
{
	pilot3maxdepstore = pilot3maxdepresultset.getString(1);
	pilot3maxdepcount = pilot3maxdepresultset.getString(2);
}
//Pilot 3 min deployment
PreparedStatement pilot3mindep = connection.prepareStatement("select name,dep_duration from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and dep_duration in(select min(dep_duration) from pilot where version = 'D2.4.42' and pilot_type = 'pilot 3' and dep_duration!=0)");
ResultSet pilot3mindepresultset = pilot3mindep.executeQuery();
String pilot3mindepstore = "";
String pilot3mindepcount = "";
while(pilot3mindepresultset.next())
{
	pilot3mindepstore = pilot3mindepresultset.getString(1);
	pilot3mindepcount = pilot3mindepresultset.getString(2);
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
          <a href="pilotanalytics.jsp"><i class="fa fa-pie-chart"></i>41 Pilot</a>
		  <a href="fourtwopilotanalytics.jsp" class="active"><i class="fa fa-pie-chart"></i>42 Pilot</a>
		  <a href="fourthreepilotanalytics.jsp"><i class="fa fa-pie-chart"></i>43 Pilot</a>
		  <a href="fourfourpilotanalytics.jsp"><i class="fa fa-pie-chart"></i>44 Pilot</a>
          <a href="fourfivepilotanalytics.jsp"><i class="fa fa-pie-chart"></i>45 Pilot</a>
          <a href="foursixpilotanalytics.jsp"><i class="fa fa-pie-chart"></i>46 Pilot</a>
          <a href="foursevenpilotanalytics.jsp"><i class="fa fa-pie-chart"></i>47 Pilot</a>
          <a href="foureightpilotanalytics.jsp"><i class="fa fa-pie-chart"></i>48 Pilot</a>
          <a href="fourninepilotanalytics.jsp"><i class="fa fa-pie-chart"></i>49 Pilot</a>
		  <!-- <a href="analytics.jsp"><i class="fa fa-user"></i>Back</a> -->
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
             <p class="name"><h3>D2.4.42 Pilot information</h3><br><p class="name">Pilot 1 Date&nbsp;&nbsp;<%out.println(pilot1date);%></p><br>
             <p class="name">Pilot 2 Date&nbsp;&nbsp;<%out.println(pilot2date);%></p><br>
             <p class="name">Pilot 3 Date&nbsp;&nbsp;<%out.println(pilot3date);%></p><br>
             <p class="name">Total pilot stores&nbsp;&nbsp;<%out.println(totalpilotstorecount);%></p><br>
             <p class ="name">Number of stores in pilot 1 is &nbsp;&nbsp;<%out.println(totalpilot1storescount);%></p>
             <p  class = "name">Number of stores in pilot 2 is &nbsp;&nbsp;<%out.println(totalpilot2storescount);%></p>
             <p  class = "name">Number of stores in pilot 3 is &nbsp;&nbsp;<%out.println(totalpilot3storescount);%></p><br><br>
             <p  class = "name" style="color:green;">Successful EODs&nbsp;&nbsp;<%out.println(successeodcount);%></p>
             <p  class = "name" style="color:red;">Failed EODs&nbsp;&nbsp;<%out.println(faileodcount);%></p>
             <p  class = "name" style="color:green;">Successful Replication&nbsp;&nbsp;<%out.println(successfulrepcount);%></p>
             <p  class = "name" style="color:red;">Failed Replication&nbsp;&nbsp;<%out.println(failrepcount);%></p>
             <p  class = "name" style="color:green;">Successful Upgrades&nbsp;&nbsp;<%out.println(successfulstorecount);%></p>
             <p  class = "name" style="color:red;">Failed Upgrades&nbsp;&nbsp;<%out.println(totalfailedstorecount);%></p>
             
            </div>
          </div>
        </div>
		<div class="col-1">
         <div class="user-item">
            <div class="user-item_info">
             <p class="name"><h3>Pilot 1 information</h3><br>
             <p class="name" style="color:red;">Total Failed stores &nbsp;&nbsp;<%out.println(pilot1failedstores);%></p><br>
             <p class="name" style="color:green;">Total Successful stores &nbsp;&nbsp;<%out.println(pilot1successfulstores);%></p><br>
             <p class="name">Maximum EOD time taken</p><p class="name" style="color:red;"><%out.println(pilot1maxeodstore);out.println(pilot1maxeodcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum EOD time taken</p><p class="name" style="color:green;"><%out.println(pilot1mineodstore);out.println(pilot1mineodcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Maximum Replication time taken</p><p class="name" style="color:red;"><%out.println(pilot1maxrepstore);out.println(pilot1maxrepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum Replication time taken</p><p class="name" style="color:green"><%out.println(pilot1minrepstore);out.println(pilot1minrepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Maximum Deployment time taken</p><p class="name" style="color:red;"><%out.println(pilot1maxdepstore);out.println(pilot1maxdepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum Deployment time taken</p><p class="name" style="color:green;"><%out.println(pilot1mindepstore);out.println(pilot1mindepcount+"&nbsp;Seconds</b>");%></p><br>
          </div>
        </div>
		</div>
		<div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
             <p class="name"><h3>Pilot 2 information</h3><br>
             <p class="name" style="color:red;">Total Failed stores &nbsp;&nbsp;<%out.println(pilot2failedstores);%></p><br>
             <p class="name" style="color:green;">Total Successful stores &nbsp;&nbsp;<%out.println(pilot2successfulstores);%></p><br>
             <p class="name">Maximum EOD time taken</p><p class="name" style="color:red;"><%out.println(pilot2maxeodstore);out.println(pilot2maxeodcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum EOD time taken</p><p class="name" style="color:green;"><%out.println(pilot2mineodstore);out.println(pilot2mineodcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Maximum Replication time taken</p><p class="name" style="color:red;"><%out.println(pilot2maxrepstore);out.println(pilot2maxrepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum Replication time taken</p><p class="name" style="color:green"><%out.println(pilot2minrepstore);out.println(pilot2minrepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Maximum Deployment time taken</p><p class="name" style="color:red;"><%out.println(pilot2maxdepstore);out.println(pilot2maxdepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum Deployment time taken</p><p class="name" style="color:green;"><%out.println(pilot2mindepstore);out.println(pilot2mindepcount+"&nbsp;Seconds</b>");%></p><br>
            </div>
          </div>
        </div>     		
      </div>
      <div class="row">
      <div class="col-1">
      <div class="user-item">
             <div class="user-item_info">
             <p class="name"><h3>Pilot 3 information</h3><br>
             <p class="name" style="color:red;">Total Failed stores &nbsp;&nbsp;<%out.println(pilot3failedstores);%></p><br>
             <p class="name" style="color:green;">Total Successful stores &nbsp;&nbsp;<%out.println(pilot3successfulstores);%></p><br>
             <p class="name">Maximum EOD time taken</p><p class="name" style="color:red;"><%out.println(pilot3maxeodstore);out.println(pilot3maxeodcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum EOD time taken</p><p class="name" style="color:green;"><%out.println(pilot3mineodstore);out.println(pilot3mineodcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Maximum Replication time taken</p><p class="name" style="color:red;"><%out.println(pilot3maxrepstore);out.println(pilot3maxrepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum Replication time taken</p><p class="name" style="color:green"><%out.println(pilot3minrepstore);out.println(pilot3minrepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Maximum Deployment time taken</p><p class="name" style="color:red;"><%out.println(pilot3maxdepstore);out.println(pilot3maxdepcount+"&nbsp;Seconds</b>");%></p><br>
             <p class="name">Minimum Deployment time taken</p><p class="name" style="color:green;"><%out.println(pilot3mindepstore);out.println(pilot2mindepcount+"&nbsp;Seconds</b>");%></p><br>
            </div>
          </div>
       </div>
             <div class="col-1">
             <div id="piechart_3d">
	    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		</div>
            </div>
          </div>
       </div>
       </div>
      <!-- end inner content -->
    </div>  
  <!-- end content -->
</body>
</html>