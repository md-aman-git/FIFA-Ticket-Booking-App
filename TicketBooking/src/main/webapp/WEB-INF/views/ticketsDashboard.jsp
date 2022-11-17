<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="A Team"> 
    <title>Ticket Booking Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel = "icon" href = "/img/fifalogo.png" type = "image/x-icon">
    <script src="https://kit.fontawesome.com/0e035b9984.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="/css/ticket_book.css">
</head>

<body data-bs-spy="scroll" data-bs-target="#navbar-example" data-bs-offset="82">
	<jsp:include page="uheader.jsp"></jsp:include>
	<main class="page-content">
		<a href="/tickets/applytickets" class="d_card">
    <div>
      <div class="content">
        <h2 class="heading">Apply For Tickets</h2>
        <p class="data-content">Apply for the tickets and get your seat booked for FIFA world cup. </p>
      </div>
    </div>  
    </a>
		<a href="/tickets/TicketApplication" class="d_card">
    <div>
      <div class="content">
        <h2 class="heading">My Ticket Application</h2>
        <p class="data-content">Now you can track your applications if you have submitted any. </p>
      </div>
    </div>  
    </a>
		<a href="/tickets/HowToApplyTicket" target="_blank" class="d_card">
    <div>
      <div class="content">
        <h2 class="heading">How To Apply For Tickets</h2>
        <p class="data-content">Read our step by step guide how to apply for the tickets and relax. </p>
      </div>
    </div>  
    </a>
		<a href="/tickets/ticketCategory" target="_blank" class="d_card">
    <div>
      <div class="content">
        <h2 class="heading">Ticket Categories</h2>
        <p class="data-content">Before purchaging any tickets now you can check the categories and pricing. </p>
      </div>
    </div>  
    </a>
	</main>
	<footer class="text-center  text-uppercase py-5">
        <div class="footer-icons ">
          <a href="https://www.facebook.com/fifa"><img src="/img/facebook-footer.svg" alt=""></a>
          <a href="https://www.instagram.com/easportsfifa/"><img src="/img/instagramm-footer.svg" alt=""></a>
          <a href="#"><img src="/img/pinterest-footer.svg" alt=""></a>
        </div>
        <div class="copyright pt-4 text-muted text-center">
          <p>&copy; 2022 FIFA WORLD CUP QATAR | Created by A Team</a> </p>
      </div>
      </footer>
      <div class="fb2022-copy">copyright @ all rights reserved</div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
</body>
</html>