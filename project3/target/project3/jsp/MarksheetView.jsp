<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Marksheet</title>
<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.*"%>
<meta name="viewport" content="width=device-width, initial-scale=1">



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


<!-- date picker library -->


<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.3/css/mdb.min.css)
	;
</style>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '-40 :-18',
			dateFormat : 'dd/mm/yy',

		});
	});
</script>

</head>
<body>
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.MarksheetDTO" />

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
								<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">
									<%
										long id = DataUtility.getLong(request.getParameter("id"));
									%>

									<h3 class="text-center default-text text-dark">
										<b><%=(id == 0) ? "Add Marksheet" : "Update Marksheet"%></b>
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
										<label for="collegeName" class="text-dark"><b>Roll
												No:<span style="color: red">*</span>
										</b></label><br> <input type="text" name="rollNo"
											placeholder="Enter Roll Number"
											value="<%=DataUtility.getStringData(dto.getRollNo())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("rollNo", request)%>
									</font>
									<%
										List studentList = (List) request.getAttribute("studentList");
									%>

									<%
										String student = HTMLUtility.getList("studentId", String.valueOf(dto.getStudentId()), studentList);
									%>
									<div class="form-group">
										<h6 class="paddingclass" style="color: #fff">
											<label><b class="text-dark">Student Name</b></label><font
												color="red">*</font>
										</h6>
										<div class="input-group">
											<%=student%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("studentId", request)%></font>


									<div class="form-group" class="fa fa-user">
										<label for="physics" class="text-dark"><b>
												Physics:<span style="color: red">*</span>
										</b></label><br> <input type="text" name="physics"
											placeholder="Enter Physics Marks"
											value="<%=DataUtility.getStringData(dto.getPhysics())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("physics", request)%>
									</font>

									<div class="form-group">
										<label for="city" class="text-dark"><b>Chemistry:<span
												style="color: red">*</span></b></label><br> <input type="text"
											name="chemistry" placeholder="Enter Chemistry Marks"
											value="<%=DataUtility.getStringData(dto.getChemistry())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("chemistry", request)%>
									</font>

									<div class="form-group">
										<label for="maths" class="text-dark"><b> Maths:<span
												style="color: red">*</span>
										</b></label><br> <input type="text" name="maths"
											placeholder="Enter State"
											value="<%=DataUtility.getStringData(dto.getMaths())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("maths", request)%>
									</font> <br> <br>
									<%
										if (id > 0) {
									%>

									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 13px" value="<%=MarksheetCtl.OP_UPDATE%>">
											<span class="fa fa-check-square"></span> Update
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=MarksheetCtl.OP_CANCEL%>">
											<span class="fa fa-refresh"></span> Cancel
										</button>

									</div>


									<%
										} else {
									%>
									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 14px" value="<%=MarksheetCtl.OP_SAVE%>">
											<span class="fa fa-check-square"></span> Save
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=MarksheetCtl.OP_RESET%>">
											<span class="fa fa-refresh"></span> Reset
										</button>

									</div>
									<%
										}
									%>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="Footer.jsp"%>
</html>