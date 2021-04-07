<%@page import="in.co.rays.proj3.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj3.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.proj3.util.DataUtility"%>
<%@page import="in.co.rays.proj3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>


<style type="text/css">
body {
	background-image: url("img/photo-1477346611705-65d1883cee1e.jfif");
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	font-family: sans-serif;
	margin-bottom: 50px;
}

img {
	border-radius: 8px;
}
</style>

<!-- date picker library -->

<!-- 
<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.3/css/mdb.min.css)
	;

body {
	background-image: url("/Project_3/img1/signup.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

.darken-grey-text {
	color: #2E2E2E;
}

.danger-text {
	color: #ff3547;
}

.default-text {
	color: #fff;
}

.info-text {
	color: #33b5e5;
}

.card {
	background-color: #0080ff82 !important;
}

.paddingclass {
	padding-top: 35px;
}

#textfield {
	border: 2px solid #8080803b;
}
</style> -->
<!-- <style type="text/css">
.setForm {
	padding-top: 5%;
	padding-left: 25%;
	width: 130%
}

.button {
	border-radius: 10px;
	padding: 10px;
	color: white;
	font-size: 20px;
	background-color: #00cc88
}

.textfield {
	border: 1px solid #8080803b;
	height: 38px;
	padding-left: 6px;
}
</style> -->

</head>
<body>


	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.UserDTO" />

	<div>
		<%@include file="Header1.jsp"%>
	</div>



	<script>
		$(function() {
			$("#datepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				yearRange : '-40:-18',
				dateFormat : 'dd/mm/yy',
			/*   endDate: '-18y'	 */

			});
		});
	</script>

	<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">



		<main> <!--MDB Forms--> <br>
		<br>
		<br>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<div class="card"
							style="background-color: #0080ff82; margin-bottom: 40px; margin-top: -10px">

							<div class="card-body bg-light">
								<h3 class="text-center default-text py-3">
									<b class="text-dark">User Registration</b>
								</h3>

								<!--Body-->
								<%
									long id = DataUtility.getLong(request.getParameter("id"));

									if (!ServletUtility.getSuccessMessage(request).equals("")) {
								%>
								<div class="alert alert-success alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<%=ServletUtility.getSuccessMessage(request)%>
								</div>
								<%
									}
								%>

								<%
									if (!ServletUtility.getErrorMessage(request).equals("")) {
								%>
								<div class="alert alert-success alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
								</div>
								<%
									}
								%>

								<input type="hidden" name="id" value="<%=dto.getId()%>">
								<input type="hidden" name="createdBy"
									value="<%=dto.getCreatedBy()%>"> <input type="hidden"
									name="modifiedBy" value="<%=dto.getModifiedBy()%>"> <input
									type="hidden" name="createdDatetime"
									value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
								<input type="hidden" name="modifiedDatetime"
									value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">

								<div class="form-group">
									<h6 style="color: #fff">
										<b class="text-dark">First Name</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="text" name="firstName"
											value="<%=DataUtility.getStringData(dto.getFirstName())%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter First Name">
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font>


								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark">Last Name</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="text" name="lastName"
											value="<%=DataUtility.getStringData(dto.getLastName())%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter Last Name">
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font>



								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark"> Email</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="text" name="email"
											value="<%=DataUtility.getStringData(dto.getLogin())%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter Email">
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("email", request)%></font>


								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark">Mobile Number</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="text" maxlength="10" name="mobileNumber"
											value="<%=DataUtility.getStringData(dto.getMobileNo())%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter Mobile Number">
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("mobileNumber", request)%></font>


								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark">Password</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="password" name="password"
											value="<%=DataUtility.getStringData(dto.getPassword())%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter Password">
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font>

								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark">Confirm Password</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="password" name="confirmPassword"
											value="<%=((id == 0) ? DataUtility.getStringData(dto.getConfirmPassword())
					: DataUtility.getStringData(dto.getPassword()))%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter Confirm Password">
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>

								<%
									HashMap<String, String> map = new HashMap<String, String>();
									map.put("Male", "Male");
									map.put("Female", "Female");
									String gender = HTMLUtility.getList("gender", dto.getGender(), map);
								%>
								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark">Gender</b><font color="red">*</font>
									</h6>

									<div class="input-group">
										
										<%=gender%>
									</div>
								</div>
								<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>



								<div class="form-group">
									<h6 style="color: #fff" class="paddingclass">
										<b class="text-dark">Date of Birth</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										
										<input type="text" id="datepicker" readonly="readonly"
											name="dob"
											value="<%=DataUtility.getDateString(dto.getDob())%>"
											class="form-control border" style="background-color: white"
											placeholder="Enter dob">

									</div>
								</div>
								<span> <font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></span>

								<div class="form-group">
									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 13px" value="<%=UserRegistrationCtl.OP_SIGN_UP%>">
											<span class="fa fa-check-square"></span> Save
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=UserRegistrationCtl.OP_RESET%>">
											<span class="fa fa-refresh"></span> Reset
										</button>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
	</form>

	<%@include file="Footer.jsp"%>


</body>
</html>