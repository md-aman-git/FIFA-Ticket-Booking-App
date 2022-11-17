<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="header.jsp"></jsp:include>
<form action="/dashboard" method="get">
	<div class="container-fluid">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Dashboard</h5>
		<div class="row">
			<div class="col-sm-3">
				<a href="/stadium"
					class="btn w-100 text-left bg-warning p-2 text-white">
					<h4>${totalStadiums}</h4>
					<h5>Stadiums</h5>
				</a>
			</div>
			<div class="col-sm-3">
				<a href="/team" class="btn w-100 text-left bg-danger p-2 text-white">
					<h4>${totalTeams}</h4>
					<h5>Teams</h5>
				</a>
			</div>
			<div class="col-sm-3">
				<a href="/matches"
					class="btn w-100 text-left bg-warning p-2 text-white">
					<h4>${totalMatches}</h4>
					<h5>Matches</h5>
				</a>
			</div>
			<div class="col-sm-3">
				<a href="/application"
					class="btn w-100 text-left bg-danger p-2 text-white">
					<h4>${totalApplications}</h4>
					<h5>Applications</h5>
				</a>
			</div>
		</div>
	
	<br>
	<br>
	<c:if test="${stadium.size()>0}">
	<h5 class="p-2" style="border-bottom: 2px solid green; text-align: center;" >AVAILABLE SEATS STATUS</h5>
	<div class="row" style="display: block;">
		<div class="col-sm-7" style="margin: auto;display: block;">
			<table class="table" style="border: 1px solid #1d8e1d;" >
				<thead>
					<tr>
						<th>Stadium Id</th>
						<th>Stadium Name</th>
						<th>Capacity</th>

		
						<c:forEach items="${stadium.get(0).getBlocks()}" var="s">
							<th>${s.getValue().category.name}</th>
						</c:forEach>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stadium}" var="st">
						<tr>
							<td>${st.id}</td>
							<td>${st.stdname}</td>
							<td>${st.capacity}</td>
							<c:forEach items="${st.getBlocks()}" var="s">
								<td>${s.getValue().available_seats}/${s.getValue().seats}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</c:if>
	</div>
</form>
