<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
function userLogin() {

	event.preventDefault();
	// step 1: Get form values
	let userName = document.getElementById("username").value;
	let passWord = document.getElementById("password").value;
	
	// prepare formdata
	let formData = "username="+userName + "&password="+passWord;	
	//send ajax request
	var url = "http://localhost:8081/gradingsystem-api/UserLoginServlet?"+formData ;
	var login = $.ajax(url, "GET", formData);
	
	login.then(function (response) {

		var msg = response.errorMessage;
		console.log(msg);

		if(msg == undefined){
			document.querySelector("#messageBody").innerHTML = "<font color='greet'>You are successfully Logged in.</font>";
			window.location.replace('userfeature.jsp')
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";   
			$('#errorMsg').css({'display':'block'}); 
		}
    });
}

</script>

<body class="img">


	<div class="row justify-content-center align-items-center" style="height: 80vh; margin: 0;">
		
		<div class="col-md-6">
			<div style="display:none;" id="errorMsg" class="alert alert-danger alert-dismissible fade show" role="alert">
			  		<i id="messageBody"></i>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    	<span aria-hidden="true">&times;</span>
			  </button>
			</div>
		</div>
		
		<div class="w-100"></div>
		
		<div class="col-md-6 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0, 0, 0, 0.5); border-radius: 10px;">
			
			<form class="mx-auto formstyle" method="get" onsubmit="userLogin()" style="font: message-box;opacity: 0.8;border-radius: 10px;background-color: black;color: white;padding:0 20px;">
				<div class="row justify-content-center align-items-center" style="height:300px">
					<div class="col">
						<h3>User Login</h3>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											UserName
										</div>
									</div>
									<input type="text" id="username" class="form-control" placeholder="UserName" required autofocus>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											Password
										</div>
									</div>
									<input type="password" id="password" class="form-control" placeholder="Password">
								</div>
							</div>
							<input type="submit" class="btn btn-primary" value="Login"> 
							<input type="reset" class="btn btn-primary" >
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>