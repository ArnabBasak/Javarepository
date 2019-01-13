<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basic Analytics</title>
<link rel="stylesheet" href="css/analyticshomepage.css">
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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Store', 'Success'],
		  ['Barnstaple', 12.5],
          ['Chippenham', 12.5],
		  ['Dover', 12.5],
		  ['Swindon', 12.5],
		  ['Bradford Girlington', 12.5],
		  ['Grimsby', 12.5],
		  ['Bicester', 12.5],
		  ['Redruth', 12.5],
		  
          
        ]);

        var options = {
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
 <!--<div id="piechart_3d" style="width: 900px; height: 500px; align: center;"></div>-->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</div>
</div>
</body>
</html>