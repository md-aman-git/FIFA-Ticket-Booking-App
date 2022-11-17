<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>APPLY TICKET</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/option_match.css">
<link rel="icon" href="/img/fifalogo.png" type="image/x-icon">
<style type="text/css">
@import
	url("https://fonts.googleapis.com/css?family=Raleway:400,400i,900");

*, *:after, *:before {
	box-sizing: border-box;
}

input[type=text]
input[type=number] {
	padding: 20px;
	size: 10px;
}

body {
	background: #fafafa;
	font-family: sans-serif;
	padding: 3em;
	background: url("/img/football.jpg");
	background-size: cover;
	display: flex;
	align-items: center;
	justify-content: center;
}

.wrapper {
	box-shadow: 0.25em 0.25em 0.25em rgba(0, 0, 0, 0.15);
	max-width: 1000px;
	min-width: 400px;
	width: 90%;
}

.active {
	background: #ccc;
	&
	>
	span
	{
	color
	:
	#4444;
	&:
	after
	{
	content
	:
	"\f068";
}

}
}
aman {
	background: linear-gradient(10deg, #000, #222);
	border: 0;
	cursor: pointer;
	color: #FFFFFF;
	display: flex;
	font-family: inherit;
	font-weight: bold;
	justify-content: space-between;
	letter-spacing: .12em;
	padding: 1em;
	text-align: center;
	text-transform: uppercase;
	width: 100%; &:
	not (: last-of-type){
    border-bottom: .10em solid #aaa;
}

&
:not(.active) { &:hover { background:#ddd;
	
}

}
&
>
span {
	color: #999;
	transition: all 150ms ease; &: after { content : "\f067";
	font-weight: bold;
	font-family: "Font Awesome 5 Free";
}

}
}
fieldset {
	overflow: hidden
}

.some-class {
	float: left;
	clear: none;
	padding: 1em;
	display: flex;
	align-items: center;
	justify-content: center;
}

fieldset label {
	float: left;
	clear: none;
	display: block;
	margin-right: 20px;
	font-size: 20px;
	color: white;
}

input[type=radio], input.radio {
	float: left;
	clear: none;
	line-height: 20px;
	padding: 20px 0 0 0;
	width: 20px;
	height: 10px;
}

section {
	color: #000; //
	display: none;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	width: 100%;
	background: #000;
	&.
	visible
	{
	display
	:
	block;
}

&
>
p {
	background: #f9f9f9;
	color: #FFFFFF;
	line-height: 1.3;
	margin: 0;
	padding: 1em;
	text-align: justify;
}
}
</style>
<style type="text/css">
table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	margin: 0;
	padding: 0;
	width: 100%;
	table-layout: fixed;
}

table caption {
	font-size: 1.5em;
	margin: .5em 0 .75em;
}

table tr {
	background-color: #f8f8f8;
	border: 1px solid #ddd;
	padding: .35em;
}

table th, table td {
	padding: .625em;
	text-align: center;
}

table th {
	font-size: .85em;
	letter-spacing: .1em;
	text-transform: uppercase;
}

