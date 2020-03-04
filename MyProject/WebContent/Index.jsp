<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Service.UserService"%>
<%@page import="Servlet.PaymentHistory"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>

<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>



<!DOCTYPE html>
<html>
<title>Team16 :: Cloud</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.center {
	margin: auto;
	width: 50%;
	padding: 10px;
}
}
</style>
<body id="myPage">

	<!-- Sidebar on click -->
	<!-- 	<nav
		class="w3-sidebar w3-bar-block w3-white w3-card w3-animate-left w3-xxlarge"
		style="display: none; z-index: 2" id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
			<i class="fa fa-remove"></i>
			<div></div>
		</a>
	</nav> -->

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<!-- 			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> -->
			<a href="#" class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a> <a href="#applications"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Applications</a>
			<a href="#team"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Team</a>
			<!--   <a href="#pricing" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Register</a> -->
			<a href="#contact"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Contact
				Us</a>



			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					<%if (session.getAttribute("Susrname")==null){ %>
					Hi Guest
					<%} else {%>
					Hi,<%=session.getAttribute("Susrname") %>
					<% } %>
					<i class="fa fa-caret-down"></i>
				</button>

				<div class="w3-dropdown-content w3-card-4 w3-bar-block">

					<%if (session.getAttribute("Susrname")==null){ %>
					<a href="Login.jsp" class="w3-bar-item w3-button">Login</a> <a
						href="Register.jsp" class="w3-bar-item w3-button">Register</a>
					<%} else {%>
					<a href="myaccount" class="w3-bar-item w3-button">My
						Account</a> <a href="/MyProject/logout" class="w3-bar-item w3-button">Logout</a>

					<%}%>
				</div>
			</div>
		</div>
		<!-- <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Search"><i class="fa fa-search"></i></a> -->
	</div>

	<!-- Navbar on small screens -->
	<div id="navDemo"
		class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
		<a href="#team" class="w3-bar-item w3-button">Team</a> <a
			href="#applications" class="w3-bar-item w3-button">Applications</a>
		<!--     <a href="#pricing" class="w3-bar-item w3-button">Price</a> -->
		<a href="#contact" class="w3-bar-item w3-button">Contact</a>
		<!-- <a
				href="#" class="w3-bar-item w3-button">Search</a> -->
	</div>


	<!-- Image Header -->
	<div class="w3-display-container w3-animate-opacity">
		<img src="pic/HomeTitle.jpg" alt="sheffield"
			style="width: 100%; min-height: 350px; max-height: 600px;">


		<div class="w3-row-padding w3-center w3-padding-64"></div>





		<!-- app Row -->
		<div class="w3-row-padding w3-center w3-padding-64 w3-light-grey"
			id="applications">
			<h2>Applications</h2>
			<p>Choose a Applications that fits your needs.</p>
			
			
			
			

			
			
			

			
			
			<div class="w3-third w3-margin-bottom">
				<div class="w3-card-4" style="width: 70%">
					<a><img src="pic/s.jpg" alt="Alps" style="width: 100%" ></a>

					<div class="w3-container w3-center">
						<!-- <a href="BestRest.jsp"> -->
						<p>Best Restaurant</p>
					</div>


					<div class="w3-container w3-center">
						<button
							onclick="document.getElementById('id01').style.display='block'"
							class="w3-button w3-black">Description</button>
							<div id="id01" class="w3-modal">
							<div class="w3-modal-content">
								<header class="w3-container w3-teal">
									<span
										onclick="document.getElementById('id01').style.display='none'"
										class="w3-button w3-display-topright">&times;</span>
									<h2>Best Restaurant</h2>
								</header>
								<div class="w3-container">
									<p>details</p>
								</div>
								<footer class="w3-container w3-teal">
								</footer>
							</div>
						</div>

						 <% if (session.getAttribute("Susrname") != null) {%>
						 
						 <form action="app" method="post">

							<div style="display: none;">
								<select name="appname">
									<option>restindex</option>
								</select>
							</div>

							<button type="submit" class="w3-button w3-black">Go</button>
						</form>
						 
						
						<%} %>


					</div>
				</div>
			</div>



			
			
			
						<div class="w3-third w3-margin-bottom">
				<div class="w3-card-4" style="width: 70%">
					<a>
						
						<img src="pic/s.jpg" alt="Alps" style="width: 100%">
						</a>

					<div class="w3-container w3-center">
						<p>Finding</p>

					</div>

					<div class="w3-container w3-center">
						<button
							onclick="document.getElementById('id01').style.display='block'"
							class="w3-button w3-black">Description</button>
						<div id="id01" class="w3-modal">
							<div class="w3-modal-content">
								<header class="w3-container w3-teal">
									<span
										onclick="document.getElementById('id01').style.display='none'"
										class="w3-button w3-display-topright">&times;</span>
									<h2>Finding</h2>
								</header>
								<div class="w3-container">
									<p>details</p>
								</div>
								<footer class="w3-container w3-teal">
									<p>5 peanuts per use</p>
								</footer>
							</div>
						</div>
						
						
						
						 <% if (session.getAttribute("Susrname") != null) {%>
						 <form action="app" method="post">

							<div style="display: none;">
								<select name="appname">
									<option>FindLTNoJS</option>
								</select>
							</div>

							<button type="submit" class="w3-button w3-black">Go</button>
						</form>
						 
						
						<%} %>
						
						

					</div>
				</div>
			</div>










			<%
		UserService us = new UserService();
		List<PaymentHistory> applist =	us.displayApp();
		System.out.println(applist);
