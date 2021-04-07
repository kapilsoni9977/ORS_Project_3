<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.co.rays.proj3.DTO.TimetableDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj3.util.DataUtility"%>
<%@page import="in.co.rays.proj3.util.HTMLUtility2"%>
<%@page import="in.co.rays.proj3.controller.*"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj3.util.ServletUtility"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TimeTable List View</title>
<!-- Select All Library -->
<%-- <script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/Checkbox11.js"></script>

<!-- font-awesome library -->
<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css)
	;
</style> --%>

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
		class="in.co.rays.proj3.DTO.TimetableDTO" />

	<form action="<%=ORSView.TIMETABLE_LIST_CTL%>" method="post">
		<div class="container-fluid">

			<div class="card"
				style="background-color: #0080ff82; margin-bottom: 80px; margin-top: 50px">

				<div class="card-body bg-dark">

					<div align="center">
						<H3 style="color: White">
							<b>TimeTable List</b>
						</H3>
					</div>
					<br> <br>

					<div class="text-center">

						<%
							if (!ServletUtility.getSuccessMessage(request).equals("")) {
						%>
						<div class="alert alert-success alert-dismissible fade show">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<font color="green"> <%=ServletUtility.getSuccessMessage(request)%></font>
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
					</div>

					<input type="hidden" name="id" value="<%=dto.getId()%>"> <input
						type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
					<input type="hidden" name="modifiedBy"
						value="<%=dto.getModifiedBy()%>"> <input type="hidden"
						name="createdDatetime"
						value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
					<input type="hidden" name="modifiedDatetime"
						value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">


					<%
						List list = ServletUtility.getList(request);
						System.out.println("...............List in TimeTable List Ctl............." + list);
						if (list.size() == 0) {
					%>
					<table align="center">
						<tr>
							<td>

								<button type="submit" name="operation"
									class=" form-control btn btn-success"
									value="<%=TimeTableListCtl.OP_BACK%>"
									style="width: 150px; height: 47px; font-size: 16px; background-color: gray;">
									<span style="margin-right: 7px;" class="	fa fa-back"></span>
									Back
								</button>
							</td>

						</tr>
					</table>

					<%
						} else {
					%>

					<%
						List courseList = (List) request.getAttribute("courseList");

							List subjectList = (List) request.getAttribute("subjectList");
					%>
					<div class="row no-gutters">
						&nbsp;
						<!--  <label class="form-check-label" for="check2" style = "max-width:72px"> -->
						<i style="color: white">Course :</i>&nbsp;
						<div class="col-sm-2"><%=HTMLUtility2.getList("course", String.valueOf(dto.getCourseId()), courseList)%></div>
						&emsp; <i style="color: white"> Subject :</i>&nbsp;
						<div class="col-sm-2"><%=HTMLUtility2.getList("subject", String.valueOf(dto.getSubjectId()), subjectList)%></div>
						<%-- &emsp; <strong style="color: white"> Exam Date :~</strong>&nbsp;
						<div class="col-sm-2">
							<input type="text" name="Exdate" class="form-control"
								placeholder="Enter Exam Date" readonly="readonly"
								id="datepicker"
								style="background-color: white; max-height: 23px; max-width: 250px"
								value="<%=DataUtility.getDateString(dto.getExamDate())%>">
						</div> --%>
						&nbsp;&nbsp;

						<div class="col-sm-2 pl-4" style="max-width: 140px">
							<button type="submit" name="operation"
								class=" form-control btn btn-success" style="font-size: 13px"
								value="<%=TimeTableListCtl.OP_SEARCH%>">
								<span class="fa fa-search"></span> Search
							</button>
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="col-sm-2 pl-1" style="max-width: 100px">
							<button type="submit" name="operation"
								class=" form-control btn btn-warning" style="font-size: 13px"
								value="<%=TimeTableListCtl.OP_RESET%>">
								<span class="fa fa-refresh"></span>Reset
							</button>
						</div>

						<div class="col-sm-2"></div>
					</div>
					<br>

					<div class="row no-gutters">
						<button type="submit" style="font-size: 13px" name="operation"
							value="<%=TimeTableListCtl.OP_NEW%>" class="btn btn-success">
							<span class="fas fa-plus-square"></span>
							<%=TimeTableListCtl.OP_NEW%>
						</button>
						<div class="ml-auto">
							<button type="submit" style="font-size: 13px" name="operation"
								value="<%=TimeTableListCtl.OP_DELETE%>" class="btn btn-danger">
								<span class="fa fa-trash"></span>
								<%=TimeTableListCtl.OP_DELETE%>
							</button>
						</div>
					</div>
					<br>


					<%
						int pageNo = ServletUtility.getPageNo(request);
							int pageSize = ServletUtility.getPageSize(request);
							int index = ((pageNo - 1) * pageSize) + 1;
							//int next = DataUtility.getInt(request.getAttribute("nextlist").toString());

							Iterator<TimetableDTO> it = list.iterator();
							/* while (it.hasNext()) {
							
								dto = it.next(); */
					%>


					<table class="table table-light table-striped" border="2">
						<thead>
							<tr align="center" style="background-color: #FFE4C4">
								<th><input type="checkbox" id="select_all" name="select"><strong>
										Select All</strong></th>
								<th><strong>S.NO</strong></th>
								<th><strong>Course Name</strong></th>
								<th><strong>Subject Name</strong></th>
								<th><strong>Semester</strong></th>
								<!-- <th><strong>Exam Date</strong></th> -->
								<th><strong>Exam Time</strong></th>
								<!-- <th><strong>Description</strong></th> -->
								<th><strong>Edit</strong></th>
							</tr>
						</thead>
						<%
							while (it.hasNext()) {
									dto = it.next();
						%>
						<tbody>
							<tr align="center">
								<td align="center"><input type="checkbox" class="checkbox"
									name="ids" value="<%=dto.getId()%>"></td>
								<td class=""><strong><%=index++%></strong></td>
								<td align=""><strong><%=dto.getCourseName()%></strong></td>
								<td align=""><strong><%=dto.getSubjectName()%></strong></td>
								<td align=""><strong><%=dto.getSemester()%></strong></td>

							<%-- 	<%
									SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
											String date = sdf.format(dto.getExamDate());
								%>

								<td align=""><strong><%=date%></strong></td> --%>
								<td align=""><strong><%=dto.getExamTime()%></strong></td>
								<%-- <td align=""><strong><%=dto.getDescription() %></strong></td> --%>

								<td style="size: 20%; text-align: center;"><a
									href="TimeTableCtl?id=<%=dto.getId()%>"> <span
										class="fa fa-edit"></span></a></td>
								<input type="hidden" name="pageNo" value="<%=pageNo%>">
								<input type="hidden" name="pageSize" value="<%=pageSize%>">
							</tr>
						</tbody>
						<%
							}
						%>
					</table>


					<table width="100%">
						<tr>

							<td align="left">
								<button type="submit" name="operation" style="font-size: 12px"
									value="<%=CollegeListCtl.OP_PREVIOUS%>"
									<%=(pageNo == 1) ? "disabled" : ""%> class="btn btn-light">
									<span class="fa fa-chevron-left"></span>
									<%=CollegeListCtl.OP_PREVIOUS%>
								</button>
							</td>

							<td align="right">
								<button type="submit" style="font-size: 13px" name="operation"
									value="<%=CollegeListCtl.OP_NEXT%>"
									<%=(list.size() < pageSize) ? "disabled" : ""%>
									class="btn btn-light">
									<%=CollegeListCtl.OP_NEXT%>
									<span class="fa fa-chevron-right"></span>
								</button>
								</div>

							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</form>
</body>
</html>