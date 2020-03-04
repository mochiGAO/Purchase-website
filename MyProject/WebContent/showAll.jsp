<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <head>
    <base href="<%=basePath%>">
    <title>All users records</title>
  </head>
  
<title>Team16 :: Cloud</title>


<style>
.center {
	margin: auto;
	width: 50%;
	padding: 10px;
}

.logincard-footer {
	background-color: #f9f9f9;
}
</style>

<body id="myPage">


	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="Index.jsp"
				class="w3-bar-item w3-button w3-teal"> <i
				class="fa fa-home w3-margin-right"></i>Home
			</a> <a href="#contact"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Contact
				Us</a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Hi, <%=session.getAttribute("Susrname") %>
			</a>
		</div>




		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
			<!-- 			<a href="#team" class="w3-bar-item w3-button">Team</a> <a
				href="#applications" class="w3-bar-item w3-button">Applications</a> -->
			<!--     <a href="#pricing" class="w3-bar-item w3-button">Price</a> -->
			<a href="#contact" class="w3-bar-item w3-button">Contact</a>
		</div>
	</div>

	<!-- Image Header -->
	<div class="w3-display-container w3-animate-opacity">
		<img src="pic/HomeTitle.jpg" alt="sheffield"
			style="width: 100%; min-height: 350px; max-height: 600px;">
	</div>



	<div class="w3-row-padding w3-center w3-padding-64" id="logincard">
		<h2>score</h2>
		<div class="w3-container w3-center w3-margin-top center"></div>
	</div>






  <div class="w3-container w3-margin-top center">
  <div class = "w3-center">
  <h1>${reataurant}</h1>
  <table  width="600" border="1" cellpadding="0" >
  		<tr>
  			<th>userID</th>
	  		<th>restaurantID</th>
	  		<th>STARS</th>
	  		<th>comments</th> 		
  		</tr>
     <c:forEach var="U" items="${userAll}" > 
       <tr>
	       <td><input type="text" value="${U.getuserID()}" name="userID" disabled="disabled"></td>
	       <td><input type="text" value="${U.getrestaurantID()}" name="restaurantID" disabled="disabled"></td>
	       <td><input type="text" value="${U.getuserSTARS()}" name="userSTARS" disabled="disabled"></td>
	       <td><input type="text" value="${U.getcomments()}" name="comments" disabled="disabled"></td>
	   </tr>
    </c:forEach>  
    </table>
    </div>
    	<div class="w3-container w3-margin-top">
		<button align="center" class="w3-button w3-black" id="back"
			onclick="javascrtpt:window.location.href='/MyProject/restindex.jsp'">back</button>
	</div>
    </div>




	<div class="w3-row-padding w3-center w3-padding-64"></div>


	<!-- Contact Container -->
	<div class="w3-container w3-padding-64 w3-theme-l5" id="contact">
		<div class="w3-row">
			<div class="w3-col m5">
				<div class="w3-padding-16">
					<span class="w3-xlarge w3-border-teal w3-bottombar">Contact
						Us</span>
				</div>
				<h3>Address</h3>
				<p>Swing by for a cup of coffee, or whatever.</p>
				<p>
					<i class="fa fa-map-marker w3-text-teal w3-xlarge"></i>  Sheffield,
					UK
				</p>
				<p>
					<i class="fa fa-phone w3-text-teal w3-xlarge"></i>  +00 1515151515
				</p>
				<p>
					<i class="fa fa-envelope-o w3-text-teal w3-xlarge"></i>  mgao13@sheffield.ac.uk
				</p>
			</div>
		</div>
	</div>

	<!-- Image of FOOT -->
	<img src="pic/SheffieldFoot.jpg" class="w3-image w3-greyscale-min"
		style="width: 100%;">

	<div id="modal01" class="w3-modal w3-black"
		onclick="this.style.display='none'">
		<span class="w3-button w3-large w3-black w3-display-topright"
			title="Close Modal Image"><i class="fa fa-remove"></i></span>
		<div
			class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
			<img id="img01" class="w3-image">
			<p id="caption" class="w3-opacity w3-large"></p>
		</div>
	</div>

	<!-- Third Parallax Image with Portfolio Text -->
	<div class="bgimg-3 w3-display-container w3-opacity-min">
		<div class="w3-display-middle">
			<span class="w3-xxlarge w3-text-white w3-wide">THE UNIVERSITY
				OF SHEFFIELD</span>
		</div>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-padding-32 w3-theme-d1 w3-center">
		<h4>Our University</h4>

		<p>
			<a href="https://www.sheffield.ac.uk/" target="_blank">know our
				university</a>
		</p>

		<div style="position: relative; bottom: 100px; z-index: 1;"
			class="w3-tooltip w3-right">
			<span class="w3-text w3-padding w3-teal w3-hide-small">Go To
				Top</span> <a class="w3-button w3-theme" href="#myPage"><span
				class="w3-xlarge"> <i class="fa fa-chevron-circle-up"></i></span></a>
		</div>
	</footer>

</body>
</html>