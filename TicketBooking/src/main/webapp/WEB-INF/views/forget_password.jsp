<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="uheader.jsp"></jsp:include>
	<main>
		<form class="login">
			<h1>Forget Password</h1>
			<div class="inset">
				<p class="email_forget">
					<label for="email">EMAIL ADDRESS</label> <input type="text"
						name="email" id="email">
				</p>
				<p>
					<a href="#" class="sendotp">Send OTP</a>
				</p>
				<p class="otp_forget">
					<label for="password">ONE TIME PASSWORD</label> <input
						type="password" name="password" id="password">
				</p>
			</div>
			<p class="p-container submit_forget">
				<input type="submit" name="go" id="go" value="Submit">
			</p>
		</form>
	</main>
	<footer class="text-center  text-uppercase py-5 footer_login">
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

