<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="in.co.rays.proj3.model.*"%>
<%@ page import="java.text.*"%>
<%@page import="java.util.Iterator"%>
<%@ page import="in.co.rays.proj3.controller.*"%>
<%@ page import="in.co.rays.proj3.controller.*"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Marksheet Merit List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

fontawesome Library
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

/* @import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css)
	; */
</style>
<!-- Select All Library -->
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/Checkbox11.js"></script>

</head>
<body>

	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.MarksheetDTO" />

	<form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="post">
		<div class="container-fluid">

			<div class="card"
				style="background-color: #0080ff82; margin-bottom: 80px; margin-top: 50px">

				<div class="card-body bg-dark">

					<div align="center">
						<H3 style="color: white">
							<b>Marksheet Merit List</b>
						</H3>
					</div>

					<br>
					 <div class="col-12 d-flex justify-content-center">
	 
	     <a class="btn btn-success" href="<%=ORSView.JASPER_CTL%>" target="blank">Click Here to
						Print MeritList</a>
	 </div>

					<br>

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

					<%
						List list = ServletUtility.getList(request);
						System.out.println("...............List in College List Ctl............." + list);
						if (list.size() == 0) {
					%>
					<table align="center">
						<tr>
							<td>

								<button type="submit" name="operation"
									class=" form-control btn btn-success"
									value="<%=CollegeListCtl.OP_BACK%>"
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

					<br>

					<%
						int pageNo = ServletUtility.getPageNo(request);
							int pageSize = ServletUtility.getPageSize(request);
							int index = ((pageNo - 1) * pageSize) + 1;
							//int next = DataUtility.getInt(request.getAttribute("nextlist").toString());

							Iterator<MarksheetDTO> it = list.iterator();
							
					%>


					<table class="table table-light table-striped" border="2">
						<thead>
							<tr align="center" style="background-color: #FFE4C4">
								
								<th><strong>S.NO</strong></th>
								<th><strong>Roll No</strong></th>
								<th><strong>Name</strong></th>
								<th><strong>Physics</strong></th>
								<th><strong>Chemistry</strong></th>
								<th><strong>Maths</strong></th>
								<th><strong>Total</strong></th>
								<th><strong>Percentage (%)</strong></th>

							</tr>
						</thead>
						<%
							while (it.hasNext()) {
									dto = it.next();
						%>
						<tbody>
							<tr align="center">
							
								<td class=""><strong><%=index++%></strong></td>
								<td><strong><%=dto.getRollNo()%></strong></td>
								<td><strong><%=dto.getName()%></strong></td>
								<td><strong><%=dto.getPhysics()%></strong></td>
								<td><strong><%=dto.getChemistry()%></strong></td>
								<td><strong><%=dto.getMaths()%></strong></td>
								<%
									double l = dto.getPhysics() + dto.getChemistry() + dto.getMaths();
								%>
								<td><strong><%=l%></strong></td>
								<%
									long per = (dto.getPhysics() + dto.getChemistry() + dto.getMaths()) / 3;
								%>

								<td><strong><%=per%>%</strong></td>
								<input type="hidden" name="pageNo" value="<%=pageNo%>">
								<input type="hidden" name="pageSize" value="<%=pageSize%>">
							</tr>
						</tbody>
						<%
							}
						%>
					</table>

				</div>
			</div>
		</div>
		<%
			}
		%>
	</form>
</body>
<%@include file="Footer.jsp"%>
</html>