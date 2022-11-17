<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="header.jsp"></jsp:include>
<h5 class="p-2" style="border-bottom: 2px solid green;">MATCH
	DETAILS</h5>
<div class="row">
	<div class="col-sm-7">
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Match Id</th>
					<th>Schedule</th>
					<th>Team Id</th>
					<th>Team Name</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${matd}" var="st">
					<tr>
						<td>${st.id}</td>
						<td>${st.matches.id}</td>
						<td>${st.matches.schedule}</td>
						<td>${st.team.id}</td>
						<td>${st.team.name}</td>
						<td><a href="/matchdetails/delete/${st.id}"
							class="btn btn-danger btn-sm">DELETE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-sm-5">
		<form action="/matchdetails" method="post">
			<div class="form-group">
				<c:if test="${id ne null}">
			<label>Match Details Id</label>
				 <input type="text" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: black;">
			</c:if>
			<c:if test="${id eq null}">
			 <input type="hidden" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: red;" disabled="disabled">
			</c:if>
			</div>
			<div class="form-group">
				<label>AVAILABLE MATCHES</label> <select name="matches"
					class="form-control">
					<option value="">Select Match</option>
					<c:forEach items="${match}" var="matches">
						<option value="${matches.id}"
							<c:if test="${matches.id eq matchid}">selected="selected"</c:if>>
							${matches.id} ${matches.schedule}</option>

						<!--<option value="${matches.id}">${matches.id} ${matches.schedule}</option>-->
					</c:forEach>
				</select>
			</div>


			<div>
				<label>AVAILABLE TEAMS</label><select name="team"
					class="form-control">
					<option value="">Select Team</option>
					<c:forEach items="${team}" var="team">

						<option value="${team.id}"
							<c:if test="${team.id eq teamid}">selected="selected"</c:if>>
							${team.id} - ${team.name}</option>

						<!--<option value="${stadium.id}">${stadium.id}</option>-->
					</c:forEach>
				</select>
			</div>
			<br> <input type="submit" value="SAVE" class="btn btn-primary">
		</form>
	</div>
	</body>
	</html>