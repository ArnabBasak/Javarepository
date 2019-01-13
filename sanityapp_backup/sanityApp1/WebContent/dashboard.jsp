<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"></link>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'></link>
<link rel="stylesheet" href="css/styledashboard.css" type="text/css"></link>
</head>
<body>
<%
 if(session.getAttribute("username") == null)
 {
	 response.sendRedirect("index.jsp");
 }
%>
 <div class="wrapper">
  <div class="wrapper_container">
  <!-- start content -->
    <div class="site-wrapper active" id="target">
      <div class="site-wrapper_left-col">
        <a href="#" class="logo">Specsavers</a>
        <div class="left-nav">
          <a href="dashboard.jsp" class="active"><i class="fa fa-home"></i>Dashboard</a>
		  <a href="pilotchecks.jsp"><i class="fa fa-cog"></i>Pilot Checks</a>
		  <a href="rolloutchecks.jsp"><i class="fa fa-cog"></i>Rollout Checks</a>
		  <a href="basicchecks.jsp"><i class="fa fa-cog"></i>Basic Checks</a>
          <a href="analytics.jsp"><i class="fa fa-pie-chart"></i>Analytics</a>
		  <a href="index.jsp"><i class="fa fa-user"></i>Logout</a>
        </div>
      </div>
	        <div class="site-wrapper_top-bar">
	  <img src="images/Specsavers.png"/>
      </div>
      <!-- inner content -->
      <div class="row">
	  	  	  <div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name"> The current live version is D2.4.45</p>
            </div>
          </div>
        </div>
		<div class = "blink"><a><div class="col-1">
         <div class="user-item">
            <div class="user-item_info">
            <p class="name" title="Pilot in progress">D2.4.46 is getting rolled out</p>
          </div>
        </div>
		</div></a></div>
		<div class="row">
		<a href="Pilot Checks.html"><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name">Pilot 1</p><p class="name">Completed</p>
            </div>
          </div>
        </div></a>
				<a href="Pilot Checks.html"><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name">Pilot 2 is on</p><p class="name">Completed</p>
            </div>
          </div>
        </div></a>
		<a href="Pilot Checks.html"><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name">Pilot 3 is on</p><p class="name">Completed</p>
            </div>
          </div>
        </div></a>
		<a href="Rollout Checks.html"><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name">Rollout NON SDT</p><p class="name">In Progress</p>
            </div>
          </div>
        </div></a>
		<a href="Rollout Checks.html"><div class="col-1">
        <div class="user-item">
            <div class="user-item_info">
              <p class="name">Rollout SDT</p><p class="name">Starting from 28/2/2018</p>
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