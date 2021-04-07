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
<title>User List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	<jsp:useBean id="dto" scope="request"
		class="in.co.rays.proj3.DTO.UserDTO" />
	<form action="<%=ORSView.USER_LIST_CTL%>" method="post">
		<div class="container-fluid">

			<div class="card"
				style="background-color: #0080ff82; margin-bottom: 40px; margin-top: 30px">

				<div class="card-body bg-dark">

					<div align="center">
						<H3 style="color: white">
							<b>User List</b>
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
						System.out.println(list);
						if (list.size() == 0) {
					%>
					<table align="center">
						<tr>
							<td>

								<button type="submit" name="operation"
									class=" form-control btn btn-success"
									value="<%=UserListCtl.OP_BACK%>"
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
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!--  <label class="form-check-label" for="check2" style = "max-width:72px"> -->

						<i style="color: white"><b>First Name:</b></i>&nbsp;
						<div class="col-sm-2">
							<input placeholder="Enter First Name"
								style="background-color: white" type="text" name="firstName"
								class="border"
								value="<%=ServletUtility.getParameter("firstName", request)%>">

						</div>
						&emsp;&nbsp; <i style="color: white"><b>Role :</b></i>&nbsp;
						<%
							List roleList = (List) request.getAttribute("roleList");
						%>

						<div class="col-sm-2"><%=HTMLUtility.getList("roleId", String.valueOf(request.getParameter("roleId")), roleList)%>
						</div>
						&emsp;&nbsp;&nbsp; <i style="color: white"> <b>Login Id :</b></i>&nbsp;
						<div class="col-sm-2">
							<input placeholder="Enter Your Login Id"
								style="background-color: white" type="text" name="loginId"
								class="border"
								value="<%=ServletUtility.getParameter("loginId", request)%>">


						</div>
						&nbsp;&nbsp;

						<div class="col-sm-2 pl-4" style="max-width: 140px">
							<button type="submit" name="operation"
								class=" form-control btn btn-success" style="font-size: 13px"
								value="<%=UserListCtl.OP_SEARCH%>">
								<span class="fa fa-search"></span> Search
							</button>
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="col-sm-2 pl-1" style="max-width: 100px">
							<button type="submit" name="operation"
								class=" form-control btn btn-warning" style="font-size: 13px"
								value="<%=UserListCtl.OP_RESET%>">
								<span class="fa fa-refresh"></span>Reset
							</button>
						</div>

						<div class="col-sm-2"></div>
					</div>
					<br>

					<div class="row no-gutters">
						<button type="submit" style="font-size: 13px" name="operation"
							value="<%=UserListCtl.OP_NEW%>" class="btn btn-success">
							<span class="fas fa-plus-square"></span>
							<%=UserListCtl.OP_NEW%>
						</button>
						<div class="ml-auto">
							<button type="submit" style="font-size: 13px" name="operation"
								value="<%=UserListCtl.OP_DELETE%>" class="btn btn-danger">
								<span class="fa fa-trash"></span>
								<%=UserListCtl.OP_DELETE%>
							</button>
						</div>
					</div>
					<br>
					<%
						List list1 = (List) request.getAttribute("roleList");
					%>


					<%
						int pageNo = ServletUtility.getPageNo(request);
							int pageSize = ServletUtility.getPageSize(request);
							int index = ((pageNo - 1) * pageSize)
									+ 1;/* 
										int nextPageSize = DataUtility.getInt(request.getAttribute("nextList").toString()); */
							RoleDTO rbean1 = new RoleDTO();
							RoleModelInt rmodel = ModelFactory.getInstance().getRoleModel();

							Iterator<UserDTO> it = list.iterator();
							if (list.size() != 0) {
					%>


					<table class="table table-light table-striped" border="2">
						<thead>
							<tr align="center" style="background-color: #FFE4C4">
								<th><input type="checkbox" id="select_all" name="select"><strong>
										Select All</strong></th>
								<th><strong>S.NO</strong></th>
								<th><strong>FirstName</strong></th>
								<th><strong>LastName</strong></th>
								<th><strong>Role</strong></th>
								<th><strong>LoginId</strong></th>
								<th><strong>Gender</strong></th>
								<th><strong>MobileNo</strong></th>
								<th><strong>DOB</strong></th>
								<th><strong>Edit</strong></th>
							</tr>
						</thead>
						<%
							while (it.hasNext()) {
										dto = it.next();

										RoleDTO rbean = rmodel.findByPK(dto.getRoleId());
										System.out.println(rbean.getName());
										System.out.println(dto.getRoleId());
						%>
						<tbody>
							<tr align="center">
								<td align="center"><input type="checkbox" class="checkbox"
									name="ids" value="<%=dto.getId()%>"
									<%if (dto.getRoleId() == RoleDTO.ADMIN) {%> <%="disabled"%>
									<%}%>></td>
								<td class="text"><%=index++%></td>
								<td class="text"><%=dto.getFirstName()%></td>
								<td class="text"><%=dto.getLastName()%></td>
								<td class="text"><%=rbean.getName()%></td>
								<td class="text"><%=dto.getLogin()%></td>
								<td class="text"><%=dto.getGender()%></td>
								<td class="text"><%=dto.getMobileNo()%></td>
								<td class="text"><%=DataUtility.getDateString(dto.getDob())%></td>
								<td class="text"><a href="UserCtl?id=<%=dto.getId()%>"
									<%if (dto.getRoleId() == RoleDTO.ADMIN) {%>
									onclick="return false;"<a><span class="fa fa-ban text-danger"></span></a>
									<%} else {%>><span
										class="fa fa-edit"></span></a></td>
								<%
									}
								%>
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
									value="<%=UserListCtl.OP_PREVIOUS%>"
									<%=(pageNo == 1) ? "disabled" : ""%> class="btn btn-light">
									<span class="fa fa-chevron-left"></span>
									<%=UserListCtl.OP_PREVIOUS%>
								</button>
							</td>

							<td align="right">
								<button type="submit" style="font-size: 13px" name="operation"
									value="<%=UserListCtl.OP_NEXT%>"
									<%=(list.size() < pageSize) ? "disabled" : ""%>
									class="btn btn-light">
									<%=UserListCtl.OP_NEXT%>
									<span class="fa fa-chevron-right"></span>
								</button>

							</td>
						</tr>
					</table>

					<%
						}
					%>

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