<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="header.jsp"></jsp:include>
<h5 class="p-2" style="border-bottom: 2px solid green;">MATCHES</h5>
<div class="row">
	<div class="col-sm-7">
		<table class="table">
			<thead>
				<tr>
					<th>Match Id</th>
					<th>Stadium(Id - Name)</th>
					<th>Timing</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mat}" var="ma">
					<tr>
						<td>${ma.id}</td>
						<td>${ma.stadium.id}-${ma.stadium.stdname}</td>
						<td>${ma.schedule}</td>
						<td><a href="/matches/${ma.id}"
							class="btn btn-warning btn-sm">EDIT</a></td>
						 <td><a href="/matches/delete/${ma.id}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Caution !! After Deleting This Match it will not be mapped with any team')">DELETE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-sm-5">
		<form action="/matches" method="post">
			<div class="form-group">
				<c:if test="${id ne null}">
					<label>Matches Id</label>
					<input type="text" name="id" value="${id}" class="form-control"
						readonly="readonly" id="t_id" style="color: black;">
				</c:if>
				<c:if test="${id eq null}">
					<input type="hidden" name="id" value="${id}" class="form-control"
						readonly="readonly" id="t_id" style="color: red;"
						disabled="disabled">
				</c:if>
			</div>

			<div class="form-group">
				<label>AVAILABLE STADIUMS </label><select name="stadium"
					class="form-control" required="required">
					<option value="">Select Stadium</option>
					<c:forEach items="${stadium}" var="stadium">
						<option value="${stadium.id}"
							<c:if test="${stadium.id eq stdid}">selected="selected"</c:if>>
							${stadium.id} - ${stadium.stdname}</option>
						<!--<option value="${stadium.id}">${stadium.id}</option>-->
					</c:forEach>
				</select>

			</div>
			<div class="form-group">
				<label>Timing</label> <input type="text" name="schedule"
					value="${schedule}" class="form-control">
			</div>
			<input type="submit" value="SAVE" class="btn btn-primary">
		</form>
	</div>