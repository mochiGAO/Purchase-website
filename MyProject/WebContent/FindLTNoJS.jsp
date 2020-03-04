<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="database.Searchedplace"%>
<%@page import="database.PlacesInfoSrvc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Find Lecture Theatre</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
h1 {
	display: block;
	font-size: 2em;
	margin-top: 0.67em;
	margin-bottom: 0.67em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	color: blue;
}

h2 {
	display: block;
	font-size: 2em;
	margin-top: 0.67em;
	margin-bottom: 0.67em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	color: green;
}
</style>
</head>
<body bgcolor=AliceBlue>



	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="Index.jsp"
				class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a>
				<a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">hi, 
				<%=session.getAttribute("Susrname")%></a>



		</div>

	</div>







	<%
		String name = (String) session.getAttribute("Susrname");
	%>



	<div class="w3-container w3-margin" align="center">
		<center>
		
		<div class="w3-container w3-margin">
			<div class="w3-container w3-margin">
				You also can find your way using google map
				<button
					onclick="javascrtpt:window.location.href='/MyProject/FindLT.jsp'"
					class="w3-button w3-black">Using Google map</button>
			</div>
			</div>
			
			<form id="placeform" method="get" action="findpath">
				<div style="display: none;">
					<select name="username">
						<option>
							<%=session.getAttribute("Susrname")%></option>
					</select>
				</div>
				<div class="w3-container w3-margin" align="center">
					<h1>Select your start place:</h1>
					<br />
				</div>
				<div class="w3-container w3-margin" align="center">
					<select class="w3-select w3-border" name="startplace">
						<option value="Diamond">The Diamond</option>
						<option value="Hicks">The Hicks Building</option>
						<option value="301 Glossop Road">301 Glossop Road</option>
						<option value="362 Mushroom Lane">362 Mushroom Lane</option>
						<option value="38 Mappin Street">38 Mappin Street</option>
						<option value="45 Victoria Street">45 Victoria Street</option>
						<option value="9 Mappin Street">9 Mappin Street</option>
						<option value="Alfred Denny Building">Alfred Denny
							Building</option>
						<option value="Amy Johnson Building">Amy Johnson Building</option>
						<option value="Arts Tower">Arts Tower</option>
						<option value="Barber House">Barber House</option>
						<option value="Bartolomé House">Bartolomé House</option>
						<option value="Brook Hill Hall">Brook Hill Hall</option>
						<option value="Convocation Hall">Convocation Hall</option>
						<option value="Crewe Hall">Crewe Hall</option>
						<option value="Dainton Building">Dainton Building</option>
						<option value="Dental School">Dental School</option>
						<option value="Edgar Allen House">Edgar Allen House</option>
						<option value="Ella Armatige Building">Ella Armatige
							Building</option>
						<option value="Elmfield">Elmfield</option>
						<option value="Firth Court">Firth Court</option>
						<option value="Firth Hall">Firth Hall</option>
						<option value="Geography Building">Geography Building</option>
						<option value="Goodwin Sport Centre">Goodwin Sport Centre</option>
						<option value="Graduate Research Centre">Graduate
							Research Centre</option>
						<option value="Hallamshire Hospital">Hallamshire Hospital</option>
						<option value="Health Centre">Health Centre</option>
						<option value="Henry Stephenson Building">Henry
							Stephenson Building</option>
						<option value="Hillsborough Centre">Hillsborough Centre</option>
						<option value="Humanities Research Institute">Humanities
							Research Institute</option>
						<option value="Husband Building">Husband Building</option>
						<option value="ICOSS">ICOSS</option>
						<option value="Information Commons">Information Commons</option>
						<option value="Jessop Building">Jessop Building</option>
						<option value="Jessop West">Jessop West</option>
						<option value="North Campus">North Campus</option>
						<option value="Northgate House">Northgate House</option>
						<option value="Octagon Centre">Octagon Centre</option>
						<option value="Pam Liversidge">Pam Liversidge</option>
						<option value="Philadelphia Campus">Philadelphia Campus</option>
						<option value="Portobello Centre">Portobello Centre</option>
						<option value="PropertywithUS">PropertywithUS</option>
						<option value="Regent Court">Regent Court</option>
						<option value="Richard Roberts">Richard Roberts</option>
						<option value="Robert Hadfield">Robert Hadfield</option>
						<option value="Sheffield Wednesday">Sheffield Wednesday</option>
						<option value="SITraN Building">SITraN Building</option>
						<option value="Stephenson Hall">Stephenson Hall</option>
						<option value="Students Union Building">Students Union
							Building</option>
						<option value="The Edge">The Edge</option>
						<option value="Western Bank Library">Western Bank Library</option>
					</select>
				</div>
				<br />
				<div class="w3-container w3-margin" align="center">
					<h2>Select your destination:</h2>
					<br />
				</div>
				<br />
				<div class="w3-container w3-margin" align="center">
					<select class="w3-select w3-border" name="destination">
						<option value="diamond">The Diamond</option>
						<option value="hicks">The Hicks Building</option>
						<option value="301 Glossop Road">301 Glossop Road</option>
						<option value="362 Mushroom Lane">362 Mushroom Lane</option>
						<option value="38 Mappin Street">38 Mappin Street</option>
						<option value="45 Victoria Street">45 Victoria Street</option>
						<option value="9 Mappin Street">9 Mappin Street</option>
						<option value="Alfred Denny Building">Alfred Denny
							Building</option>
						<option value="Amy Johnson Building">Amy Johnson Building</option>
						<option value="Arts Tower">Arts Tower</option>
						<option value="Barber House">Barber House</option>
						<option value="Bartolomé House">Bartolomé House</option>
						<option value="Brook Hill Hall">Brook Hill Hall</option>
						<option value="Convocation Hall">Convocation Hall</option>
						<option value="Crewe Hall">Crewe Hall</option>
						<option value="Dainton Building">Dainton Building</option>
						<option value="Dental School">Dental School</option>
						<option value="Edgar Allen House">Edgar Allen House</option>
						<option value="Ella Armatige Building">Ella Armatige
							Building</option>
						<option value="Elmfield">Elmfield</option>
						<option value="Firth Court">Firth Court</option>
						<option value="Firth Hall">Firth Hall</option>
						<option value="Geography Building">Geography Building</option>
						<option value="Goodwin Sport Centre">Goodwin Sport Centre</option>
						<option value="Graduate Research Centre">Graduate
							Research Centre</option>
						<option value="Hallamshire Hospital">Hallamshire Hospital</option>
						<option value="Health Centre">Health Centre</option>
						<option value="Henry Stephenson Building">Henry
							Stephenson Building</option>
						<option value="Hillsborough Centre">Hillsborough Centre</option>
						<option value="Humanities Research Institute">Humanities
							Research Institute</option>
						<option value="Husband Building">Husband Building</option>
						<option value="ICOSS">ICOSS</option>
						<option value="Information Commons">Information Commons</option>
						<option value="Jessop Building">Jessop Building</option>
						<option value="Jessop West">Jessop West</option>
						<option value="North Campus">North Campus</option>
						<option value="Northgate House">Northgate House</option>
						<option value="Octagon Centre">Octagon Centre</option>
						<option value="Pam Liversidge">Pam Liversidge</option>
						<option value="Philadelphia Campus">Philadelphia Campus</option>
						<option value="Portobello Centre">Portobello Centre</option>
						<option value="PropertywithUS">PropertywithUS</option>
						<option value="Regent Court">Regent Court</option>
						<option value="Richard Roberts">Richard Roberts</option>
						<option value="Robert Hadfield">Robert Hadfield</option>
						<option value="Sheffield Wednesday">Sheffield Wednesday</option>
						<option value="SITraN Building">SITraN Building</option>
						<option value="Stephenson Hall">Stephenson Hall</option>
						<option value="Students Union Building">Students Union
							Building</option>
						<option value="The Edge">The Edge</option>
						<option value="Western Bank Library">Western Bank Library</option>
					</select>
				</div>
				<br />
				<div class="w3-container w3-margin" align="center">
					<input type="submit" value="Go" class="w3-button w3-black" /> <input
						type="reset" value="Reset" class="w3-button w3-black" />
				</div>
			</form>

			<div>
				<h3>History:</h3>

			</div>
			<div>
				<%
	List<String> historyList = new ArrayList<String>();
		PlacesInfoSrvc pSrvc = new PlacesInfoSrvc();
		historyList = pSrvc.search(name);
		Collections.reverse(historyList);
		for(String s : historyList){ %>
				<span><%=s %></span> <br />
				<%
		}
	%>
			</div>
		</center>
	</div>
</body>
</html>