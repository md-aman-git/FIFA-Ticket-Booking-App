<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="uheader.jsp"></jsp:include>
<div class="login_div">
	<%-- <form action="/updatePassword" , method="post">
<p style="">Provide your new password here</p>
<span class="fas fa-lock my_icon"></span> <input type="password"
placeholder="New Password" name="pwd" class="user_email" required>
<span class="fas fa-lock my_icon"></span> <input type="password"
placeholder="Confirm Password" name="conf_pass" class="user_pass"
required> <input type="submit" value="Submit" name="submit"
class="btn_submit">
<h6><p>${msg}</p></h6>
</form> --%>
	<form class="login" action="/updatePassword" method="post"
		onSubmit="return checkPassword(this)">
		<h1>Update your password</h1>
		<div class="inset">
			<p>
				<label for="pwd">PASSWORD</label> <input type="password" name="pwd"
					id="pwd" required>
			</p>
			<p>
				<label for="confirm_password">CONFIRM PASSWORD</label> <input
					type="password" name="conf_pass" id="conf_pass" required>
			</p>
		</div>



		<input type="submit" name="submit" id="submit" value="Update Password"
			class="update_pass">
		<h6>
			<p>${msg}</p>
		</h6>
	</form>
</div>
<script>
	function checkPassword(form) {
		password1 = form.pwd.value;
		password2 = form.conf_pass.value;

		// If password not entered
		if (password1 == '')
			alert("Please enter Password");

		// If confirm password not entered
		else if (password2 == '')
			alert("Please enter confirm password");

		// If Not same return False.
		else if (password1 != password2) {
			alert("\nConfirm Password did not match: Please try again...")
			return false;
		}
	}
</script>
<jsp:include page="footer.jsp"></jsp:include>