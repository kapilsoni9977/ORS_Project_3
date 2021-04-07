
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Time Table</title>



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



<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.*"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- date picker library -->


<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.3/css/mdb.min.css)
	;
</style>
<!-- <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	 var d = new Date();
		function disableSunday(d) {
		var day = d.getDay();
		if (day == 0) {
			return [ false ];
		} else {
			return [ true ];
		}
	}
	$(function() {
		$("#udate5").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '0:+2',
			dateFormat : 'dd-mm-yy',
			// Disable for Sunday
			beforeShowDay : disableSunday,
			// Disable for back date
			minDate : 0
		});
	});
</script>


</head>
<body>
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.TimetableDTO" />

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
								<form action="<%=ORSView.TIMETABLE_CTL%>" method="post">
									<%
										long id = DataUtility.getLong(request.getParameter("id"));
									%>

									<h3 class="text-center default-text text-dark">
										<b><%=(id == 0) ? "Add TimeTable" : "Update TimeTable"%></b>
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
										<h6 style="color: #fff">
											<b class="text-dark">Course</b><font color="red">*</font>
										</h6>
										<div class="input-group">

											<%
												List courseList = (List) request.getAttribute("courseList");
											%>
											<%=HTMLUtility.getList("course", String.valueOf(dto.getCourseId()), courseList)%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("course", request)%></font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Subject</b><font color="red">*</font>
										</h6>
										<div class="input-group">

											<%
												List sujectList = (List) request.getAttribute("sujectList");
											%>
											<%=HTMLUtility.getList("subject", String.valueOf(dto.getSubjectId()), sujectList)%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("subject", request)%></font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Semester</b><font color="red">*</font>
										</h6>

										<%
											LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
											map.put("1st", "1st");
											map.put("2nd", "2nd");
											map.put("3rd", "3rd");
											map.put("4th", "4th");
											map.put("5th", "5th");
											map.put("6th", "6th");
											map.put("7th", "7th");
											map.put("8th", "8th");

											String semester = HTMLUtility.getList("semester", dto.getSemester(), map);
										%>

										<div class="input-group">

											<%=semester%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("semester", request)%></font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Exam Date</b><font color="red">*</font>
										</h6>
										<div class="input-group">

											<input readonly="readonly" type="text" id="udate5"
												placeholder="Enter examdate" class="form-control border"
												style="background-color: white;" name="examdate"
												value="<%=DataUtility.getDateString(dto.getExamDate())%>">

										</div>
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("examdate", request)%>
									</font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Exam Time</b><font color="red">*</font>
										</h6>

										<%
											LinkedHashMap<String, String> map1 = new LinkedHashMap<String, String>();
											map1.put("08:00AM to 11:00AM", "08:00AM to 11:00AM");
											map1.put("12:00PM to 3:00PM", "12:00PM to 3:00PM");
											map1.put("3:00PM to 6:00PM", "3:00PM to 6:00PM");
										%>



										<div class="input-group">

											<%=HTMLUtility.getList("examTime", dto.getExamTime(), map1)%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("examTime", request)%></font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark"> Description</b><font color="red">*</font>
										</h6>

										<div class="input-group">

											<input type="text" placeholder="Enter description"
												class="form-control border" style="background-color: white;"
												name="description"
												value="<%=DataUtility.getStringData(dto.getDescription())%>">
										</div>
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("description", request)%>
									</font>

									<%
										if (id > 0) {
									%>

									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 13px" value="<%=TimeTableCtl.OP_UPDATE%>">
											<span class="fa fa-check-square"></span> Update
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=TimeTableCtl.OP_CANCEL%>">
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