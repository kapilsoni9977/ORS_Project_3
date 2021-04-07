<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Course</title>

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
		class="in.co.rays.proj3.DTO.CourseDTO" />
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<div id="login">
		<br> <br> <br>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<div class="card"
							style="background-color: #0080ff82; margin-bottom: 80px; margin-top: -10px">

							<div class="card-body bg-light">
								<form action="<%=ORSView.COURSE_CTL%>" method="post">
									<%
										long id = DataUtility.getLong(request.getParameter("id"));
									%>

									<h3 class="text-center default-text text-dark">
										<b><%=(id == 0) ? "Add Course" : "Update Course"%></b>
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
										<label for="Role" class="text-dark"><b>Course:<span
												style="color: red">*</span>
										</b></label><br> <input type="text" name="courseName"
											placeholder="Enter Course Name"
											value="<%=DataUtility.getStringData(dto.getCourseName())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("courseName", request)%>
									</font>


									<div class="form-group" class="fa fa-user">
										<label for="duration" class="text-dark"><b>
												Duration:<span style="color: red">*</span>
										</b></label><br> <input type="text" name="duration"
											placeholder="Enter Duration"
											value="<%=DataUtility.getStringData(dto.getDuration())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("duration", request)%>
									</font> 
									
									<div class="form-group" class="fa fa-user">
										<label for="description" class="text-dark"><b>
												Description:<span style="color: red">*</span>
										</b></label><br> <input type="text" name="description"
											placeholder="Enter Description"
											value="<%=DataUtility.getStringData(dto.getDescription())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("description", request)%>
									</font> 
									
									<%
										if (id > 0) {
									%>

									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 13px" value="<%=CourseCtl.OP_UPDATE%>">
											<span class="fa fa-check-square"></span> Update
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=CourseCtl.OP_CANCEL%>">
											<span class="fa fa-refresh"></span> Cancel
										</button>

									</div>


									<%
										} else {
									%>
									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 14px" value="<%=CourseCtl.OP_SAVE%>">
											<span class="fa fa-check-square"></span> Save
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=CourseCtl.OP_RESET%>">
											<span class="fa fa-refresh"></span> Reset
										</button>

									</div>
									<%
										}
									%>
								
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="Footer.jsp"%>

</html>