/* 		for(PaymentHistory p : applist){
			System.out.println(p);
		} */
		for(PaymentHistory p : applist){
			%>

			<div class="w3-third w3-margin-bottom">
				<div class="w3-card-4" style="width: 70%">
					<a <%if (session.getAttribute("Susrname") == null) {%>
						href="Login.jsp?err=100" <%} else {%> href="/<%=p.getApp() %>"
						<%}%>><img src="pic/s.jpg" alt="Alps" style="width: 100%"></a>

					<div class="w3-container w3-center">
						<p><%=p.getApp() %></p>
					</div>

					<div class="w3-container w3-center">
						<button
							onclick="document.getElementById('id01').style.display='block'"
							class="w3-button w3-black">Description</button>
						<div id="id01" class="w3-modal">
							<div class="w3-modal-content">
								<header class="w3-container w3-teal">
									<span
										onclick="document.getElementById('id01').style.display='none'"
										class="w3-button w3-display-topright">&times;</span>
									<h2><%=p.getApp() %>
									</h2>
								</header>
								<div class="w3-container">
									<p>details</p>
								</div>
								<footer class="w3-container w3-teal">
									<p>5 peanuts per use</p>
								</footer>
							</div>
						</div>
						
						
												
						 <% if (session.getAttribute("Susrname") != null) {%>
						 <form action="app" method="post">

							<div style="display: none;">
								<select name="appname">
									<option><%=p.getApp() %></option>
								</select>
							</div>

							<button type="submit" class="w3-button w3-black">Go</button>
						</form>
						 
						
						<%} %>
						
						
					</div>
				</div>
			</div>


			<%}%>





		</div>



		<div class="w3-row-padding w3-center w3-padding-64"></div>


		<!-- upload Row -->

		<%if (session.getAttribute("Susrname") != null) {%>

		<div class="w3-row-padding w3-padding-64 w3-center w3-light-grey">
			<h1>app upload</h1>
			<div class="w3-container w3-center">
				<h3>Important:You can upload your applacation to our platform,if your application contian database,please sent sql script to our by email. We will deploy it after checking.</h3>
				<form method="post" action="/MyProject/UploadServlet"
					enctype="multipart/form-data">

					select the file you want to upload: <input type="file"
						name="uploadFile" value="select file" /> <br /> <br />

					<button class="w3-button  w3-green w3-section w3-padding w3-center"
						type="submit" style="width: 15%">upload</button>
					<!-- 					<input class="w3-button w3-black" type="submit" value="upload" /> -->

				</form>
			</div>
		</div>
		<%}%>

		<!-- Container -->
		<!-- <div class="w3-container" style="position: relative">
			<a onclick="w3_open()" class="w3-button w3-xlarge w3-circle w3-teal"
				style="position: absolute; top: -28px; right: 24px">+</a>
		</div> -->

		<div class="w3-row-padding w3-center w3-padding-64"></div>




		<!-- Team Container -->
		<div class="w3-container w3-padding-64 w3-center w3-light-grey"
			id="team">
			<h2>OUR TEAM</h2>
			<p>Meet the team - our office rats: University of Sheffield</p>

			<div class="w3-row">
				<br>

				<div class="w3-quarter">
					<img src="pic/Gang.jpg" alt="Boss" style="width: 45%"
						class="w3-circle w3-hover-opacity">
					<h3>Gang Chen</h3>
					<p>app Designer</p>
				</div>

				<div class="w3-quarter">
					<img src="pic/Gao.jpg" alt="Boss" style="width: 45%"
						class="w3-circle w3-hover-opacity">
					<h3>Mengjie Gao</h3>
					<p>web Designer</p>
				</div>

				<div class="w3-quarter">
					<img src="pic/Tan.jpg" alt="Boss" style="width: 45%"
						class="w3-circle w3-hover-opacity">
					<h3>Tan Chen</h3>
					<p>web Designer</p>
				</div>

				<div class="w3-quarter">
					<img src="pic/Li.jpg" alt="Boss" style="width: 45%"
						class="w3-circle w3-hover-opacity">
					<h3>boss Li</h3>
					<p>app Designer</p>
				</div>

			</div>
		</div>

		<div class="w3-row-padding w3-center w3-padding-64"></div>


		<!-- Contact Container -->
		<div class="w3-container w3-padding-64 w3-theme-l5" id="contact">
			<div class="w3-row">
				<div class="w3-col m5">
					<div class="w3-padding-16">
						<span class="w3-xlarge w3-border-teal w3-bottombar">Contact	Us</span>
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


			<!-- 		<a class="w3-button w3-large w3-teal" href="javascript:void(0)"
			title="Facebook"><i class="fa fa-facebook"></i></a> <a
			class="w3-button w3-large w3-teal" href="javascript:void(0)"
			title="Twitter"><i class="fa fa-twitter"></i></a> <a
			class="w3-button w3-large w3-teal" href="javascript:void(0)"
			title="Google +"><i class="fa fa-google-plus"></i></a> <a
			class="w3-button w3-large w3-teal" href="javascript:void(0)"
			title="Google +"><i class="fa fa-instagram"></i></a> <a
			class="w3-button w3-large w3-teal w3-hide-small"
			href="javascript:void(0)" title="Linkedin"><i
			class="fa fa-linkedin"></i></a> -->
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

		<!-- 	<script>
		// Script for side navigation
		function w3_open() {
			var x = document.getElementById("mySidebar");
			x.style.width = "300px";
			x.style.paddingTop = "10%";
			x.style.display = "block";
		}

		// Close side navigation
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}

		// Used to toggle the menu on smaller screens when clicking on the menu button
		function openNav() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script> -->
</body>
</html>