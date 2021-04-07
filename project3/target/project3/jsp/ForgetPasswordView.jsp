<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.*"%>
<meta name="viewport" content="width=device-width, initial-scale=1">



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


<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.3/css/mdb.min.css)
	;
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
							style="background-color: #0080ff82; margin-bottom: 80px; margin-top: 50px">

							<div class="card-body bg-light">
								<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">
									<%
										long id = DataUtility.getLong(request.getParameter("id"));
									%>

									<h3 class="text-center default-text text-dark">
										<b>Forget Password</b>
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
										<label for="login" class="text-dark"><b>Email:<span
												style="color: red">*</span>
										</b></label><br> <input type="text" name="login"
											placeholder="Enter Role Name"
											value="<%=DataUtility.getStringData(dto.getLogin())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("login", request)%>
									</font> <br>

									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 14px" value="<%=ForgetPasswordCtl.OP_GO%>">
											<span class="fa fa-check-square"></span> Go
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px"
											value="<%=ForgetPasswordCtl.OP_RESET%>">
											<span class="fa fa-refresh"></span> Reset
										</button>

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