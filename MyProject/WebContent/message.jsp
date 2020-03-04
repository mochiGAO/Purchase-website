




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
				class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a> <a href="#contact"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Contact
				Us</a>
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


	<!-- 		<div class="w3-container" style="position: relative">
			<a onclick="w3_open()" class="w3-button w3-xlarge w3-circle w3-teal"
				style="position: absolute; top: -28px; right: 24px">+</a>
		</div> -->



	<div class="w3-row-padding w3-center " id="logincard">
	
	${message }



	</div>
	
	<div class="w3-container w3-margin" align="center">
	<button  onclick="javascrtpt:window.location.href='/MyProject/Index.jsp'" class="w3-button w3-black">back</button>
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

	<script>
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
	</script>

</body>
</html>