<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basic Checks</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="css/styledashboard.css" type="text/css"></link>
<link href="css/popform.css" rel="stylesheet" type="text/css"></link>
<script src="js/popup.js" type="text/javascript"></script>
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
          <a href="dashboard.jsp"><i class="fa fa-home"></i>Dashboard</a>
		  <a href="pilotchecks.jsp"><i class="fa fa-cog"></i>Pilot Checks</a>
		  <a href="rolloutchecks.jsp"><i class="fa fa-cog"></i>Rollout Checks</a>
		  <a href="basicchecks.jsp" class="active"><i class="fa fa-cog"></i>Basic Checks</a>
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
              <p class="name">RHEL version</p>
              <div class="controls">
			  <a href="#" title = "Check the D2.4.41 version for all UK stores"><i class="fa fa-paper-plane" onclick="div_show()"></i></a>
              </div>
            </div>
          </div>
        </div>
		<div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Release version</p>
              <div class="controls">
			  <a href="#" title = "Check the D2.4.41 version for all UK stores"><i class="fa fa-paper-plane" onclick="div_show()"></i></a>
              </div>
            </div>
          </div>
        </div>
				<div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">RPM versions</p>
              <div class="controls">
			  <a href="#" title = "Check the D2.4.41 version for all UK stores"><i class="fa fa-paper-plane" onclick="div_show()"></i></a>
              </div>
            </div>
          </div>
        </div>
				<div class="col-1">
          <div class="user-item">
            <div class="user-item_info">
              <p class="name">Bridge Count</p>
              <div class="controls">
			  <a href="#" title = "Check the D2.4.41 version for all UK stores"><i class="fa fa-paper-plane" onclick="div_show()"></i></a>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!-- end inner content -->
	  			<div id="abc">
<!-- Popup Div Starts Here -->
<div id="popupContact">
<!-- Contact Us Form -->
<form action="#" id="form" method="post" name="form">
<img id="close" src="images/cancel.png" alt="cancel image" onclick ="div_hide()">
<h2>Store information</h2>
<input type="radio" name="type" value="SDT stores" id="checksdt" onclick="ShowHideDiv()">live store  
<input type="radio" name="type" value="Non SDT stores" id="checknonsdt" onclick="ShowHideDiv()">dev store
<br>
<div id="dvtextbox" style="display: none">
&nbsp;&nbsp;&nbsp;&nbsp;<input id="name" name="storename" placeholder="Store Number" type="text"><br><br>
</div><br>
<input type="submit" value="submit" id="submit" onclick="checkdevstores()">
</form>
</div>
<!-- Popup Div Ends Here -->
</div>
    </div>  
  <!-- end content -->
  </div>
</div>
</body>
</html>