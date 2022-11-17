<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<h5 class="p-2" style="border-bottom: 2px solid green;">CATEGORY</h5>
<div class="row">
	<div class="col-sm-7">
		<table class="table">
			<thead>
				<tr>
					<th>Category Id</th>
					<th>Category Name</th>
					<th>Price</th>
					<th>Update</th>
				
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cat}" var="st">
					<tr>
						<td>${st.id}</td>
						<td>${st.name}</td>
						<td>${st.price}</td>
						<td><a href="/category/${st.id}"
							class="btn btn-warning btn-sm">EDIT</a></td>
						<%-- <td><a href="/category/delete/${st.id}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Please check Applications, to ensure any any application is assoicated with this category or not ?')">DELETE</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-sm-5">
		<form action="/category" method="post">
			<div class="form-group">
				<c:if test="${id ne null}">
			<label>Category Id</label>
				 <input type="text" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: black;">
			</c:if>
			<c:if test="${id eq null}">
			 <input type="hidden" name="id"  value="${id}"
					class="form-control" readonly="readonly" id = "t_id" style = "color: red;" disabled="disabled">
			</c:if>
			</div>
			<div>
				<label>Category Name</label> <input type="text" name="name"
					value="${name}" class="form-control" required>
			</div>
			<div>
				<label>Price</label> <input type="text" name="price"
					value="${price}" class="form-control" required>
			</div>
			<br> <input type="submit" value="SAVE" class="btn btn-primary">
		</form>
	</div>
	</body>
	</html>