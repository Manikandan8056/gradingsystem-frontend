<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Define Score Range</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/util.js"></script>
<script>
function updateRange() {
	console.log("updateRange");
	event.preventDefault();
	// step 1: Get form values
	let gradeRange = document.getElementById("grade").value;
	let minimum = document.getElementById("min").value;
	let maximum = document.getElementById("max").value;
	// prepare formdata
	let formData = "grade="+gradeRange + "&min="+minimum + "&max=" + maximum;		
	console.log(formData);
	//send ajax request
	var url = "http://localhost:8081/gradingsystem-api/DefineScoreRangeServlet?"+formData;
	var registerPromise = $.ajax(url, "GET", formData);
	
	registerPromise.then(function(response) {
		console.log("Error:" + JSON.stringify(response));
		var msg = response.responseMessage;
		console.log(msg);
		//alert(msg);
		document.querySelector("#message").innerHTML = "<font color='red'>" + msg + "</font><br><br>";
	});
}

</script>
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
				<li class="nav-item active"><a class="nav-link"
					href="adminfeature.jsp">Home <span class="sr-only">(current)</span></a>
				</li>

			</ul>
			<div class="nav-item-right">
				<a class="nav-link" href="index.jsp">Logout</a>
			</div>

		</div>
	</nav>
	<br>
	<br>

	<div class="row justify-content-center" style="height: 80vh; margin: 0;">
		<div>
			<h3>Define Score Range</h3>
			<br>
			<br>
			<div id="message"></div>
		
			<form onsubmit="updateRange()">
				Enter the Grade : <input type="text" id="grade" required autofocus style="width: 17vh"><br>
				<br> 
				Enter Minimum Score : <input type="number" id="min" min="0" max="100" required><br>
				<br> 
				Enter Maximum Score : <input type="number" id="max" min="0" max="100" required><br>
				<br> 
				<div>
					<input type="submit" class="btn btn-primary" value="Submit" style="margin: 10px;width: 35vh;"><br>
					<input type="reset" class="btn btn-primary" style="margin: 10px;width: 35vh;">
				</div>
			</form>
		</div>
	</div>

</body>
</html>