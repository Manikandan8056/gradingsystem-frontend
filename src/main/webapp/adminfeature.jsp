<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminFeatures</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>

<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<a class="navbar-brand" style="color: white;">GRADING SYSTEM</a>
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

			</ul>
			<div class="nav-item-right">
				<a class="nav-link" href="index.jsp">Logout</a>
			</div>

		</div>
	</nav>
	
	<div class="row justify-content-center align-items-center"
		style="height: 30vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert">
				  		<i id="messageBody"></i>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    	<span aria-hidden="true">&times;</span>
				  </button>
				</div>
		</div>
	</div>
		<div class="row justify-content-center align-items-center" style="height: 30vh; margin: 0;">
			
			<div>
				<a href="define_score_range.jsp" style="font-size: x-large;">Define Score Range</a><br> <br>
				<a href="view_score_range.jsp" style="font-size: x-large;">View Score Range</a><br> <br>
				<a href="" onclick="deleteFunc()" style="font-size: x-large;">Delete Score Range</a>
			</div>
		</div>
	
	
<script>
	
		function deleteFunc() {
			  var txt;
			  if (confirm("Are you sure, Do you want to delete the score Ranges?")) {
					event.preventDefault();
				  	var url = "http://localhost:8080/gradingsystem-api/DeleteScoreRangeServlet";
				  	var deletePromise = $.get(url);
					
				  	deletePromise.then(function (response) {
						console.log("Error:" + JSON.parse(response).message);
						var status = JSON.parse(response).message;
						console.log(status);
						
						if(status == "success"){
							document.querySelector("#messageBody").innerHTML = "<font color='green'>Score range deleted successfully.</font>";
							$('#errorMsg').css({'display':'block'});
							txt = "Score range deleted successfully";
						}else{
							document.querySelector("#messageBody").innerHTML = "<font color='red'>"+status+"</font>";  
							$('#errorMsg').css({'display':'block'}); 
						}

					});
					  
			  } else {
			    txt = "Delete Score Range Canceled!";
			    alert(txt);
			  }
		}
</script>
</body>
</html>