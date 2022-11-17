<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<h5 class="p-2" style="border-bottom: 2px solid green;">TEAMS</h5>
<div class="row">
	<div class="col-sm-7">
		<table class="table">
			<thead>
				<tr>
					<th>Team Id</th>
					<th>Team Name</th>
					<th>Score</th>
					<th>Pool</th>
					<th>Level</th>
					<th>Update</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${team}" var="t">
					<tr>
						<td>${t.id}</td>
						<td>${t.name}</td>
						<td>${t.score}</td>
						<td>${t.pool}</td>
						<td>${t.level}</td>
						<td><a href="/team/${t.id}" class="btn btn-warning btn-sm" id = "edit">EDIT</a></td>
						<%-- <td><a href="/team/delete/${t.id}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Please check Match Deatils table first, to ensure any match details is associated with this team or not ?')">DELETE</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-sm-5">
		<form action="/team" method="post">
			<div class="form-group">
			<c:if test="${id ne null}">
			<label>Team Id</label>
				 <input type="text" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: black;">
			</c:if>
			<c:if test="${id eq null}">
			 <input type="hidden" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: red;" disabled="disabled">
			</c:if>
			</div>
			<div class="form-group">
				<label>Team Name</label> <input type="text" name="name"
					value="${name}" class="form-control" required="required">
			</div>
			<div class="form-group">
				<label>Score</label> <input type="text" name="score"
					value="${score}" required="required" class="form-control">
			</div>
			<div class="form-group">
				<label>Pool</label> <input type="text" name="pool" value="${pool}"
					class="form-control" required="required">
			</div>
			<div class="form-group">
				<label>Level</label> <input type="text" name="level"
					value="${level}" required="required" class="form-control">
			</div>
			<br> <input type="submit" value="SAVE" class="btn btn-primary">
		</form>
	</div>
	<script type="text/javascript">
		/* var edit = document.getElementById('edit');
		edit.addEventListener('click', ()=> {
			document.getElementById('t_id').style.color = "red";
		}); */
	</script>