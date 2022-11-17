<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author"
	content="Firmbee.com - Free Project Management Platform for remote teams">
<title>Clear blog</title>
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
<script src="https://kit.fontawesome.com/0e035b9984.js"
	crossorigin="anonymous"></script>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example" data-bs-offset="82">
  <header id="home">
    <nav id="#navbar" class="navbar navbar-expand-lg position-fixed top-0 w-100 py-3 bg-dark">
      <div class="container">
        <a class="navbar-brand" href="index.html"><img src="img/fifab.png" alt="" class="logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav ms-auto">
            <a class="nav-link active" href="/">home</a> <a class="nav-link"
							href="/#about">about</a><a class="nav-link"
							href="/tickets/ticketsDashboard">tickets</a>
						<c:choose>
							<c:when test="${sessionScope.user.fname ne null }">
								<li><a class="nav-link" href="/updatePassword">&nbsp; CHANGE
										PASSWORD</a></li>
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
		<div class="container">
			<div class="row mainmargin">
				<div class="blog col-md-8">
					<div class="all-posts">
						<div class="post-item">
							<div class="post-img">
								<img src="/img/img1.jpg" alt="">
							</div>
							<div class="post-main-info">
								<p class="post-title">FIFA Futsal World Cup™</p>
								<div class="post-meta">
									<span><i class="far fa-user"></i> Posted by John</span><span><i
										class="far fa-calendar"></i> 30 01 2022</span><span><i
										class="far fa-comment-alt"></i> 2 comments</span>
								</div>
								<p>Of the 50 teams that have participated at the FIFA Futsal
									World Cup™ so far, only four have managed to win the title. The
									record holder with five titles is the team from Brazil.
									Together with Spain, who have been world champions twice so
									far, they have won the first seven editions of the FIFA Futsal
									World Cup.</p>
					
							</div>
						</div>
						<div class="post-item">
							<div class="post-img">
								<img src="/img/img4.jpg" alt="">
							</div>
							<div class="post-main-info">
								<p class="post-title">FIFA Beach Soccer World Cup™</p>
								<div class="post-meta">
									<span><i class="far fa-user"></i> Posted by Fifa</span><span><i
										class="far fa-calendar"></i> 30 02 2021</span><span><i
										class="far fa-comment-alt"></i> 0 comments</span>
								</div>
								<p>The world-famous Copacabana beach in Rio de Janeiro,
									Brazil, hosted the first three editions of the FIFA Beach
									Soccer World Cup™ as of 2005. It had already hosted seven world
									beach soccer tournaments in previous years. Although Brazil has
									always been a power in beach soccer, the host nation failed to
									win the first tournament organised by FIFA in 2005.</p>
								
							</div>
						</div>
						<div class="post-item">
							<div class="post-img">
								<img src="/img/img3.jpg" alt="">
							</div>
							<div class="post-main-info">
								<p class="post-title">Olympic Football and Futsal
									Tournaments</p>
								<div class="post-meta">
									<span><i class="far fa-user"></i> Posted by Mark</span><span><i
										class="far fa-calendar"></i> 12 01 2022</span><span><i
										class="far fa-comment-alt"></i> 1 comment</span>
								</div>
								<p>Football is a sport with a very long Olympic tradition.
									It made its debut as a demonstration sport at the second
									edition of the modern Olympic Games in 1900. It has been an
									official Olympic discipline since the 1908 Games in London.
									What many people don't know is that the men's.</p>
								
							</div>
						</div>
						<div class="post-item">
							<div class="post-img">
								<img src="img/img2.jpg" alt="">
							</div>
							<div class="post-main-info">
								<p class="post-title">Blue Stars/FIFA Youth Cup™</p>
								<div class="post-meta">
									<span><i class="far fa-user"></i> Posted by Daniel</span><span><i
										class="far fa-calendar"></i> 18 07 2021</span><span><i
										class="far fa-comment-alt"></i> 4 comments</span>
								</div>
								<p>The history of the Blue Stars/FIFA Youth Cup™ goes back
									to 1939, when the Zurich football club FC Blue Stars organised
									the youth club tournament for the first time. The tournament
									quickly gained a solid reputation at national and soon also
									international level and was held every spring without
									interruption until.</p>
								
							</div>
						</div>




					</div>

				</div>
				<div class="sidebar col-md-4">

					<div class="recent-posts pt-5">
						<h4 class="mb-3">RECENT POSTS</h4>
						<div class="post-item">
							<p class="post-title">The Africa Cup through the lens of
								Faouzi Mahjoub</p>
							<div class="post-meta">
								<span><i class="far fa-user"></i> Posted by David</span><span><i
									class="far fa-calendar"></i> 01 07 2021</span><span><i
									class="far fa-comment-alt"></i> 1 comment</span>
							</div>
							<p class="post-content">The Tunisian football journalist and
								expert Faouzi Mahjoub was a long-time companion of the Africa
								Cup of Nations. With a selection of images from his archive, we
								take a look back on the finals between 1962 and 1986.</p>
						</div>
						<div class="post-item">
							<p class="post-title">New video: Celebrating Paolo Rossi at
								the FIFA Museum</p>
							<div class="post-meta">
								<span><i class="far fa-user"></i> Posted by fifa</span><span><i
									class="far fa-calendar"></i> 04 01 2022</span><span><i
									class="far fa-comment-alt"></i> 0 comments</span>
							</div>
							<p class="post-content">In December, one year after the
								passing of Italian international Paolo Rossi, we gathered at the
								FIFA Museum together with his family and teammates who won the
								1982 World Cup to both remember him and pay tribute to his life.
								Watch our latest video to relive this emotional event.</p>
						</div>
						<div class="post-item">
							<p class="post-title">The Showcase: China PR 199</p>
							<div class="post-meta">
								<span><i class="far fa-user"></i> Posted by fifa</span><span><i
									class="far fa-calendar"></i> 30 07 2021</span><span><i
									class="far fa-comment-alt"></i> 0 comments</span>
							</div>
							<p class="post-content">The objects in our showcase and the
								illustration above tell the story of the tournament that put
								women’s football on the global stage and saw the U.S. Women’s
								National Soccer Team win its first title.</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="text-center text-uppercase py-5">
		<div class="footer-icons ">
			<a href=""><img src="/img/facebook-footer.svg" alt=""></a> <a
				href=""><img src="/img/instagramm-footer.svg" alt=""></a> <a
				href=""><img src="/img/pinterest-footer.svg" alt=""></a>
		</div>
		<div class="copyright pt-4 text-muted text-center">
			<p>&copy;2022 FIFA WORLD CUP QATAR | CREATED BY A TEAM</p>
			<!--
          This template is licenced under Attribution 3.0 (CC BY 3.0 PL),
          You are free to: Share and Adapt. You must give appropriate credit, you may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
          -->
		</div>
	</footer>
	<div class="fb2022-copy">Fbee 2022 copyright</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script src="./js/script.js"></script>
</body>
</html>
