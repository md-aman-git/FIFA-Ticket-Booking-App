<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<jsp:include page="uheader.jsp"></jsp:include>
<main>
	<form class="login" method="post">
		<h1>Forget Password</h1>
		<div class="inset">
			<c:choose>



				<c:when test="${(sessionScope.temp_email) eq null}">
					<p class="email_forget">
						<label for="email">EMAIL ADDRESS</label> <input type="text"
							name="email" id="email">
					</p>
					<p>
						<input formaction="/otp" type="submit" name="otp" id="otp"
							value="Send OTP"> <br>
					</p>
					<p class="otp_forget" style="display: block;">
						<label for="password">ONE TIME PASSWORD</label> <input
							type="password" name="password" id="password" disabled="disabled">
						<br>
					</p>
					<p style="font: italic; color: white">${msg}</p>
					<input formaction="/fpwd" class="btn btn-success"
						style="float: right;" type="button" name="go1" id="go1"
						value="Submit" disabled="disabled">




				</c:when>
				<c:otherwise>
					<p class="email_forget">
						<label for="email">EMAIL ADDRESS</label> <input type="text"
							name="email" id="email" value="${sessionScope.temp_email}"
							disabled="disabled">
					</p>
					<p>
						<input formaction="/otp" type="submit" name="otp" id="otp"
							value="Send OTP" disabled="disabled">
					</p>
					<br>
					<p class="otp_forget" style="display: block;">
						<label for="password">ONE TIME PASSWORD</label> <input
							type="password" name="password" id="password">
					</p>
					<p style="font: italic; color: white">${msg}</p>
					<input formaction="/fpwd" formmethod="post" style="float: right;"
						type="submit" name="go" id="go" value="Submit">





				</c:otherwise>
			</c:choose>




		</div>
	</form>
	<%-- <form class="login" action="/fpwd" method="post">
<p class="otp_forget">
<label for="password">ONE TIME PASSWORD</label>
<input type="password" name="password" id="password" required="required">
</p>
<p style="font: italic; color: white">${msg}</p>
</div>
<p class="p-container submit_forget">
<input type="submit" name="go" id="go" value="Submit">
</p>
</form> --%>
</main>
<footer class="text-center text-uppercase py-5 footer_login">
	<div class="footer-icons ">
		<a href="https://www.facebook.com/fifa"><img
			src="/img/facebook-footer.svg" alt=""></a> <a
			href="https://www.instagram.com/easportsfifa/"><img
			src="/img/instagramm-footer.svg" alt=""></a> <a href="#"><img
			src="/img/pinterest-footer.svg" alt=""></a>
	</div>
	<div class="copyright pt-4 text-muted text-center">
		<p>
			&copy; 2022 FIFA WORLD CUP QATAR | Created by A Team</a>
		</p>
	</div>
</footer>
<div class="fb2022-copy">copyright @ all rights reserved</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<script src="/js/script.js"></script>
<!-- <script type="text/javascript">
let button = document.querySelector('.sendotp');
button.addEventListener('click',()=>{
document.querySelector('.sendotp').style.display='none';
document.querySelector('.otp_forget').style.display='block';
document.querySelector('.submit_forget').style.display='block';
});
</script> -->