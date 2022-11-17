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
<link rel="stylesheet" type="text/css" href="/css/login_metal.css">
<link rel="icon" href="/img/fifalogo.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/0e035b9984.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="/img/fifalogo.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/0e035b9984.js"
	crossorigin="anonymous"></script>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example"
	data-bs-offset="82" style="background-image: url('/img/football.jpg');">
	<header id="home">
		<nav id="#navbar"
			class="navbar navbar-expand-lg position-fixed top-0 w-100 py-3">
			<div class="container">
				<a class="navbar-brand" href="/"><img src="/img/fifab.png"
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