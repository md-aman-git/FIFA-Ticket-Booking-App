<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="uheader.jsp"></jsp:include>
	<main>
		<form class="login" action="/signup" method="post" onsubmit="return checkPassword(this)">
			<h1>Sign Up</h1>
			<div class="inset">
				<p>
					<label for="email">EMAIL ADDRESS</label> <input type="email"
						name="email" id="email" required>
				</p>
				<p>
					<label for="pwd">PASSWORD</label> <input type="password" name="pwd"
						id="pwd" required>
				</p>
				<p>
					<label for="confirm_password">CONFIRM PASSWORD</label> <input
						type="password" name="confirm_password" id="password" required>
				</p>
				<p>
					<label for="first_name">FIRST NAME</label> <input type="text"
						name="fname" id="first_name" required>
				</p>
				<p>
					<label for="last_name">LAST NAME</label> <input type="text"
						name="lname" id="last_name" required>
				</p>
				<p>
					<label for="dob">DATE OF BIRTH</label> <input type="date"
						name="dob" id="dob" required>
				</p>
				<p>
					<label for="phone">PHONE NUMBER (EX: 91xxxxxxxxxx)</label> <input
						type="number" name="mob" id="phone" required maxlength="11" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required="required">
				</p>
			</div>

			<input type="submit" name="go" id="go" value="Sign up"> <br>


			<div class="alert">
				<c:choose>
					<c:when test="${sessionScope.message ne null }">
							${message}
							</c:when>
				</c:choose>
			</div>

		</form>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<div class="fb2022-copy">copyright @ all rights reserved</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script src="/js/script.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<!--<script type="text/javascript">
	$().ready(function(){

		   $('div.alert').delay(5500);
		   $('div.alert').hide(4000);
		});
	</script>
	-->
	<script type="text/javascript">
		$(function() {
			setTimeout(function() {
				$("div.alert").fadeOut(1500);
			}, 5000);
		});
	</script>

	<script>
	function checkPassword(form) {
		password1 = form.pwd.value;
		password2 = form.confirm_password.value;

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
	