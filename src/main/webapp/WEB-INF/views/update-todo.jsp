<!DOCTYPE html>
<html>
<head>
    <title>Update</title>
    <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
          rel="stylesheet">


</head>
<style>

    body {
        height: 100%;
    }

    #first:hover {
        background-color: lightgrey;
    }

    #second:hover {
        background-color: lightgrey;
    }

    #third:hover {
        background-color: lightgrey;
    }

    .container {
        top: 50%;
        bottom: 50%;
        width: 500px;
        height: 400px;
        border: 1px solid black;
        margin-bottom: 190px;
        border-radius: 20px;
        background-color: lightgrey;
    }


    .footer {
        height: 80px;
        width: 100%;
        color: #777777;
        background-color: #e7e7e7;
        font-size: 16px;
        margin-top: 400px;
    }

    .footer > p {
        margin-top: 27px;
        text-align: center;
    }

    * {
        font-family: "Maiandra GD";
    }

    .form-group {
        width: 300px;
        margin-left: 80px;
    }
</style>
<body>

<nav class="navbar navbar-default">

    <ul class="nav navbar-nav ">
        <li><H3 style="margin-left: 100px; margin-top: 7px; padding-top: 3px "> Todo Tasks </H3></li>
    </ul>
    <ul class="nav navbar-nav" style="margin-left: 50px">
        <li><a href="/list-todos.do" id="first">Todos<svg style="margin-bottom: -2px; margin-left: 10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2-all" viewBox="0 0 16 16">
            <path d="M12.354 4.354a.5.5 0 0 0-.708-.708L5 10.293 1.854 7.146a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0l7-7zm-4.208 7-.896-.897.707-.707.543.543 6.646-6.647a.5.5 0 0 1 .708.708l-7 7a.5.5 0 0 1-.708 0z"/>
            <path d="m5.354 7.146.896.897-.707.707-.897-.896a.5.5 0 1 1 .708-.708z"/>
        </svg></a></li>
    </ul>

    <ul class="nav navbar-nav navbar-right">
        <li><a href="/login.do" id="second">Login<svg style="margin-bottom: -2px; margin-left:10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
            <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
        </svg></a></li>
    </ul>

</nav>


<div class="container">
    <center>
        <H1>Update of Task: <P1 style="color: #5bc0de"> ${todo}</P1></H1>
    </center>

    <hr>
    <p style="color: lightcoral; text-align: center" >${errorMessage}</p>
    <form method="POST" action="/update-todo.do">
        <fieldset class="form-group">
            <label>Todo Task
                <input  style="width: 300px;"value="${todo}" name="newTodo" type="text" class="form-control"   /> <BR/>
            </label>
        </fieldset>
        <fieldset class="form-group">
            <label>Category
                <input style="width: 300px;" name="newCategory" type="text" class="form-control" value="${category}"/> <BR/>
            </label>
        </fieldset>
        <hr>
        <input style="width: 300px; margin-left: 80px" name="update" type="submit" class="btn btn-info" value="Submit"/>
    </form>
</div>
<footer class="footer">
    <p>All rights reserved</p>
</footer>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>

</html>
