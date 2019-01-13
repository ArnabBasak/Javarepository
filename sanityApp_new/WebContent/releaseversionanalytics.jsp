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
PreparedStatement d41 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.41%'");
ResultSet d41resultset = d41.executeQuery();
String D41count = "";
while(d41resultset.next())
{
	D41count = d41resultset.getString(1);
}
PreparedStatement d42 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.42%'");
ResultSet d42resultset = d42.executeQuery();
String D42count = "";
while(d42resultset.next())
{
	D42count = d42resultset.getString(1);
}
PreparedStatement d43 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.43%'");
ResultSet d43resultset = d43.executeQuery();
String D43count = "";
while(d43resultset.next())
{
	D43count = d43resultset.getString(1);
}
PreparedStatement d44 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.44%'");
ResultSet d44resultset = d44.executeQuery();
String D44count = "";
while(d44resultset.next())
{
	D44count = d44resultset.getString(1);
}
PreparedStatement d45 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.45%'");
ResultSet d45resultset = d45.executeQuery();
String D45count = "";
while(d45resultset.next())
{
	D45count = d45resultset.getString(1);
}
PreparedStatement d46 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.46%'");
ResultSet d46resultset = d46.executeQuery();
String D46count = "";
while(d46resultset.next())
{
	D46count = d46resultset.getString(1);
}
PreparedStatement d47 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.47%'");
ResultSet d47resultset = d47.executeQuery();
String D47count = "";
while(d47resultset.next())
{
	D47count = d47resultset.getString(1);
}
PreparedStatement d48 = con.prepareStatement("select count(*) From devserver where releaseversion like 'D2.4.48%'");
ResultSet d48resultset = d48.executeQuery();
String D48count = "";
while(d48resultset.next())
{
	D48count = d48resultset.getString(1);
} 
%>
<div class="wrapper">
  <div class="wrapper_container">
  <!-- start content -->
    <div class="site-wrapper active" id="target">
      <div class="site-wrapper_left-col">
       <!--  <a href="#" class="logo">Specsavers</a> -->
        <a href="dashboard.jsp" class="logo" style="font-size: 20px;">BACK</a>
        <div class="left-nav">
          <a href="analytics.jsp"><i class="fa fa-pie-chart"></i>Analytics</a>
		  <a href="dfouronenonsdtanalytics.jsp"><i class="fa fa-pie-chart"></i>Rollout Analytics</a>
		  <a href="rhelanalytics.jsp"><i class="fa fa-pie-chart"></i>RHEL Analytics</a>
		  <a href="bridgecountanalytics.jsp"><i class="fa fa-pie-chart"></i>Bridge Analytics</a>
          <a href="releaseversionanalytics.jsp" class="active"><i class="fa fa-pie-chart"></i>Release Analytics</a>
		  <!-- <a href="analytics.jsp"><i class="fa fa-user"></i>back</a> -->
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
              <p class="name">Total Dev environments in D2.4.41</p><p><%out.println(D41count);%></p>
            </div>
          </div>
        </div>
		<a><div class="col-1">
         <div class="user-item">
            <div class="user-item_info">
            <p class="name">Total Dev environments in D2.4.42</p><p><%out.println(D42count);%></p>
          </div>
        </div>
		</div></a>
		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total Dev environments in D2.4.43</p><p><%out.println(D43count);%></p>
            </div>
          </div>
        </div></a>
        		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total Dev environments in D2.4.44</p><p><%out.println(D44count);%></p>
            </div>
          </div>
        </div></a>
        		<a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total Dev environments in D2.4.45</p><p><%out.println(D45count);%></p>
            </div>
          </div>
        </div></a>
        <a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total Dev environments in D2.4.46</p><p><%out.println(D46count);%></p>
            </div>
          </div>
        </div></a>
        <a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total Dev environments in D2.4.47</p><p><%out.println(D47count);%></p>
            </div>
          </div>
        </div></a>
        <a><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
               <p class="name">Total Dev environments in D2.4.46</p><p><%out.println(D46count);%></p>
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
            ['devserver', 'release version'],
  		  	['D2.4.41 ', 1],
            ['D2.4.42', 0],
            ['D2.4.43', 1],
            ['D2.4.44', 1],
            ['D2.4.45', 12],
            ['D2.4.46', 1],
            ['D2.4.47', 1],
            ['D2.4.48', 2],
            ['D2.4.49', 0] 
		           
        ]);
        var options = {
          is3D: true,
          backgroundColor: 'transparent',
          width: 600,
          height: 200,
          title: 'Release version of all dev servers',
          colors: ['#00ccff','#336699','#ff0000','#ffe680','#8585ad','#ccccff','#ac3939','#ffb3ff','#1affd1']
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
									style="overflow-y: scroll; height: 200px; width:100%;  display: block"; >
									<thead>Dev environments list</thead>
									<tr>
									</tr>
									<!-- <b> successful stores list<b><br> -->
											<tr bgcolor="#A52A2A">
												<th style="layout: fixed; color: white; text-align: center"><b>Store
														number&nbsp;&nbsp;&nbsp;</b></th>
												<th style="layout: fixed; color: white; text-align: center"><b>Store
														IP</b></th>
												<th style="layout: fixed; color: white; text-align: center; padding-right:250px""><b>Release
														version</b></th>
											</tr> <%
 	PreparedStatement successfulstoreslist = con.prepareStatement("select Storenumber,storeip,releaseversion from devserver");
 	ResultSet successfulstorelistresultset = successfulstoreslist.executeQuery();
 	while (successfulstorelistresultset.next()) {
 %>
											<tr bgcolor="#DEB887">
												<td style="padding-left:10px;width="100%;"><%=successfulstorelistresultset.getString("Storenumber")%></td>
												<td  style="padding-left: 100px;" width="100%;"><%=successfulstorelistresultset.getString("storeip")%></td>
												<td  style="padding-right: 250px;" width="100%;"><%=successfulstorelistresultset.getString("releaseversion")%></td>
												
											</tr> <%
 }
con.close();
%>
								</table>

							</td>
						</tr>
					</table>
				</div>
    
 <%-- <div id="piechart_3d">
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</div>
<table align="left" cellpadding="5" cellspacing="5" border="5" style="overflow-y:scroll;height:200px;display:block";>
<tr>
</tr>
<b> Dev environments list<b><br>
<tr bgcolor="#A52A2A">
<td style="layout:fixed; color:white;"><b>Store Number&nbsp;&nbsp;&nbsp;</b></td>
<td style="layout:fixed; color:white;"><b>Store Ip</b></td>
<td style="layout:fixed; color:white;"><b>Release version</b></td>
</tr>
<%
PreparedStatement successfulstoreslist = con.prepareStatement("select Storenumber,storeip,releaseversion from devserver");
ResultSet successfulstorelistresultset = successfulstoreslist.executeQuery();
while(successfulstorelistresultset.next()){
%>
<tr bgcolor="#DEB887">
<td><%=successfulstorelistresultset.getString("storenumber")%></td>
<td><%=successfulstorelistresultset.getString("storeip")%></td>
<td><%=successfulstorelistresultset.getString("releaseversion")%></td>
</tr>
<%
 }
con.close();
%>
</table> --%>
      </div>
      <!-- end inner content -->
    </div>  
  <!-- end content -->
  </div>
</body>
</html>