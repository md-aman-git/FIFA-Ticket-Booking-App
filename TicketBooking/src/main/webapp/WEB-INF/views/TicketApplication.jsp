<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Application</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/option_match.css">
<link rel="stylesheet" href="/css/main.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	<link rel = "icon" href = "/img/fifalogo.png" type = "image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap"
	rel="stylesheet">
<style type="text/css">
table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	margin-left: 150px;
	padding: 0;
	width: 80%;
	table-layout: fixed;
}

table caption {
	font-size: 1.5em;
	margin: .5em 0 .75em;
}

table tr {
	background-color: #f8f8f8;
	border: 1px solid #ddd;
	padding: 1.35em;
	color: black;
	size: 15px;
}

table th, table td {
	padding: .625em;
	text-align: center;
	font-size: medium;
}

table th {
	font-size: 1.50em;
	letter-spacing: .1em;
	text-transform: uppercase;
}

@media screen and (max-width: 400px) {
	table {
		border: 0;
	}
	table caption {
		font-size: 3.3em;
	}
	table thead {
		border: none;
		clip: rect(0, 0, 0, 0);
		height: 1px;
		margin: -1px;
		overflow: hidden;
		padding: 0;
		position: absolute;
		width: 1px;
	}
	table tr {
		border-bottom: 3px solid #ddd;
		display: block;
		margin-bottom: .625em;
	}
	table td {
		border-bottom: 1px solid #ddd;
		display: block;
		font-size: .8em;
		text-align: right;
	}
	table td::before {
		/*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
		content: attr(data-label);
		float: left;
		font-weight: bold;
		text-transform: uppercase;
	}
	table td:last-child {
		border-bottom: 0;
	}
}
</style>

</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example"
	data-bs-offset="82">
	<header id="home">
		<nav id="#navbar"
			class="navbar navbar-expand-lg position-fixed top-0 w-100 py-3">
			<div class="container">
				<a class="navbar-brand" href="/index"><img src="/img/fifab.png"
					alt="" class="logo"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav ms-auto">
						<a class="nav-link active" href="/">home</a> <a class="nav-link"
							href="#about">about</a> 
						<a class="nav-link" href="/tickets/ticketsDashboard">tickets</a>
						<c:choose>
							<c:when test="${sessionScope.user.fname ne null }">
								<li><a class="nav-link" href="/updatePassword">&nbsp;
										CHANGE PASSWORD</a></li>
								<li><a class="nav-link" href="/logout">&nbsp; LOGOUT</a></li>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/login">LOGIN</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<c:if test="${user eq null}">
		<jsp:forward page="login.jsp" />
	</c:if>

	<div style="position: relative; margin-top: 200px">
		<form method="post">
			<table>
				<thead>
					<tr>
						<th scope="col">Application No.</th>
						<th scope="col">Submission Date</th>
						<th scope="col">Status</th>
						<th scope="col">Details</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<tbody>


					<c:forEach items="${list}" var="t">
						<tr>
							<td>${t.no}</td>
							<td>${t.created_at}</td>
							<td>${t.status}</td>
							<c:choose>
								<c:when test="${(t.status)!='Completed'}">
									<td><a href="/tickets/viewApplications/${t.id}"
										class="btn btn-sm btn-primary" style="width: 60%"><i class="fa fa-eye"></i>Show
											Details</a></td>
									<c:if test="${(t.status)=='InProgress'}">
										<td><button class="btn btn-sm btn-success"
												disabled="disabled">PAY</button></td>
										<%-- <td><a href="/tickets/payment/${t.id}"
											class="btn btn-sm btn-success"><i class="fa fa-eye"></i>Pay</a></td>
											 --%>

									</c:if>
									<c:if test="${(t.status)=='Rejected'}">
										<td><button class="btn btn-sm btn-success"
												disabled="disabled">PAY</button></td>
										<%-- <td><a href="/tickets/payment/${t.id}"
											class="btn btn-sm btn-success"><i class="fa fa-eye"></i>Pay</a></td>
											 --%>

									</c:if>
									<c:if test="${ (t.status)=='Payment Pending'}">
										<%-- <td><input formaction="/tickets/payment/${t.id}"
											class="btn btn-success" style="float: right;" type="button"
											name="go1" id="go1" value="Submit"></td> --%>
										<td><button formmethod="get"
												formaction="/tickets/payment/${t.id}"
												class="btn btn-sm btn-success">PAY</button></td>
									</c:if>
								</c:when>

								<c:otherwise>
									<td><a href="/tickets/viewTicket/${t.id}"
										class="btn btn-sm btn-primary" style="width: 60%"><i class="fa fa-eye"></i>View
											Ticket</a></td>
									<td>
										<button class="btn btn-sm btn-success" disabled="disabled">
											PAY</button>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</form>
		<a
			style="margin-right: 155px; margin-top: 40px; float: right; border-color: #ffc107; font-weight: 600;"
			href="/tickets/ticketsDashboard" class="btn btn-secondary">BACK</a>
	</div>