<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="A Team">
<title>Ticket</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel = "icon" href = "/img/fifalogo.png" type = "image/x-icon">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	crossorigin="anonymous"></script>



<style>
.card {
	margin-bottom: 1.5rem
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #c8ced3;
	border-radius: .25rem
}

.card-header:first-child {
	border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0
}

.card-header {
	padding: .75rem 1.25rem;
	margin-bottom: 0;
	background-color: #f0f3f5;
	border-bottom: 1px solid #c8ced3
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div id="ui-view" data-select2-id="ui-view">
			<div>
				<div class="card">
					<div class="card-header">
						FIFA WORLD CUP MATCH TICKET <strong>${ticket.no}</strong> <a
							class="btn btn-sm btn-secondary float-right mr-1 d-print-none"
							href="#" onclick="javascript:window.print();" data-abc="true">
							<i class="fa fa-print"></i> Print
						</a>
					</div>
					<div class="card-body">
						<div class="row mb-4">
							<div class="col-sm-4">
								<div>
									<strong>${application.user.fname} &nbsp; ${application.user.lname}</strong>
								</div>
								<div>Email: ${application.user.email} </div>
								<div>Phone: ${application.user.mob}</div>
							</div>
							<div class="col-sm-4">
								
							</div>
							<div class="col-sm-4">
								<h6 class="mb-3">Details:</h6>
								<div>
									<strong>Ticket No: ${ticket.no}</strong>
								</div>
								<div>Issued At : ${ticket.created_at}</div>
								<div>Match Schedule : ${match[1]}</div>
								<div>Stadium : ${match[2]}</div>
								<div>
									<strong>${match[3]}</strong>
								</div>
							</div>
						</div>
						<div class="table-responsive-sm">
							<table class="table table-striped">
								<thead>
									<tr>
										
										<th>Name</th>
										<th>Age</th>
										<th class="center">Category</th>
										<th class="right">Block No.</th>
										<th class="right">Seat No.</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${buyers}" var="buyers" varStatus="loop">
									<tr>
							
										<td class="left">${buyers.name}</td>
										<td class="left">${buyers.age}</td>
										<td class="center">${application.category.name}</td>
										<td class="right">B${application.block.id}</td>
										<td class="right">${buyers.seat_no}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row" style="margin-right: 5px; float: right;" >
							
							
								<a class="btn btn-success" href="/tickets/TicketApplication" data-abc="true"> <i
									class="fa fa-usd"  style="float: left; position: relative; margin-left: 10px"></i>Back
								</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>