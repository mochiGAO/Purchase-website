<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<title>Team16 :: Cloud restaurant</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
<body >

<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="Index.jsp"
				class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
			<!-- 			<a href="#team" class="w3-bar-item w3-button">Team</a> <a
				href="#applications" class="w3-bar-item w3-button">Applications</a> -->
			<!--     <a href="#pricing" class="w3-bar-item w3-button">Price</a> -->
		</div>
	</div>



<div class="w3-row-padding w3-padding-64 w3-theme-l1" id="work"></div>
<div class="w3-quarter">
	<h2>restaurants</h2>
	<p>View and Upload your review</p>
</div>
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px"></div>
<!-- First Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" id="food">
<div class="w3-quarter">
<img src="images/one.png"  style="height:100px">
<h3>1.Canton Orchard</h3>
<P>Location:S10 3FR</P>
</div>
<div class="w3-quarter">
<img src="images/two.png"  style="height:100px">
<h3>2.Golden Taste</h3>
<P>Location:S2 4NF</P>
</div>
<div class="w3-quarter">
<img src="images/three.png"  style="height:100px">
<h3>3.WongTing</h3>
<P>Location:S1 4QD</P>
</div>
<div class="w3-quarter">
<img src="images/four.png"  style="height:100px">
<h3>4.Candytown</h3>
<P>Location:S2 4LA</P>
</div> 
<!-- Second Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center">
<div class="w3-quarter">
<img src="images/five.png"  style="height:100px">
<h3>5.China Red Restaurant</h3>
<P>Location:S1 4JD</P>
</div> 
<div class="w3-quarter">
<img src="images/six.jpg"  style="height:100px">
<h3>6.Orient Express</h3>
<P>Location:S10 2HS</P>
</div> 
<div class="w3-quarter">
<img src="images/seven.jpg"  style="height:100px">
<h3>7.Chilli Flow川流不息</h3>
<P>Location:S1 4GH</P>
</div>
<div class="w3-quarter">
<img src="images/eight.jpg"  style="height:100px">
<h3>8.Noodle Inn</h3>
<P>Location:S2 4LT</P>
</div>    
</div>
<!-- third Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center">
<div class="w3-quarter">
<img src="images/nine.jpg"  style="height:100px">
<h3>9.Tokyou传统中餐厅</h3>
<P>Location:S1 2GF</P>
</div> 
<div class="w3-quarter">
<img src="images/ten.jpg"  style="height:100px">
<h3>10.Dim Sum</h3>
<P>Location:S2 4LJ</P>
</div>
<div class="w3-quarter">
<img src="images/eleven.jpg"  style="height:100px">
<h3>11.Yehetian Spicy Hotpot (叶何田麻辣烫)</h3>
<P>Location:S1 4EU</P>
</div>
<div class="w3-quarter">
<img src="images/twelve.png"  style="height:100px">
<h3>12.Taste of China 尚品小厨</h3>
<P>Location:S2 4LH</P>
</div>
</div>
<!-- the fourth Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center">
<div class="w3-quarter">
<img src="images/thirteen.jpg"  style="height:100px">
<h3>13.Bobo Express</h3>
<P>Location:S1 4QQ</P>
</div>
<div class="w3-quarter">
<img src="images/fourteen.jpg"  style="height:100px">
<h3>14.New Zing Vaa</h3>
<P>Location:S11 8TD</P>
</div>
<div class="w3-quarter">
<img src="images/fifteen.jpg"  style="height:100px">
<h3>15.Wild Rice</h3>
<P>Location:S2 4LJ</P>
</div>
<div class="w3-quarter">
<img src="images/sixteen.png"  style="height:100px">
<h3>16.羯子王</h3>
<P>Location:S2 4LN</P>
</div>
<div class="w3-quarter">
<img src="images/seventeen.png"  style="height:100px">
<h3>17.Noodle Inn Centro Sheffield</h3>
<P>Location:S1 4GH</P>
</div>
</div>
<div class="w3-row-padding w3-padding-16 w3-center">
<form action="DaFenServlet"method="post" style="padding-top:-700px;">
Choose a restaurant code:
<select name="restaurantID">
		   <option value="1">1</option>
		   <option value="2" >2</option>
		   <option value="3">3</option>
		   <option value="4">4</option>
		   <option value="5">5</option>
		   <option value="6">6</option>
		   <option value="7">7</option>
		   <option value="8">8</option>
		   <option value="9">9</option>
		   <option value="10">10</option>
		   <option value="11">11</option>
		   <option value="12">12</option>
		   <option value="13">13</option>
		   <option value="14">14</option>
		   <option value="15">15</option>
		   <option value="16">16</option>
		   <option value="17">17</option>   
</select><br>
Give a rating:
<select name="userSTARS">
		   <option value="1">1</option>
		   <option value="2" >2</option>
		   <option value="3">3</option>
		   <option value="4">4</option>
		   <option value="5">5</option>
</select><br>
Your comments:<br>
	   <textarea name="comments" row="5"cols="30"></textarea><br>
	   <input type="reset"value="RESET"><input type="submit"value="SUBMIT">
   </form>	
</div>  

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