@media screen and (max-width: 600px) {
	table {
		border: 0;
	}
	table caption {
		font-size: 1.3em;
	}
	table thead {
		border: none;
		clip: rect(0, 0, 0, 0);
		height: 1px;
		margin: -1px;
		overflow: hidden;
		padding: 0;
		position: absolute;
		width: 1px;
	}
	table tr {
		border-bottom: 3px solid #ddd;
		display: block;
		margin-bottom: .625em;
	}
	table td {
		border-bottom: 1px solid #ddd;
		display: block;
		font-size: .8em;
		text-align: right;
	}
	table td::before {
		/*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
		content: attr(data-label);
		float: left;
		font-weight: bold;
		text-transform: uppercase;
	}
	table td:last-child {
		border-bottom: 0;
	}
}

/* general styling */
body {
	font-family: "Open Sans", sans-serif;
	line-height: 1.25;
}
</style>
</head>

<c:if test="${user eq null}">
	<jsp:forward page="login.jsp" />
</c:if>

<body>
	<form method="post" action="/tickets/applytickets">
		<div class="wrapper">

			<!--  <button type="button" class="btn btn-primary" style="float: right; width: 10%;">Cancel</button>
	  -->

			<aman> MATCH DETAILS <span></span> </aman>
			<section>
				<table>
					<thead>
						<tr>
							<th scope="col" style="width: 2%"></th>
							<th scope="col">Match Id</th>
							<th scope="col">Match Schedule</th>
							<th scope="col">Stadium Name</th>
							<th scope="col">Match Name</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list}" var="t">
							<tr>
								<td><INPUT TYPE="radio" name="command" value="${t[0]}" /></td>
								<td>${t[0]}</td>
								<td>${t[1]}</td>
								<td>${t[2]}</td>
								<td>${t[3]}</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</section>
			<aman> SEAT CATEGORY <span></span> </aman>
			<section>
				<fieldset>
					<div class="some-class" id="bgh" style="display: inline-table; size: 20px; margin-top: 2px;">
					<c:forEach items = "${category}" var="category">
						<input type="radio" class="radio" name="category" value="${category.id}"
							id="radioone" /> <label for="radioone"> ${category.name} </label>
					</c:forEach>
					<a style="font-size: 14px; font-family: serif; font-style: italic; color: #0dcaf0 " href="/tickets/ticketCategory" target="_blank">Want to know about FIFA Seat Categores?</a>
					</div>
				</fieldset>
			</section>
			<aman id="users"> ADD USERS <span></span> </aman>
			<section id="sec_user" style="height: 200px">
				<div id="temp_user">
					<label style="color: white; padding: 15px;">NAME</label> <input
						type="text" style="padding: 5px;" name="name" /> <label
						style="color: white; padding: 15px;">AGE</label> <input
						type="number" style="padding: 5px" name="age" />
					<button type="button" class="btn btn-info"
						style="margin-left: 45px">ADD USER</button>
					<br>
				</div>

				<br>

			</section>

		</div>
		<br> <br>
		<center>
			<button type="submit" class="btn btn-success">Success</button>
			<a class="btn btn-primary" href="/tickets/ticketsDashboard"
				role="button">Cancel</a>
		</center>
	</form>



	<script type="text/javascript">

function removeRow(btnName) {  
        try {  
        	 var parent = this.parentElement;
        	 parent.parentElement.removeChild(parent);
            }  
         
        catch (e) {  
            alert(e);  
        }  
    }  

var temp_user = document.querySelector('.temp_user');
var user_info = document.querySelector('.btn-info');
const lable = document.createElement('label');
const div_user = document.createElement('div');
const container = document.getElementById('temp_user');
const section = document.getElementById('sec_user');
var i = 1;
user_info.addEventListener('click', ()=> {
	var name = document.createElement("input");
	var nameL = document.createElement("label");
	nameL.innerHTML = "NAME";
	nameL.style.color="white";
	nameL.style.padding="17px";
    name.type = "text";
    name.name = "name";
    name.style.padding="5px";
    container.appendChild(nameL);
	container.appendChild(name);
	var age = document.createElement("input");
	var ageL = document.createElement("label");
    age.type = "number";
    age.name = "age";
    age.style.padding="5px";
    ageL.innerHTML = "AGE";
	ageL.style.color="white";
	ageL.style.padding="18px";
	container.appendChild(ageL);
	container.appendChild(age);
    var element1 = document.createElement("input");  
    element1.type = "button";  
    var btnName = "button" + (i);  
    element1.name = btnName;  
    element1.setAttribute('value', 'X');
    element1.style.margin="22px";
    element1.addEventListener('click', function() {
        name.remove();
        age.remove();
        nameL.remove();
        ageL.remove();
        this.remove();
        element1.remove();
    });
    element1.style.marginLeft="50px";
    container.append(element1);
    console.log(name);
	container.appendChild(document.createElement("br"));
	i++;
	 let panel = document.getElementById("users").nextElementSibling;
	   	panel.style.maxHeight = panel.scrollHeight + "50px";
	    console.log("Clicked Event");

});

const buttons = Array.from(document.querySelectorAll('aman'));

buttons.forEach(function(aman) {
  aman.addEventListener('click', function(e) {
    //Button behaviour
    this.classList.toggle('active');
    
    // Panel behaviour
    let panel = this.nextElementSibling;
    
    if(panel.style.maxHeight){
      panel.style.maxHeight = null;
    } 
    else{
    	panel.style.maxHeight = panel.scrollHeight + "px";
      console.log("Clicked Event");
      
  }
  });
  
});


</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</body>
</html>