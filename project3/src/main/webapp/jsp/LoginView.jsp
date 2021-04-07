<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="in.co.rays.proj3.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
</head>
<body>
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.UserDTO" />

	<div id="login">
		<br> <br> <br>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<div class="card"
							style="background-color: #0080ff82; margin-bottom: 80px; margin-top: 20px">

							<div class="card-body bg-light">
								<form action="<%=ORSView.LOGIN_CTL%>" method="post">

									<h3 class="text-center default-text text-dark">
										<b>Login</b>
									</h3>

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
										<label for="login" class="text-dark"><b>Login Id:<span
												style="color: red">*</span>
										</b></label><br> <input type="text" name="login"
											placeholder="Enter Login Id"
											value="<%=DataUtility.getStringData(dto.getLogin())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("login", request)%>
									</font>


									<div class="form-group" class="fa fa-user">
										<label for="password" class="text-dark"><b>
												Password:<span style="color: red">*</span>
										</b></label><br> <input type="password" name="password"
											placeholder="Enter password"
											value="<%=DataUtility.getStringData(dto.getPassword())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("password", request)%>
									</font>

									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 13px" value="<%=LoginCtl.OP_SIGN_IN%>">
											<span class="fa fa-check-square"></span> Signin
										</button>


										<button type="submit" class="btn btn-dark" name="operation"
											style="font-size: 13px"
											value="<%=UserRegistrationCtl.OP_SIGN_UP%>">
											<span class="fa fa-user"></span> Signup
										</button>
										<br> <br>
									</div>
									<div class="text-center" style="color: #20B2AA;">
										<b> <font size="4px"> <a style="color: blue;"
												href="<%=ORSView.FORGET_PASSWORD_CTL%>"><i>Forget
														password ?</i></a></font></b>
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
<%@include file="Footer.jsp"%>
</html>