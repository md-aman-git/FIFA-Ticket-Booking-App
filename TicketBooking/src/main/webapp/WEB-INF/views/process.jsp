<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment in progress</title>
</head>
<body>
	<center>
		<img src="/img/process.gif" style="display: block; size: 8cm;" />
		<p>Kindly do not refresh or press back button</p>
		<p style="color: blue;" id="demo"></p>
	</center>
</body>
<script type="text/javascript">
	function Redirect() {
		window.location = "/tickets/TicketApplication";
	}
	alert("Your Payment Is Successfull");
	document.getElementById("demo").innerHTML = "Please wait while we are redirecting you";

	setTimeout('Redirect()', 5000);
</script>
</html>