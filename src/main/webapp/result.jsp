<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/util.js"></script>
<script>
function getResult() {

	event.preventDefault();
	// step 1: Get form values
	let regNo = document.getElementById("regno").value;

	//send ajax request
	let formData = "regno="+regNo;
	var url = "http://localhost:8081/gradingsystem-api/StudentResultServlet?"+formData;
	
	var resultPromise = $.ajax(url, "GET", formData);
	
	resultPromise.then(function (response) {

		console.log("Ajax entry");
		var msg = JSON.parse(response).errMsg;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#message").innerHTML = "<font color='red'>" + msg + "</font>";
		}else{ 
	        var list = JSON.parse(response).marks;
			var student = JSON.parse(response).SD;
		
	        //document.getElementById("studlist").innerHTML = "";
	        cont = "<h4>Result:</h4><br/><h5>Student Name : "+student.studentName+"</h5><h5>Register Number : "+student.regNo+"</h5><br>";
	
	        for (let marks of list) {
	            cont += "<h5>"+marks.subjectName+" : "+marks.mark+"</h5>";
	        }
	
	        cont += "<br><h5>OverAll Percentage : "+student.avg+"</h5><h5>Grade : "+student.grade+"</h5>";
	
	        var list = document.getElementById("cbody");
	        list.innerHTML = cont; 
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
				<a class="nav-link" href="index.jsp">Logout</a>
			</div>

		</div>
	</nav>
	<br>
	<br>


	<h3>Check a Student Result</h3>
	<br>
	<div id="message"></div>
	<br>

	<form onsubmit="getResult()">
		Enter the Register Number : <input type="number" id="regno" min="1001"
			max="1100" required autofocus /><br> <br> <input
			type="submit" class="btn btn-primary" value="Enter" /> <input
			type="reset" class="btn btn-primary"> <br> <br> <br>

		<div id="cbody"></div>

	</form>


</body>
</html>