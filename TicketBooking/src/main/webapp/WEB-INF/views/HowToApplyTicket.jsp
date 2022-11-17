<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Firmbee.com - Free Project Management Platform for remote teams"> 
    <title>How to apply</title>
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
<br><br><br><br><br>
<img src="/img/aplly3.png" width="100%" height="60%">
<br>
<div class="container " >
    <br><hr>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How to Apply for Tickets for the FIFA World Cup</h1>
      <hr><center><br>
      <p>Receiving tickets to specific World Cup matches requires several application periods during the year leading up to the event. The majority of ticket
         orders are placed at FIFA.com, while official FIFA ticketing centers in the host country will open to supply the remaining tickets before the tournament begins. The 
         process applies to the 2022 FIFA World Cup in Qatar, but it will also likely reflect the ticketing process for future World Cups.</p>
         <br>
</center>
<hr>
<h1><center> Preparing to Apply</h1></center> 
<hr>
<ol>
    <li>
        Apply for your passport. Encourage anyone who wants to attend the World Cup with you to do so as well. You will need a valid passport number in order to apply for tickets.</li>
    <li>
        Ask for personal information for the friends that will attend with you. In some cases, you can apply for more than one ticket; however, you will need to enter information about the other ticket holders.
        </li>
        <li>
            Pick a form of electronic payment that has sufficient funds. You can use a credit or debit card, as well as some forms of online secured payments.</li>
            <li>Choose the matches that you want to attend. You can apply for four tickets per household at once. You can apply for seven matches, as long as they are on different match days.
                <ul>
                    <li>This means you should always choose one match per day to apply for. If you don't receive tickets for a certain match day, you can always apply during a later application period for a different match.</li>
                    <li>Since millions of people apply for the tickets, it is a good idea to have 15 to 20 matches listed in order of priority.</li>
                </ul>
            </li>
            <li>
                Decide what category and price point you will apply for. You can't choose the exact seats you would get; however, you apply for categories according to price and proximity to the pitch.
            <ul>
                <li>
                    Apply for category one to sit in the prime areas of the stadium. They are along the length of the pitch on either side. Prices are between $175 and $1,000 per match, increasing in price according to the tournament stage.
                </li>
                <li>
                    Apply for category two to find a less expensive ticket in the corners of the stadium. Tickets are approximately $135 to $650, increasing in price according to the tournament stage.
                </li>
                <li>
                    Apply for category three for a lower cost ticket behind the goals. Ticket prices are between $90 and $450 per match. Disabled access tickets are also at this price point.
                </li>
            </ul>
            </li>
</ol>

<br>
<hr>
<h1>
  <center> Applying During Sales</center> 
</h1>
<hr>
<br>
<ol>
    <li>  
Sign into your FIFA account. If you don't have a FIFA account, you will need to make one.
    </li>
    <li> 
Go to the ticket website. Enter your personal information. Then, select your matches.
<ul>
    <li>You can only select one match per day.
    </li>
    <li>Ensure you submit your payment information.</li>
    <li>You will receive an email confirmation from FIFA.com when your Random Selection Period application is placed.
    </li>
</ul>
    </li>
    <li>
        Wait to hear via email. They will confirm or let you know if you did not receive tickets.
    </li>
    <li>
        Repeat the application process. Submit your application for additional matches. You will know immediately whether or not you will receive tickets.
        </li>
</ol>
<hr>
</div>
<center><img src="/img/partners.png" width="80%" height="7%"></center>
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
    <script src="./js/script.js"></script>
</body>
</html>