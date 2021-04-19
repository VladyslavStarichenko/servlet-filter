<!DOCTYPE html>
<html>
<head>
	<title>Todo list</title>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	  rel="stylesheet">

<style>

	.footer {
		height: 80px;
		width: 100%;
		color: #777777;
		background-color: #e7e7e7;
		font-size: 16px;
		margin-top: 350px;

	}

	.footer > p {
		padding-top: 30px;
		text-align: center;

	}

	#first:hover{
		margin-right: 20px;
		background-color: lightgrey;
	}
	#second:hover {
		background-color: lightgrey;
	}

	#third:hover {
		background-color: lightgrey;
	}
	.btn{
		width: 150px;
	}
	.container{
		width: 70%;
		height: auto;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid black;
		background-color: lightgrey;
		border-radius:20px ;
		margin-top: 30px;
	}
	.heading{
		text-align: center;
	}*{
		 font-family: "Maiandra GD";
	 }

</style>
</head>

<body>
<nav class="navbar navbar-default">
	<ul class="nav navbar-nav ">
		<li><H3 style="margin-left: 100px; margin-top: 7px; padding-top: 3px"> Todo Tasks </H3></li>
	</ul>



	<ul class="nav navbar-nav navbar-right">
		<li><a href="/sign-up.do" id="first">Sign Up<svg style="margin-bottom: -2px; margin-left:10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
			<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
		</svg></a></li>
		<li><a href="/login.do" id="second">Login<svg style="margin-bottom: -2px; margin-left:10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
			<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
		</svg></a></li>
		<li style="margin-right: 20px"><a href="/logout.do" id="third">Log out <svg style="margin-bottom: -2px; margin-left: 10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
			<path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
		</svg> </a></li>
	</ul>

</nav>

<div class="container">

	<H1 class="heading">Welcome, ${name}</H1>

	<table style="margin-top:30px" class="table table-dark">

		<thead >
		<th style="text-align: center">Task</th>
		<th style="text-align: center">Category</th>
		<th style="text-align:  center;  ">Deleting</th>
		<th style="text-align: center">Updating</th>
		</thead>
		<tbody>
		<c:forEach items="${todos}" var="todo">
			<tr style="text-align: center">
				<td >${todo.name}</td>
				<td>${todo.category}</td>
				<td style="margin-top: 5px">
					<a style="text-decoration: none #c37180; margin-top: 5px"  class="btn btn-danger" href="/delete-todo.do?todo=${todo.name}&category=${todo.category}">Delete<svg style="margin-left: 10px; margin-bottom: -2px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg></a>
				</td>
				<td>
					<a class="btn btn-warning" href="/update-todo.do?todo=${todo.name}&category=${todo.category}">Update<svg style="margin-bottom: -2px; margin-left: 10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-square" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.5 9.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
					</svg></a>
				</td>

			</tr>
		</c:forEach>
		</tbody>
	</table>

	<p>
		<font color="red">${errorMessage}</font>
	</p>
	<center>
	<a class="btn btn-info" style="margin-bottom: 20px; width: 300px" href="/add-todo.do">Add New Todo <svg style="margin-bottom: -2px; margin-left: 10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
		<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
		<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg></a>
	</center>
</div>

<footer class="footer">
	<p style="margin-top: 20px">All rights reserved</p>
</footer>
</body>

</html>