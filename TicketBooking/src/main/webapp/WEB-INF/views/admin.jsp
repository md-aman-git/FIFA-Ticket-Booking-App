<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Dashboard</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
 <% String url= new UrlPathHelper().getOriginatingRequestUri(request); %>
    <c:set var="url" value="<%= url %>" scope="page"></c:set>
	<div class="admin-panel clearfix">
  <div class="slidebar">
    <div class="logo">
      <a href=""></a>
    </div>
    <ul>  
      <li><a href="/dashboard" id="targeted">Dashboard</a></li>
      <li><a href="/stadium" class="list-group-item list-group-item-action <%= url.equals("/stadium") ? "active" : "" %>">Stadium</a> 
      <li><a href="/matches" class="list-group-item list-group-item-action <%= url.equals("/matches") ? "active" : "" %>">Matches</a></li>
      <li><a href="/team" class="list-group-item list-group-item-action <%= url.equals("/team") ? "active" : "" %>">Teams</a></li>
      <li><a href="/matchdetails" class="list-group-item list-group-item-action <%= url.equals("/matchdetails") ? "active" : "" %>">Match Details</a></li>
      <li><a href="#application">View Applications</a></li>
      <li><a href="/adminChngPwd">Change Password</a></li>
      <li><a href="/logout">Log Out</a></li>
    </ul>
  </div>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="stadium_js.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->

</body>
</html>