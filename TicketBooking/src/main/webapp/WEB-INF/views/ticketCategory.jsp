<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Firmbee.com - Free Project Management Platform for remote teams"> 
    <title>Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel = "icon" href = "/img/fifalogo.png" type = "image/x-icon">
    <script src="https://kit.fontawesome.com/0e035b9984.js" crossorigin="anonymous"></script>
    <style>
        div{
          line-height: 1.8;
        }
        </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example" data-bs-offset="82">
  <header id="home">
    <nav id="#navbar" class="navbar navbar-expand-lg position-fixed top-0 w-100 py-3 bg-dark">
      <div class="container">
        <a class="navbar-brand" href="/"><img src="/img/fifab.png" alt="" class="logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav ms-auto">
						<a class="nav-link active" href="/">home</a> <a class="nav-link"
							href="/#about">about</a>  <a class="nav-link"
							href="/tickets/ticketsDashboard">tickets</a>
						<c:choose>
							<c:when test="${sessionScope.user.fname ne null && (sessionScope.user.role.id)==2}">
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
        <img src="/img/ticketcategories.png" width="100%" height="40%"><br><br><br>
        <div class="container">
            <br><br>
        <p>Find out more about the price categories for the FIFA Club World Cup UAE 2021™</p>

         <p>   There will be four price categories on offer to the general public for the FIFA Club World Cup UAE 2021™: </p>
         <ul>
             <li>Category 1 is the highest priced, located in prime areas within the stadium.</li>
             <li>Categories 2 are located outside the category 1 area.</li>
             <li>Category 3 is located outside the category 1, 2 and 3 areas. This category is the most affordable one.</li>
         </ul>
         <p>FIFA determines the categorisation of each seat in the stadium on a match-by-match basis. This means that:</p>
         <ol type="i">

            (i) the ticket category may vary from match to match;<br>
            (ii) all ticket categories may include seats of the lower and upper tiers of the stadium;<br>
            (iii) the ticket categorisation remains unaffected by any conditions on matchday, such as weather conditions; and <br>
            ticket category boundaries may vary from match to match. Such differentiation is necessary to ensure that the maximum number of tickets can be made available to fans. <br>
            <br><br></ol>
<p>In order to make as many tickets as possible available to fans and at the same time to ensure that the global media and other stakeholders are properly serviced, FIFA may redesign the areas 
    in which seats of a certain ticket category are located. Therefore, FIFA reserves the right to assign specific seats to a different ticket category on a match-by-match basis.</p><br><br>
    For further ticketing information and updates regarding the FIFA Club World Cup UAE 2021™, please visit FIFA.com/tickets regularly.
</div><br><br>
<center>
<img src="/img/partners.png" width="80%" height="40%"><br><br><br></center>
    </main>
    <footer class="text-center text-uppercase py-5"> 
      <div class="footer-icons ">
        <a href=""><img src="/img/facebook-footer.svg" alt=""></a>
        <a href=""><img src="/img/instagramm-footer.svg" alt=""></a>
        <a href=""><img src="/img/pinterest-footer.svg" alt=""></a>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="/js/script.js"></script>
</body>
</html>