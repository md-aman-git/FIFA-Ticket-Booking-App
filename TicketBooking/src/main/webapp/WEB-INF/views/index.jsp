<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="A Team">
<title>FIFA World CUP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/main.css">
<link rel="icon" href="/img/fifalogo.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/0e035b9984.js"
	crossorigin="anonymous"></script>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example"
	data-bs-offset="82">
	<header id="home">
		<nav id="#navbar"
			class="navbar navbar-expand-lg position-fixed top-0 w-100 py-3">
			<div class="container">
				<a class="navbar-brand" href="/index"><img src="/img/fifab.png"
					alt="" class="logo"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav ms-auto">
						<a class="nav-link active" href="/">home</a> <a class="nav-link"
							href="#about">about</a> <a class="nav-link"
							href="/tickets/ticketsDashboard">tickets</a>
						<c:choose>
							<c:when
								test="${sessionScope.user.fname ne null && (sessionScope.user.role.id)==2}">
								<li><a class="nav-link" href="/updatePassword">&nbsp;
										CHANGE PASSWORD</a></li>
								<li><a class="nav-link" href="/logout">&nbsp; LOGOUT</a></li>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/login">LOGIN</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<main>
		<section class="main-slider">
			<div class="hero-img">
				<!-- <div class="hero-bg"></div> -->
				<c:if test="${user.fname ne null && (sessionScope.user.role.id)==2}">
					<text align="right">
					<h6
						style="color: white; font-family: sans-serif; font-weight: bold; padding: 10px 30px 0 0;">HI
						!! ${user.fname}</h6>
					</text>
				</c:if>
				<div class="container">
					<div class="hero-text">
						<div class="welcome-text">
							<span class="big-text">WELCOME</span><span class="small-text">TO
								FIFA</span>
						</div>
						<p>FIFA World Cup Qatar 2022™.</p>
					</div>
				</div>
				<a href="#about"><i class="fas fa-chevron-down"></i></a>
			</div>
		</section>
		<section id="about" class="aboutus">
			<div class="container">
				<div class="row">
					<div class="right col-md-6">
						<div class="text-right">
							<p>FIFA World Cup Qatar 2022™.</p>
						</div>
					</div>
					<div class="left col-md-6">
						<div class="text-left">
							<h2 id="about_id" class="underscore">about us</h2>
							<p class="sup-header">FIFA exists to govern football and to
								develop the game around the world. Since 2016, the organisation
								has been fast evolving into a body that can more effectively
								serve our game for the benefit of the entire world.</p>
							<p class="">The new FIFA is modernising football to be
								global, accessible and inclusive in all aspects. Not just on one
								or two continents, but everywhere. Under our vision to make
								football truly global, we will help develop football everywhere
								so that there are at least 50 national teams and 50 clubs from
								all continents that can compete at a top competitive level.</p>
						</div>
						<a href="/tickets/ticketsDashboard" class="main-button">Let’s
							Book Tickets</a>
					</div>
				</div>
			</div>
			<div class="black-div"></div>
		</section>
	</main>
	<main id="contact_id">
		<div class="container">
			<div class="row mainmargin">
				<div class="col-md-8">
					<div class="contact-page">
						<h2 class="underscore mb-5">Please let us know if you have
							any questions</h2>
						<div class="line"></div>

						<div class="line"></div>
						<form id="contactForm">
							<!-- Name input -->
							<div class="mb-3">
								<input class="form-control" id="name" type="text"
									placeholder="Name *" data-sb-validations="required" />
								<div class="invalid-feedback" data-sb-feedback="name:required">Name
									is required.</div>
							</div>
							<!-- Email address input -->
							<div class="mb-3">
								<input class="form-control" id="emailAddress" type="email*"
									placeholder="Email Address *"
									data-sb-validations="required, email" />
								<div class="invalid-feedback"
									data-sb-feedback="emailAddress:required">Email Address is
									required.</div>
								<div class="invalid-feedback"
									data-sb-feedback="emailAddress:email">Email Address Email
									is not valid.</div>
							</div>
							<!-- Form submissions success message -->
							<div class="d-none" id="submitSuccessMessage">
								<div class="text-center mb-3">Form submission successful!</div>
							</div>
							<!-- Form submissions error message -->
							<div class="d-none" id="submitErrorMessage">
								<div class="text-center text-danger mb-3">Error sending
									message!</div>
							</div>
							<!-- Message input -->
							<div class="mb-3">
								<textarea class="form-control" id="contact" type="text"
									placeholder="Leave a Message" style="height: 10rem;"
									data-sb-validations="required"></textarea>
								<div class="invalid-feedback"
									data-sb-feedback="message:required">Message is required.</div>
							</div>
							<!-- Form submit button -->
							<div class="d-grid">
								<button class="main-button mt-0 disabled" id="submitButton"
									type="submit">Send message</button>
							</div>
						</form>
					</div>
				</div>
				<div class="sidebar col-md-4">
					<div class="recent-posts pt-5">
						<h4 class="mb-3">RECENT POSTS</h4>
						<div class="post-item">
							<a href="/blogs" class="post-title">Ten sustainability
								features of the FIFA Arab Cup Qatar 2022.</a>
							<div class="post-meta">
								<span><i class="far fa-user"></i> FIFA QATAR OFFICIAL</span><span><i
									class="far fa-calendar"></i> 25 02 2022</span><span><i
									class="far fa-comment-alt"></i> 2 comments</span>
							</div>
							<p class="post-content">One of the most important aspects of
								the FIFA Arab Cup Qatar 2022™ was the tournament’s commitment to
								sustainability...</p>
						</div>
						<div class="post-item">
							<a href="/blogs" class="post-title">FIFA and CAF Presidents
								attend Senegal stadium inauguration.</a>
							<div class="post-meta">
								<span><i class="far fa-user"></i> FIFA QATAR OFFICIAL</span><span><i
									class="far fa-calendar"></i> 25 02 2022</span><span><i
									class="far fa-comment-alt"></i> 5 comments</span>
							</div>
							<p class="post-content">FIFA President Gianni Infantino and
								CAF President Patrice Motsepe attended the official opening
								ceremony of Stade de Senegal...</p>
						</div>
						<div class="post-item">
							<a href="single-post.html" class="post-title">Stars shine as
								women's elite clash.</a>
							<div class="post-meta">
								<span><i class="far fa-user"></i> FIFA QATAR OFFICIAL</span><span><i
									class="far fa-calendar"></i> 25 02 2022</span><span><i
									class="far fa-comment-alt"></i> 3 comments</span>
							</div>
							<p class="post-content">The cream of international women’s
								football, including all eight of the 2019 FIFA Women’s World
								Cup™ quarter-finalists, has been...</p>
						</div>
						<a class="main-button" href="/blogs">View all posts</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="text-center  text-uppercase py-5">
		<div class="footer-icons ">
			<a href="https://www.facebook.com/fifa"><img
				src="img/facebook-footer.svg" alt=""></a> <a
				href="https://www.instagram.com/easportsfifa/"><img
				src="img/instagramm-footer.svg" alt=""></a> <a href="#"><img
				src="img/pinterest-footer.svg" alt=""></a>
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
</body>
</html>