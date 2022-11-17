<%@page import="com.example.TicketBooking.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<html>
<head>
<title>Admin Dashboard</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
<!-- Custom fonts for this template-->
<link href="/css/all.css" rel="stylesheet" type="text/css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="/img/fifalogo.png" />
<script src="/js/jquery-3.4.1.js" type="text/javascript"></script>
<script src="/js/bootstrap.js" type="text/javascript"></script>
<script src="/js/datatables.js" type="text/javascript"></script>
<script src="/js/validation.js" type="text/javascript"></script>
<style>
.list-group-item {
	padding: 8px;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	response.sendRedirect("index.jsp");
	%>

	<c:if test="${user eq null}">
		<jsp:forward page="error.jsp" />
	</c:if>




	<%
	String url = new UrlPathHelper().getOriginatingRequestUri(request);
	%>
	<c:set var="url" value="<%=url%>" scope="page"></c:set>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 p-0" style="min-height: 100vh;">
				<img src="/img/fifalogo.png" class="img-fluid img-thumbnail">
				<div class="list-group">
					<a href="/dashboard" id="targeted"
						class="list-group-item list-group-item-action <%=url.equals("/matchdetails") ? "active" : ""%>">Dashboard</a>
					<a href="/stadium"
						class="list-group-item list-group-item-action <%=url.equals("/stadium") ? "active" : ""%>">Stadium</a>
					<a href="/matches"
						class="list-group-item list-group-item-action <%=url.equals("/matches") ? "active" : ""%>">Matches</a>
					<a href="/category"
						class="list-group-item list-group-item-action <%=url.equals("/category") ? "active" : ""%>">Category</a>
					<a href="/team"
						class="list-group-item list-group-item-action <%=url.equals("/team") ? "active" : ""%>">Teams</a>
					<a href="/matchdetails"
						class="list-group-item list-group-item-action <%=url.equals("/matchdetails") ? "active" : ""%>">Match
						Details</a>
						<a href="/application"
						class="list-group-item list-group-item-action <%=url.equals("/application") ? "active" : ""%>">Applications
						</a> <a href="/adminChngPwd"
						class="list-group-item list-group-item-action <%=url.equals("/adminChngPwd") ? "active" : ""%>">Change
						Password</a> <a href="/logout"
						class="list-group-item list-group-item-action <%=url.equals("/logout") ? "active" : ""%>">Log
						Out</a>
				</div>
			</div>
			<div class="col-sm-10 p-0">
				<div class="container-fluid" style="min-height: 99vh;">
					<div class="card shadow" style="min-height: 99vh;">
						<div class="card-body">

							<script type="text/javascript">
								if (!!window.performance
										&& window.performance.navigation.type === 2) {
									console.log('Reloading');
									window.location.reload();
								}
							</script>