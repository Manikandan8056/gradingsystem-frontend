<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
function adminLogin() {

	event.preventDefault();
	// step 1: Get form values
	let userName = document.getElementById("username").value;
	let passWord = document.getElementById("password").value;
	
	// prepare formdata
	let formData = "username="+userName + "&password="+passWord;	
	//send ajax request
	var url = "http://localhost:8081/gradingsystem-api/AdminLoginServlet?"+formData ;
	var login = $.ajax(url);
	
	login.then(function (response) {
		console.log(response.errorMessage);
		
		var msg = response.errorMessage;
		console.log(msg);

		if(msg == undefined){
			document.querySelector("#messageBody").innerHTML = "<font color='greet'>You are successfully Logged in.</font>";
			window.location.replace('adminfeature.jsp')
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";   
		}
    });
}
</script>
<body class="img">

	<div class="row justify-content-center align-items-center"
		style="height: 80vh; margin: 0;">
		
		
		
		<div class="col-md-6 col-lg-3 text-center"
			style="box-shadow: 5px 8px 18px -8px rgba(0, 0, 0, 0.5); border-radius: 10px">
			<form class="mx-auto formstyle" method="get" onsubmit="adminLogin()" style="font: message-box;">
				
				<div id="messageBody"></div>
				<br>
				<h3>Admin Login</h3>
				<br> <br> 
				AdminName :<input type="text" id="username" placeholder="UserName" required autofocus><br><br> 
				Password :<input type="password" id="password" placeholder="Password"><br> <br> 
				<input type="submit" class="btn btn-primary" value="Login"> 
				<input type="reset" class="btn btn-primary">
			</form>
		</div>
	</div>
</body>
</html>