<%@page import="in.co.rays.proj3.controller.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Title</title>
<!-- Select All Library -->
<%-- <script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
 --%>
<!-- font-awesome library -->
<style type="text/css">
@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css)
	;

body {
	background-image: url("img/photo-1477346611705-65d1883cee1e.jfif");
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

.darken-grey-text {
	color: #2E2E2E;
}

.danger-text {
	color: #ff3547;
}

.default-text {
	color: #2BBBAD;
}

.info-text {
	color: #33b5e5;
}

.form-white .md-form label {
	color: #fff;
}

.paddingclass {
	padding-top: 10px;
}
</style>

<style type="text/css">
.setForm {
	padding-top: 5%;
	padding-left: 25%;
	width: 130%
}

.button {
	border-radius: 5px;
	width: 100px;
	padding: 5px;
	color: white;
	font-size: 20px;
	background-color: #00cc88
}

.fonta {
	font-size: 20px;
}
</style>
<!-- <script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script> -->
<style type="text/css">
.header {
	padding-top: -3% color: white;
	text-shadow: 2px 2px #000000;
}
</style>

</head>
<body>
	<div>
		<%@include file="Header1.jsp"%>
	</div>
	
	<form action="<%=ORSView.WELCOME_CTL%>">

		<div class="container-fluid">
			<h1 style="padding: 90px">
				<h1 align="Center">

					<!-- <img src="img/Logo.jpg" width="318" height="127" border="0"> -->
					<center>
						<h1 style="color: white;" class="header">Welcome To ORS</h1>
					</center>
				</h1>
		</div>
	</form>
	<%@include file="Footer.jsp"%>
</body>