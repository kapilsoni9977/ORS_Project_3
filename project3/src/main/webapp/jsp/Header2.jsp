<%@page import="in.co.rays.proj3.DTO.*"%>
<%@page import="in.co.rays.proj3.controller.*"%>
<%@page import="in.co.rays.proj3.DTO.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- fontawesome Library -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> 
	<a
		href="<%=ORSView.WELCOME_CTL%>">
		<div class="navbar-brand">
			<img src="../img/Logo2.jpg" height="25px">
		</div>
	</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown"
		style="font-size: 15.5px">
		<ul class="navbar-nav  ml-auto">
	<%
		UserDTO userDto = (UserDTO) session.getAttribute("user");

		boolean userLoggedIn = userDto != null;

		String welcomeMsg = "Hi,";

		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += userDto.getFirstName() + " (" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>

			<%
				if (userLoggedIn) {
			%>
			<%
				if (userDto.getRoleId() == RoleDTO.STUDENT) {
			%>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <i
					class='fas fa-user'></i>User
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="<%=ORSView.USER_CTL%>"> <i
						class="fas fa-user-plus"></i><b>Add User</b>
					</a> <a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>"><i
						class="fas fa-users"></i><b>User List</b></a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <i
					class='fas fa-file-alt'></i> Marksheet
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">Get Marksheet</a> <a
						class="dropdown-item" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i
						class="fas fa-user-tag"></i>Marksheet MeritList</a> <a
						class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i
						class="fas fa-user-tag"></i>Add Marksheet</a> <a class="dropdown-item"
						href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i
						class="fas fa-list-ol"></i>Marksheet List</a>
				</div></li>


			<%
				} else if (userDto.getRoleId() == RoleDTO.ADMIN) {
			%>
			<ul class="nav nav-pills text-secondary">
				<li class="nav-item"></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"><i class='fas fa-user'></i>User</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="color: blue;">
						<a class="dropdown-item" href="<%=ORSView.USER_CTL%>"> <i
							class="fas fa-user-plus"></i>Add User
						</a> <a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>"><i
							class="fas fa-users"></i> User List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"><i class='fas fa-file-alt'></i>
							Marksheet</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<!--           <a class="dropdown-item" href="#">Get Marksheet</a>
 -->
						<a class="dropdown-item"
							href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i
							class="fas fa-user-tag"></i>Marksheet MeritList</a> <a
							class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i
							class="fas fa-file-alt"></i>Add Marksheet</a> <a
							class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i
							class="fas fa-list-ol"></i>Marksheet List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"><i class='fas fa-university'></i>
							College</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="color: blue">
						<a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>"><i
							class="fa fa-university"></i>Add College</a> <a class="dropdown-item"
							href="<%=ORSView.COLLEGE_LIST_CTL%>"><i
							class="fas fa-list-ol"></i>College List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"> <i class='fas fa-user-circle'></i>
							Role
					</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%">
						<a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>"><i
							class="fas fa-user-circle"></i>Add Role</a> <a class="dropdown-item"
							href="<%=ORSView.ROLE_LIST_CTL%>"><i class="fas fa-list-ol"></i>Role
							List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"> <i class='fas fa-user-graduate'></i>
							Student
					</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%">
						<a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>"><i
							class="fas fa-user-graduate"></i>Add Student</a> <a
							class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>"><i
							class="fas fa-users"></i>Student List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"> <i class='fa fa-book'></i> Course
					</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%">
						<a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>"><i
							class="fas fa-book"></i>Add Course</a> <a class="dropdown-item"
							href="<%=ORSView.COURSE_LIST_CTL%>"><i class="fas fa-list-ol"></i>Course
							List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"><i class='fas fa-book'></i> Subject</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%">
						<a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>"><i
							class="fas fa-book"></i>Add Subject</a> <a class="dropdown-item"
							href="<%=ORSView.SUBJECT_LIST_CTL%>"><i
							class="fas fa-list-ol "></i>Subject List</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"> <i class='fas fa-user-tie'></i>
							Faculty
					</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%">
						<a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>"><i
							class="fas fa-user-tie"></i>Add Faculty</a> <a class="dropdown-item"
							href="<%=ORSView.FACULTY_LIST_CTL%>"><i class="fas fa-users"></i>Faculty
							List</a>
					</div></li>
				<li class="nav-item dropdown "><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"> <i class='fas fa-clock'></i>
							TimeTable
					</strong>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%">
						<a class="dropdown-item" href="<%=ORSView.TIMETABLE_CTL%>"><i
							class="fas fa-clock"></i>Add TimeTable</a> <a class="dropdown-item"
							href="<%=ORSView.TIMETABLE_LIST_CTL%>"><i
							class="fas fa-list-ol "></i>TimeTable List</a>
					</div></li>


				<%
					}
					}
				%>
				<li class="nav-item dropdown "><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <strong
						style="color: white"><i class="fas fa-user-circle"></i>
							<%=welcomeMsg%></strong>
				</a> <%
 	if (userLoggedIn) {
 %>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 128%; left: -50px">

						<a class="dropdown-item" href="<%=ORSView.MY_PROFILE_CTL%>"><i
							class="fa fa-user-secret" aria-hidden="true"></i>My Profile</a> <a
							class="dropdown-item" href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><i
							class="fa fa-key"></i>Change Password</a> <a class="dropdown-item"
							href="<%=ORSView.JAVA_DOC_VIEW%>" target="_blank"><i
							class="fas fa-file-alt "></i>Java Doc</a> <a class="dropdown-item"
							href="<%=ORSView.LOGIN_CTL%>?operation=<%=WelcomeCtl.OP_LOG_OUT%>"><i
							class="fas fa-sign-out-alt"></i>Logout</a>
					</div> <%
 	} else {
 %>
					<div class="dropdown-menu"
						aria-labelledby="navbarDropdownMenuLink "
						style="top: 128%; left: -100px">

						<a class="dropdown-item" href="<%=ORSView.LOGIN_CTL%>"><i
							class="fas fa-sign-in-alt"></i>&nbsp; &nbsp;<b>Login</b></a> <a
							class="dropdown-item" href="<%=ORSView.USER_REGISTRATION_CTL%>"><i
							class="fa fa-registered"></i>&nbsp; &nbsp;<b>User
								Registration</b></a>
						<%--  <a class="dropdown-item" href="<%=ORSView.FORGET_PASSWORD_CTL%>"><i class="fa fa-key"></i>Forget Password</a> --%>
					</div></li> 
				<%
					}
				%>
			</ul>
	</div>
	</nav>
</body>
</html>