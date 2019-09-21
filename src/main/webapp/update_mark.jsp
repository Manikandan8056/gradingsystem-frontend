<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student Marks</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/util.js"></script>
<script>
function updateMark() {
	
	event.preventDefault();
	// Get form values
	let regno = document.getElementById("regno").value;
	let mark1 = document.getElementById("english").value;
	let mark2 = document.getElementById("maths").value;
	let mark3 = document.getElementById("physics").value;
	let mark4 = document.getElementById("chemistry").value;
	let mark5 = document.getElementById("computer").value;
	// prepare formdata
	let formData = "regno="+regno + "&mark1="+mark1+ "&mark2="+mark2+ "&mark3="+mark3+ "&mark4="+mark4+ "&mark5="+mark5;		
	console.log(formData);
	//send ajax request
	var url = "http://localhost:8081/grading_system-web/UpdateMarkServlet?"+formData;
	var registerPromise = $.ajax(url, "GET", formData);
	
	registerPromise.then(function(response) {
		console.log("Error:" + JSON.stringify(response));
		var msg = JSON.parse(response).responseMessage;

		if(msg == "success"){			
			document.querySelector("#message").innerHTML = "<font color='green'>Reg-No :"+regno+" Mark is Updated</font>";
		}else{
			document.querySelector("#message").innerHTML = "<font color='red'>" + msg + "</font>";
			}
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
					href="userfeature.jsp">Home <span class="sr-only">(current)</span></a>
				</li>

			</ul>
			<div class="nav-item-right">
				<a class="nav-link" href="#">Logout</a>
			</div>

		</div>
	</nav>
	<br>
	<br>


	<h3>Update Student Marks</h3>
	<br>
	<br>
	<div id="message"></div>
	<br>

	<form onsubmit="updateMark()">
		Enter the Register Number : <input type="number" id="regno" min="1000"
			max="1100" required autofocus /><br>
		<br> Enter the Mark for ENGLISH : <input type="number"
			id="english" min="0" max="100" required><br>
		<br> Enter the Mark for MATHS : <input type="number" id="maths"
			min="0" max="100" required><br>
		<br> Enter the Mark for PHYSICS : <input type="number"
			id="physics" min="0" max="100" required><br>
		<br> Enter the Mark for CHEMISTRY : <input type="number"
			id="chemistry" min="0" max="100" required><br>
		<br> Enter the Mark for COMPUTER : <input type="number"
			id="computer" min="0" max="100" required><br>
		<br> <input type="submit" class="btn btn-primary" value="Update" />
		<input type="reset" class="btn btn-primary">

	</form>

</body>
</html>