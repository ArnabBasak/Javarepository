<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>D2.4.49 Non Rollout Analytics</title>
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
   		['EOD Failures',223 ],//#cc0000
   		['Replication Failures',68], //#ff0066
   		['Upgrade Failures', 250], //#993366
        ['Successful EOD',562 ], //#008000
        ['Successful Replication', 717],// #66ff33 
        ['Successful Upgrades',535],//00cc66
		           
        ]);

        var options = {
          is3D: true,
          backgroundColor: 'transparent',
          width: 550,
          height: 300, 
          title: 'Store Upgrade : Success-Failure distribution',
          colors: ['#cc0000','#ff0066','#993366','#008000','#66ff33','#00cc66']
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
PreparedStatement failedstores = connection.prepareStatement("select count(*) from deployment where dep_duration = 0 && version like 'D2.4.49'");
ResultSet failedstoresresultset = failedstores.executeQuery();
String failedstorescount = "";
while(failedstoresresultset.next())
{
	failedstorescount = failedstoresresultset.getString(1);
}
PreparedStatement rolloutdate = connection.prepareStatement("select rolloutdate from releasedates where rollout like 'D2.4.49'");
ResultSet rolloutdateresultset = rolloutdate.executeQuery();
String rolloutdatecount = "";
while(rolloutdateresultset.next())
{
	rolloutdatecount = rolloutdateresultset.getString(1);
}
PreparedStatement successfulstore = connection.prepareStatement("select count(*) from deployment where Dep_Duration != 0 && version like 'D2.4.49'");
ResultSet successfulresultset = successfulstore.executeQuery();
String successfulstorecount = "";
while(successfulresultset.next())
{
	successfulstorecount = successfulresultset.getString(1);
}
PreparedStatement totalstores = connection.prepareStatement("select count(*) from deployment where version like 'D2.4.49'");
ResultSet totalstoresresultset = totalstores.executeQuery();
String totalstorescount = "";
while(totalstoresresultset.next())
{
	totalstorescount = totalstoresresultset.getString(1);
}
PreparedStatement eodfail = connection.prepareStatement("select count(*) from deployment where eod_duration = 0 && version like 'D2.4.49'");
ResultSet eodfailresultset = eodfail.executeQuery();
String eodfailcount = "";
while(eodfailresultset.next())
{
	eodfailcount = eodfailresultset.getString(1);
}
PreparedStatement replicationfailed = connection.prepareStatement("select count(*) from deployment where replication_duration = 0 && version like 'D2.4.49'");
ResultSet replicationfailedresultset = replicationfailed.executeQuery();
String replicationfailcount = "";
while(replicationfailedresultset.next())
{
	replicationfailcount = replicationfailedresultset.getString(1);
}
PreparedStatement depfailed = connection.prepareStatement("select count(*) from deployment where eod_duration != 0 && replication_duration != 0 && dep_duration = 0 && version like 'D2.4.49'");
ResultSet depfailedresultset = depfailed.executeQuery();
String depfailedcount = "";
while(depfailedresultset.next())
{
	depfailedcount = depfailedresultset.getString(1);
}
PreparedStatement maxeod = connection.prepareStatement("select name,eod_duration from deployment where eod_duration IN (select max(eod_duration) from deployment where version like 'D2.4.49');");
ResultSet maxeodresultset = maxeod.executeQuery();
String maxeodstore = "";
String eodmaxtime = "";
while(maxeodresultset.next())
{
	maxeodstore = maxeodresultset.getString("name");
	eodmaxtime = maxeodresultset.getString("eod_duration");
}
PreparedStatement mineod = connection.prepareStatement("select name,eod_duration from deployment where eod_duration IN (select min(eod_duration) from deployment where version like 'D2.4.49' && eod_duration!=0) limit 1");
ResultSet mineodresulset = mineod.executeQuery();
String mineodstore = "";
String mineodtime = "";
while(mineodresulset.next())
{
	mineodstore = mineodresulset.getString("name");
	mineodtime = mineodresulset.getString("eod_duration");
}
PreparedStatement maxreplication = connection.prepareStatement("select name,replication_duration from deployment where replication_duration IN (select max(replication_duration) from deployment where version like 'D2.4.49');");
ResultSet maxreptimeresultset = maxreplication.executeQuery();
String maxrepstore = "";
String maxreptime = "";
while(maxreptimeresultset.next())
{
	maxrepstore = maxreptimeresultset.getString("name");
	maxreptime = maxreptimeresultset.getString("replication_duration");
}
PreparedStatement minreplication = connection.prepareStatement("select name,replication_duration from deployment where replication_duration IN (select min(replication_duration) from deployment where version like 'D2.4.49' && replication_duration!=0) limit 1");
ResultSet minrepResultSet = minreplication.executeQuery();
String minrepstore = "";
String minreptime = "";
while(minrepResultSet.next())
{
	minrepstore = minrepResultSet.getString("name");
	minreptime = minrepResultSet.getString("replication_duration");
}
PreparedStatement maxdepduration = connection.prepareStatement("select name,dep_duration from deployment where dep_duration IN (select max(dep_duration) from deployment where version like 'D2.4.49')");
ResultSet maxdepdurationresultset = maxdepduration.executeQuery();
String maxdepstore = "";
String maxdeptime = "";
while(maxdepdurationresultset.next())
{
	maxdepstore = maxdepdurationresultset.getString("name");
	maxdeptime = maxdepdurationresultset.getString("dep_duration");
}
PreparedStatement mindepduration = connection.prepareStatement("select name,dep_duration from deployment where dep_duration IN (select min(dep_duration) from deployment where version like 'D2.4.49' && dep_duration !=0) limit 1");
ResultSet mindepdurationresultset = mindepduration.executeQuery();
String mindepstore = "";
String mindeptime = "";
while(mindepdurationresultset.next())
{
	mindepstore = mindepdurationresultset.getString("name");
	mindeptime = mindepdurationresultset.getString("dep_duration");
}
PreparedStatement eodsuccess = connection.prepareStatement("select count(*) from deployment where eod_duration !=0 && version = 'D2.4.49'");
ResultSet eodsuccesscountresultset = eodsuccess.executeQuery();
String eodsuccesscount = "";
while(eodsuccesscountresultset.next())
{
	eodsuccesscount = eodsuccesscountresultset.getString(1);
}
PreparedStatement depsuccess = connection.prepareStatement("select count(*) from deployment where dep_duration !=0 && version = 'D2.4.49' && eod_duration !=0 && replication_duration !=0;");
ResultSet depsuccessresultset = depsuccess.executeQuery();
String depsuccesscount = "";
while(depsuccessresultset.next())
{
	depsuccesscount = depsuccessresultset.getString(1);
}
PreparedStatement repsuccess = connection.prepareStatement("select count(*) from deployment where replication_duration !=0 && version = 'D2.4.49'");
ResultSet repsuccessresultset = repsuccess.executeQuery();
String repsuccesscount = "";
while(repsuccessresultset.next())
{
	repsuccesscount = repsuccessresultset.getString(1);
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
          <a href="dfouronenonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.41</a>
		  <a href="dfourtwononsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.42</a>
		  <a href="dfourthreenonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.43</a>
		  <a href="dfourfournonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.44</a>
          <a href="dfourfivenonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.45</a>
          <a href="dfoursixnonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.46</a>
          <a href="dfoursevennonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.47</a>
          <a href="dfoureightnonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>D2.4.48</a>
          <a href="dfourninenonsdtanalytics.jsp" class="active"><i class="fa fa-pie-chart"></i>D2.4.49</a>
		  <!-- <a href="rolloutchecks.jsp"><i class="fa fa-user"></i>Back</a> -->
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
              <p class="name"><h3>D2.4.49 Rollout information</h3><br><p class="name" style="color:#990033;">Rollout Date&nbsp;&nbsp;<%out.println(rolloutdatecount);%></p>
              <br><p class="name" style="color:#990033;">Total stores&nbsp;&nbsp;<%out.println(totalstorescount);%></p>
              <br><p class ="name" style="color:red;">Failed Store upgrades&nbsp;&nbsp;<%out.println(failedstorescount);%></p>
              <br><p  class = "name" style="color:green;">Successful store upgrades&nbsp;&nbsp;<%out.println(successfulstorecount);%></p>
            </div>
          </div>
        </div>
	  	  	  <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name"><h3>EOD Statistics</h3><br>
              <p class="name" style="color:red;">EOD Failed&nbsp;&nbsp;<%out.println(eodfailcount);%></p><br>
              <p class="name" style="color:green;">EOD Successful&nbsp;&nbsp;<%out.println(eodsuccesscount);%></p><br>
              <p class="name">Maximum EOD time taken</p><p class="name" style="color:red;"><%out.println(maxeodstore);out.println(eodmaxtime+"&nbsp;Seconds</b>");%></p><br>
              <p class ="name">Minimum EOD time taken</p><p class="name" style="color:green;"><%out.println(mineodstore); out.println(mineodtime+"&nbsp;Seconds</b>");%></p>
            </div>
          </div>
        </div>
        	 <div class="col-1" title="all the time duration are  given are in seconds">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name" ><h3>Deployment Statistics</h3><br>
               <p  class = "name" style="color:red;">Deployment Failed&nbsp;&nbsp;<%out.println(depfailedcount);%></p><br>
               <p  class = "name" style="color:green;">Deployment Successful&nbsp;&nbsp;<%out.println(depsuccesscount);%></p><br>
              <p  class = "name">Maximum Deployment time</p><p class="name" style="color:red;"><%out.println(maxdepstore); out.println(maxdeptime+"&nbsp;Seconds</b>");%></p><br>
               <p  class = "name">Minimum Deployment time</p><p class="name" style="color:green"><%out.println(mindepstore); out.println(mindeptime+"&nbsp;Seconds</b>");%></p>
            </div>
          </div>
        </div>
        </div>
        <div class="row">
              	 <div class="col-1" title="all the time duration are  given are in seconds">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name" ><h3>Replication Statistics</h3><br>
              <p class ="name" style="color:red;">Replication Failed&nbsp;&nbsp;<%out.println(replicationfailcount);%></p><br>
              <p class ="name" style="color:green;">Replication Successful&nbsp;&nbsp;<%out.println(repsuccesscount);%></p><br>
              <p  class = "name">Maximum Replication time</p><p class="name" style ="color:red;"><%out.println(maxrepstore); out.println(maxreptime+"&nbsp;Seconds</b>");%></p><br>
              <p  class = "name">Minimum Replication time</p><p class="name" style="color:green;"><%out.println(minrepstore); out.println(minreptime+"&nbsp;Seconds</b>");%></p>
            </div>
          </div>
        </div>
        <div class="col-1" title="all the time duration are  given are in seconds">
        <div id="piechart_3d">
	    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		</div>
        </div>
      </div>
              <a href="#"><div class="row">
              <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
            <p class="name">Detail discription of the failed stores</p>
            </div>
          </div>
        </div>
      </div></a>
      <!-- end inner content -->
    </div>  
  <!-- end content -->
  </div>
</body>
</html>