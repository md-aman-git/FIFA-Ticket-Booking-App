<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>APPLICATION SUMMARY</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style type="text/css">
.container {
	width: 750px;
	margin: 100px auto;
	padding: 10px;
	background: #fff;
}
td, tr, th, thead {
padding: 5px;
}
</style>
<c:if test="${user eq null}">
		<jsp:forward page="login.jsp" />
</c:if>
<c:if test="${user ne null && (user.role.id)==1}">
		<jsp:forward page="error.jsp" />
</c:if>
</head>
<body style="background-image: url('/img/football.jpg');">
	<div class="container">
		<div class="invoice-container" ref="document" id="html">
			<table style="width: 100%; height: auto;">
				<thead style="background: #fafafa;">
					<tr style="font-size: 20px;">
						<td colspan="4"">FIFA
							CLUB</td>
					</tr>
				</thead>
				<tbody style="background: #fff;">
					<tr">
						<td colspan="4"
							style="font-size: 16px; font-weight: bold; color: #000;">Hello,
							${name}</td>
						<td colspan="4">  </td>
					</tr>
					<br>
					<br>
					<tr>
						<td colspan="4"
							style="text-align: left; font-weight: bold; font-size: 14px;">Your
							Application details</td>
					</tr>
					<tr>
						<td colspan="4"
							style="text-align: left; font-size: 14px; color: #c61932">
						MATCH - SCHEDULE : ${match[1]} &nbsp; &nbsp;STADIUM - ${match[2]} &nbsp; &nbsp;TEAMS - ${match[3]} 
							</td>
					</tr>
				</tbody>
			</table>
			<table style="width: 100%; height: auto; background-color: #fff; text-align: center; background: #fafafa">
				<tbody>
					<tr style="color: #6c757d; font-size: 20px;">
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-size: 12px; font-weight: 700; ">Submission
							Date</td>
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-size: 12px; font-weight: 700; ">Application
							No.</td>
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-size: 12px; font-weight: 700;">Status</td>
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-size: 12px; font-weight: 700;">Quantity</td>
						<td
							style="width: 25%; font-size: 12px; font-weight: 700;"></td>
					</tr>
					<tr
						style="background-color: #fff; font-size: 12px; color: #262626;">
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-weight: bold; background: #fafafa;">${application.created_at}</td>
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-weight: bold; background: #fafafa;">${number}0${application.id}</td>
						<td
							style="border-right: 1.5px dashed #DCDCDC; width: 25%; font-weight: bold; background: #fafafa;">${application.status}</td>
						<td style="width: 25%; font-weight: bold; background: #fafafa;">${quantity}</td>
					</tr>
				</tbody>
				</table>
				<table class="table" style="padding-top: 30px; background-color: white; color: black;">
					<thead>
						<tr style="margin-top: 20px;">
							<th>Name</th>
							<th>Age</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${names}" var="st" varStatus="loop">
						<tr>
						
							<td>${st}</td>
							<td>${ages[loop.index]}</td>
							<td>${application.category.price}</td>
						
						</tr>
						</c:forEach>
					</tbody>
				</table>
			
			<table
				style="width: 100%; height: auto; background-color: #fff; padding: 0px; font-size: 12px; border: 1px solid #ebebeb; border-top: 0">
				<tbody>
					<tr style="padding: 20px; color: #000; font-size: 15px">
						<td style="font-weight: bold; padding: 5px 0px">Total</td>
						<td
							style="text-align: right; padding: 5px 0px; font-weight: bold; font-size: 16px;">${cost}
							&euro;</td>
					</tr>

					<tr>
						<td colspan="2" style="font-weight: bold;"><span
							style="color: #c61932; font-weight: bold;">THANK YOU</span> for
							booking ticket</td>
					</tr>

				</tbody>
				<tfoot style="padding-top: 20px; font-weight: bold;">
					<tr>
						<td style="padding-top: 20px;">Need help? Contact us <span
							style="color: #c61932"> dummyfifaclub@gmail.com </span></td>
					</tr>
				</tfoot>
			</table>
			<a style="margin-top: 20px" class="btn btn-primary" href="/tickets/ticketsDashboard"
				role="button">BACK</a>
		</div>
	</div>
</body>
</html>