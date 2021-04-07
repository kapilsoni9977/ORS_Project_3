<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Faculty</title>



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


<meta name="viewport" content="width=device-width, initial-scale=1">

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
		class="in.co.rays.proj3.DTO.FacultyDTO" />

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
								<form action="<%=ORSView.FACULTY_CTL%>" method="post">
									<%
										long id = DataUtility.getLong(request.getParameter("id"));
									%>

									<h3 class="text-center default-text text-dark">
										<b><%=(id == 0) ? "Add Faculty" : "Update faculty"%></b>
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
										<label for="firstName" class="text-dark"><b>First
												Name:<span style="color: red">*</span>
										</b></label><br> <input type="text" name="firstName"
											placeholder="Enter Faculty Name"
											value="<%=DataUtility.getStringData(dto.getFirstName())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("firstName", request)%>
									</font>


									<div class="form-group" class="fa fa-user">
										<label for="lastName" class="text-dark"><b>
												Last Name:<span style="color: red">*</span>
										</b></label><br> <input type="text" name="lastName"
											placeholder="Enter Last Name"
											value="<%=DataUtility.getStringData(dto.getLastName())%>"
											class="form-control">
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("lastName", request)%>
									</font>



									<%
										HashMap<String, String> map = new HashMap<String, String>();
										map.put("Male", "Male");
										map.put("Female", "Female");
										String gender = HTMLUtility.getList("gender", dto.getGender(), map);
									%>
									<div class="form-group">
										<h6 class="paddingclass" style="color: #fff">
											<b class="text-dark">Gender</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<%=gender%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Joining Date</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<input readonly="readonly" type="text" id="datepicker"
												placeholder="Enter Joining Date" class="form-control border"
												style="background-color: white;" name="joiningDate"
												value="<%=DataUtility.getDateString(dto.getDob())%>">
										</div>
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("joiningDate", request)%>
									</font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Qualification</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<input type="text" placeholder="Enter qualification"
												class="form-control border" style="background-color: white;"
												name="qualification"
												value="<%=DataUtility.getStringData(dto.getQualification())%>">
										</div>
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("qualification", request)%>
									</font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
										<b class="text-dark">	Mobile Number</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<input type="text" placeholder="Enter Mobile Number"
												class="form-control border" maxlength="10"
												style="background-color: white;" name="mobileNo"
												value="<%=DataUtility.getStringData(dto.getMobileNo())%>">
										</div>
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%>
									</font>

									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Email Id</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<input type="text" placeholder="Enter Email"
												class="form-control border" style="background-color: white;"
												name="login"
												value="<%=DataUtility.getStringData(dto.getEmailId())%>">
										</div>
									</div>
									<font color="red"><%=ServletUtility.getErrorMessage("login", request)%>
									</font>
									<%
										List collegeList = (List) request.getAttribute("collegeList");
										System.out.println("..............CollegeList.............." + collegeList);
										List courseList = (List) request.getAttribute("courseList");
										System.out.println("..............CourseList.............." + courseList);
										List subjectList = (List) request.getAttribute("subjectList");
										System.out.println(".............SubjectList.............." + subjectList);
									%>

									<%
										String college = HTMLUtility.getList("college", String.valueOf(dto.getCollegeId()), collegeList);
									%>
									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">College</b><font color="red">*</font>
										</h6>
										<div class="input-group">
										
											<%=college%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("college", request)%></font>

									<%
										String course = HTMLUtility.getList("course", String.valueOf(dto.getCourseId()), courseList);
									%>
									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Course</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<%=course%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("course", request)%></font>

									<%
										String subject = HTMLUtility.getList("subject", String.valueOf(dto.getSubjectId()), subjectList);
									%>
									<div class="form-group">
										<h6 class=" paddingclass" style="color: #fff">
											<b class="text-dark">Subject</b><font color="red">*</font>
										</h6>
										<div class="input-group">
											
											<%=subject%>
										</div>
									</div>
									<font color="red"> <%=ServletUtility.getErrorMessage("subject", request)%></font>

									<%
										if (id > 0) {
									%>

									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 13px" value="<%=FacultyListCtl.OP_UPDATE%>">
											<span class="fa fa-check-square"></span> Update
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=FacultyListCtl.OP_CANCEL%>">
											<span class="fa fa-refresh"></span> Cancel
										</button>

									</div>


									<%
										} else {
									%>
									<div class="text-center paddingclass">

										<button type="submit" class="btn btn-success" name="operation"
											style="font-size: 14px" value="<%=FacultyListCtl.OP_SAVE%>">
											<span class="fa fa-check-square"></span> Save
										</button>


										<button type="submit" class="btn btn-warning" name="operation"
											style="font-size: 13px" value="<%=FacultyListCtl.OP_RESET%>">
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
<%@include file="Footer.jsp"%>
</html>