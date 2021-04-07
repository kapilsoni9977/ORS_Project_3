<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="in.co.rays.proj3.util.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My profile</title>

<style type="text/css">
body {
    background-image: url("../img/photo-1477346611705-65d1883cee1e.jfif"); 
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

</head>
<body>
<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.UserDTO" />
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<%List list=(List)request.getAttribute("roleList"); %>
	<div id="login">
		<br> <br> <br>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
					<div class="card"
				style="background-color: #0080ff82; margin-bottom: 70px; margin-top: -10px">

				<div class="card-body bg-light">
						<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">
							<h3 class="text-dark" align="center"><b>My Profile</b></h3>
							<%
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
							<div class="alert alert-danger alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
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
								<label for="firstName" class="text-dark"><b>First
										Name:<span style="color: red">*</span>
								</b></label><br> <input type="text" name="firstName"
									placeholder="Enter First Name"
									value="<%=DataUtility.getStringData(dto.getFirstName())%>"
									class="form-control">
							</div>
							<font color="red"><%=ServletUtility.getErrorMessage("firstName", request)%>
							</font>


							<div class="form-group" class="fa fa-user">
								<label for="lastName" class="text-dark"><b>Last
										Name:<span style="color: red">*</span>
								</b></label><br> <input type="text" name="lastName"
									placeholder="Enter Last Name"
									value="<%=DataUtility.getStringData(dto.getLastName())%>"
									class="form-control">
							</div>
							<font color="red"><%=ServletUtility.getErrorMessage("lastName", request)%>
							</font>


							<div class="form-group">
								<label for="email" class="text-dark"><b>Email:<span
										style="color: red">*</span></b></label><br> <input type="text"
									name="email" placeholder="Enter Last Name" readonly="readonly"
									value="<%=DataUtility.getStringData(dto.getLogin())%>"
									class="form-control">
							</div>
							<font color="red"><%=ServletUtility.getErrorMessage("email", request)%>
							</font>


							<div class="form-group">
								<label for="password" class="text-dark"><b>Password:<span
										style="color: red">*</span></b></label><br> <input type="text"
									name="password" placeholder="Enter Password"
									value="<%=DataUtility.getStringData(dto.getPassword())%>"
									class="form-control">
							</div>
							<font color="red"><%=ServletUtility.getErrorMessage("password", request)%>
							</font>

							<div class="form-group">
								<label for="confirmPassword" class="text-dark"><b>Confirm
										Password:<span style="color: red">*</span>
								</b></label><br> <input type="text" name="confirmPassword"
									placeholder="Enter Confirm Password"
									value="<%=DataUtility.getStringData(dto.getConfirmPassword())%>"
									class="form-control">
							</div>
							<font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%>
							</font>

							<div class="form-group">
								<label for="mobileNumber" class="text-dark"><b>Mobile
										Number:<span style="color: red">*</span>
								</b></label><br> <input type="text" name="mobileNumber"
									placeholder="Enter Mobile Number"
									value="<%=DataUtility.getStringData(dto.getMobileNo())%>"
									class="form-control">
							</div>
							<font color="red"><%=ServletUtility.getErrorMessage("mobileNumber", request)%>
							</font>

							<%
								HashMap<String, String> map = new HashMap<String, String>();
								map.put("Male", "Male");
								map.put("Female", "Female");
								String gender = HTMLUtility.getList("gender", dto.getGender(), map);
							%>
							<div class="form-group">
								<label for="mobileNumber" class="text-dark"><b>
										Gender:<span style="color: red">*</span>
								</b></label><br>

								<div class="input-group">

									<%=gender%>
									<%System.out.println("Checking data......"+dto.getGender()); %>
								</div>
							</div>
							<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>


							<%
								String str = HTMLUtility.getList("role", String.valueOf(dto.getRoleId()), list);
							%>
							<div class="form-group">
								<label for="role" class="text-dark"><b> Role:<span
										style="color: red">*</span>
								</b></label><br>

								<div class="input-group">

									<%=str%>
								</div>
							</div>
							<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>


							<div class="form-group">
								<label for="dob" class="text-dark"><b> Date Of
										Birth:<span style="color: red">*</span>
								</b></label><br>
								<div class="input-group">
									<div class="input-group-prepend"></div>
									<input type="text" id="datepicker" readonly="readonly"
										name="dob"
										value="<%=DataUtility.getDateString(dto.getDob())%>"
										class="form-control border" style="background-color: white"
										placeholder="Enter dob">

								</div>
								<span> <font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></span>

								<font color="red"><%=ServletUtility.getErrorMessage("mobileNumber", request)%>
								</font> <br>
								<div class="form-group">
									<button type="submit" class="btn btn-success" name="operation"
										style="font-size: 15px"
										value="<%=MyProfileCtl.OP_UPDATE%>">
										<span class="fa fa-check-square"></span><i> Update</i>
									</button>

									<button type="submit" class="btn btn-dark float-right"
										name="operation" style="font-size: 15px"
										value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">
										<span class="fa fa-eraser"></span> Change My Password
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>