<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<head>
<link rel="stylesheet" href="/css/bootstrap.css">
<style type="text/css">
table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	margin: 0;
	padding: 0;
	width: 100%;
	table-layout: fixed;
}

table caption {
	font-size: 1.5em;
	margin: .5em 0 .75em;
}

table tr {
	background-color: #f8f8f8;
	border: 1px solid #ddd;
	padding: .35em;
}

table th, table td {
	padding: .625em;
	text-align: center;
}

table th {
	font-size: .85em;
	letter-spacing: .1em;
	text-transform: uppercase;
}

@media screen and (max-width: 600px) {
	table {
		border: 0;
	}
	table caption {
		font-size: 1.3em;
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

/* general styling */
body {
	font-family: "Open Sans", sans-serif;
	line-height: 1.25;
}
</style>
<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>




	<table>
		<thead>
			<tr>
				<th scope="col">Match Id</th>
				<th scope="col">Match Schedule</th>
				<th scope="col">Stadium Name</th>
				<th scope="col">Match Name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="t">
				<div class="dropdown-content">
					<tr>
						<td>${t[0]}</td>
						<td>${t[1]}</td>
						<td>${t[2]}</td>
						<td>${t[3]}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<br>
		<hr>
		<br>

		<center>
			<div class="dropdown">



				<label>AVAILABLE MATCHES</label><select name="matches">



					<option value="">Select Match</option>
					<option value="">Schedule&ensp;&ensp; &ensp;&ensp;
						Stadium&ensp;&ensp; &ensp;&ensp; Teams</option>
					<div class="dropdown-content">
						<c:forEach items="${list}" var="t">
							<option value="${t[0]}">&ensp;&ensp;${t[1]}&ensp;&ensp;
								&ensp;&ensp;&ensp;&ensp; ${t[2]}&ensp;&ensp; &ensp;&ensp;
								${t[3]}</option>
						</c:forEach>
					</div>
				</select>
			</div>
		</center>
	</div>



	<form method="post" action="/tickets/applytickets">
		<INPUT TYPE="radio" name="command" value="0" />Run <INPUT
			TYPE="radio" NAME="command" VALUE="1" />Walk <INPUT TYPE="submit"
			VALUE="submit" />
	</form>
</body>



</html>