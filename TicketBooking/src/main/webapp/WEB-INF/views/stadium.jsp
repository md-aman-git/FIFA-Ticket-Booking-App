<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<h5 class="p-2" style="border-bottom: 2px solid green;">STADIUM</h5>
<script type="text/javascript">
function checkI (){
var id = document.getElemetById('id');
if(id<50){
	alert("min 50");
	return;
}
}
</script>
<div class="row">
	<div class="col-sm-7">
		<table class="table">
			<thead>
				<tr>
					<th>Stadium Id</th>
					<th>Stadium Name</th>
					<th>Capacity</th>
					<th>Update</th>
					<th>Delete</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${std}" var="st">
					<tr>
						<td>${st.id}</td>
						<td>${st.stdname}</td>
						<td>${st.capacity}</td>
						<td><a href="/stadium/${st.id}"
							class="btn btn-warning btn-sm">EDIT</a></td>
						 <td><a href="/stadium/delete/${st.id}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Caution !! This Stadium will not be available for scheduling future matches')">DELETE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-sm-5">
		<form action="/stadium" method="post">
			<div class="form-group">
				<c:if test="${id ne null}">
			<label>Stadium Id</label>
				 <input type="text" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: black;">
			</c:if>
			<c:if test="${id eq null}">
			 <input type="hidden" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: red;" disabled="disabled">
			</c:if>
			</div>
			<div>
				<label>Stadium Name</label> <input type="text" name="stdname"
					value="${stdname}" class="form-control" required>
			</div>
			<div>
				<label>Capacity</label> <input type="text" name="capacity"
					value="${capacity}" class="form-control" required>
			</div>
			<br> <input type="submit" value="SAVE" class="btn btn-primary" onclick="checkI()">
		</form>
	</div>
	</body>
	</html>