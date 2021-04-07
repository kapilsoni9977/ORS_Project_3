<%@page import="in.co.rays.proj3.controller.ChangePasswordCtl"%>
<%@page import="in.co.rays.proj3.util.DataUtility"%>
<%@page import="in.co.rays.proj3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>

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
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.UserDTO" />

	<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post">
		<br> <br> <br>
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<div class="card"
							style="background-color: #0080ff82; margin-bottom: 80px; margin-top: 10px">

							<div class="card-body bg-light">

								<h4 align="center" class="text-dark"><b>Change Password:</b></h4>


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
									<%=ServletUtility.getErrorMessage(request)%>
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
										<b class="text-dark"> Old Password</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										<div class="input-group-prepend"></div>
										<input type="password" placeholder="Enter Old Password"
											class="form-control border" style="background-color: white"
											name="oldPassword"
											value="<%=DataUtility.getString(request.getParameter("oldPassword") == null ? ""
					: DataUtility.getString(request.getParameter("oldPassword")))%>">
									</div>
								</div>
								<font color="red"><%=ServletUtility.getErrorMessage("oldPassword", request)%>
								</font>


								<div class="form-group">
									<h6 class="paddingclass" style="color: #fff">
										<b class="text-dark">New Password</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										<div class="input-group-prepend"></div>
										<input type="password" placeholder="Enter New Password"
											class="form-control border" style="background-color: white"
											name="newPassword"
											value="<%=DataUtility.getString(request.getParameter("newPassword") == null ? ""
					: DataUtility.getString(request.getParameter("newPassword")))%>">
									</div>
								</div>
								<font color="red"><%=ServletUtility.getErrorMessage("newPassword", request)%>
								</font>


								<div class="form-group">
									<h6 class="paddingclass" style="color: #fff">
										<b class="text-dark">Confirm Password</b><font color="red">*</font>
									</h6>
									<div class="input-group">
										<div class="input-group-prepend"></div>
										<input type="password" placeholder="Enter New Password"
											class="form-control border" style="background-color: white"
											name="confirmPassword"
											value="<%=DataUtility.getString(request.getParameter("confirmPassword") == null ? ""
					: DataUtility.getString(request.getParameter("confirmPassword")))%>">
									</div>
								</div>
								<font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%>
								</font>

								<br>
								<div class="text-center paddingclass">
									<button type="submit" class="btn btn-success" name="operation"
										style="font-size: 13px" value="<%=ChangePasswordCtl.OP_SAVE%>">
										<span class="fa fa-check-square"></span> Save
									</button>


									<button type="submit" class="btn btn-warning" name="operation"
										style="font-size: 13px"
										value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE%>">
										<span class="fa fa-eraser"></span> Change My Profile
									</button>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<br>
	<br>
	<br>
</body>
<%@include file="Footer.jsp"%>
</html>