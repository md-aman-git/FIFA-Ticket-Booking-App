<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="uheader.jsp"></jsp:include>
<main>
	<form class="login" action="/login" method="post"
		style="margin-bottom: 100px;">
		<h1>Log in</h1>
		<div class="inset">
			<p>
				<label for="email">EMAIL ADDRESS</label> <input type="text"
					name="email" id="email" required>
			</p>
			<p>
				<label for="pwd">PASSWORD</label> <input type="password" name="pwd"
					id="pwd" required>
			</p>

			<p style="font: italic; color: white">${msg}</p>
		</div>
		<p class="p-container">
			<input type="submit" name="go" id="go" value="Log in">
		</p>
		<a href="/fpwd" class="login_forget"> <span>Forgot password
				?</span>
		</a> <a href="/signup" class="login_forget">New User ? Click here to
			Register Account</a>

	</form>
</main>
<jsp:include page="footer.jsp"></jsp:include>