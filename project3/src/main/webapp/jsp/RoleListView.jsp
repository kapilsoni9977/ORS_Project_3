<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="in.co.rays.proj3.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="in.co.rays.proj3.model.*"%>
<%@ page import="java.text.*"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Role List View</title>
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css)
	;
</style> -->
</head>
<body>
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.RoleDTO" />

	<form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">
		<div class="container-fluid">

			<div class="card"
				style="background-color: #0080ff82; margin-bottom: 80px; margin-top: 50px">

				<div class="card-body bg-dark">

					<div align="center">
						<H3 style="color: white">
							<b>Role List</b>
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
						System.out.println("...............List in College List Ctl............." + list);
						if (list.size() == 0) {
					%>
					<table align="center">
						<tr>
							<td>

								<button type="submit" name="operation"
									class=" form-control btn btn-success"
									value="<%=RoleListCtl.OP_BACK%>"
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


					<div class="row no-gutters">
						
						<!--  <label class="form-check-label" for="check2" style = "max-width:72px"> -->

						<i style="color: white"><b>Role :</b></i>&nbsp;
						<div class="col-sm-2">
							<input placeholder="Enter City" style="background-color: white"
								type="text" name="city" class="border"
								value="<%=ServletUtility.getParameter("city", request)%>">
							<%
								List roleList = (List) request.getAttribute("roleList");
							%>
						</div>
						&emsp;&nbsp;&emsp;&nbsp;&emsp;&nbsp; <i style="color: white"><b>College
								:</b></i>&nbsp;
						<div class="col-sm-2"><%=HTMLUtility2.getList("roleId", String.valueOf(dto.getId()), roleList)%>
						</div>
						&emsp;&nbsp;&nbsp;

						<div class="col-sm-2 pl-4" style="max-width: 140px">
							<button type="submit" name="operation"
								class=" form-control btn btn-success" style="font-size: 13px"
								value="<%=RoleListCtl.OP_SEARCH%>">
								<span class="fa fa-search"></span> Search
							</button>
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="col-sm-2 pl-1" style="max-width: 100px">
							<button type="submit" name="operation"
								class=" form-control btn btn-warning" style="font-size: 13px"
								value="<%=RoleListCtl.OP_RESET%>">
								<span class="fa fa-refresh"></span>Reset
							</button>
						</div>

						<div class="col-sm-2"></div>
					</div>
					<br>

					<div class="row no-gutters">
						<button type="submit" style="font-size: 13px" name="operation"
							value="<%=RoleListCtl.OP_NEW%>" class="btn btn-success">
							<span class="fas fa-plus-square"></span>
							<%=RoleListCtl.OP_NEW%>
						</button>
						<div class="ml-auto">
							<button type="submit" style="font-size: 13px" name="operation"
								value="<%=RoleListCtl.OP_DELETE%>" class="btn btn-danger">
								<span class="fa fa-trash"></span>
								<%=RoleListCtl.OP_DELETE%>
							</button>
						</div>
					</div>
					<br>


					<%
						int pageNo = ServletUtility.getPageNo(request);
							int pageSize = ServletUtility.getPageSize(request);
							int index = ((pageNo - 1) * pageSize) + 1;
							//int next = DataUtility.getInt(request.getAttribute("nextlist").toString());

							Iterator<RoleDTO> it = list.iterator();
							/* while (it.hasNext()) {
							
								dto = it.next(); */
					%>


					<table class="table table-light table-striped" border="2">
						<thead>
							<tr align="center" style="background-color: #FFE4C4">
								<th><input type="checkbox" id="select_all" name="select"><strong>
										Select All</strong></th>
								<th><strong>S.NO</strong></th>
								<th><strong>Name</strong></th>
								<th><strong>Description</strong></th>
								<th><strong>Edit</strong></th>
							</tr>
						</thead>
						<%
							while (it.hasNext()) {
									dto = it.next();
						%>
						<tbody>
							<tr align="center">
								<td class="text-center"><input type="checkbox"
							class="checkbox" name="ids" value="<%=dto.getId()%>"
							<%if(dto.getId() == RoleDTO.ADMIN) {                    
                    %>
                    <%="disabled" %><% } %>>
							</td>
								<td class=""><strong><%=index++%></strong></td>
								<td><strong><%=dto.getName()%></strong></td>
								<td><strong><%=dto.getDescription()%></strong></td>
								<td style="size: 20%; text-align: center;">
									<%
										if (dto.getId() == dto.ADMIN) {
									%><a> <span class="fa fa-ban"></span></a> <%
 								} else {
									 %><a href="RoleCtl?id=<%=dto.getId()%>"> <span
										class="fa fa-edit"></span></a> <%
 										}
									 %>
								</td>


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
									value="<%=RoleListCtl.OP_PREVIOUS%>"
									<%=(pageNo == 1) ? "disabled" : ""%> class="btn btn-light">
									<span class="fa fa-chevron-left"></span>
									<%=RoleListCtl.OP_PREVIOUS%>
								</button>
							</td>

							<td align="right">
								<button type="submit" style="font-size: 13px" name="operation"
									value="<%=RoleListCtl.OP_NEXT%>"
									<%=(list.size() < pageSize) ? "disabled" : ""%>
									class="btn btn-light">
									<%=RoleListCtl.OP_NEXT%>
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
<%@include file="Footer.jsp"%>
</html>