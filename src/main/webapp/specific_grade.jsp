<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>List of Student based on grading</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/counter.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/util.js"></script>

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
	
	<div class="row justify-content-center align-items-center" style="height: 20vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert" >
				  		<i id="messageBody" style="text-align:center;"></i>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    	<span aria-hidden="true">&times;</span>
				  </button>
				</div>
		</div>
	</div>

	<div class="row justify-content-center align-items-center" style="height: 20vh; margin: 0;">
		<div>
			<h3>List of Student on a Specific Grade</h3>
			<br>
			<form onsubmit="listStudent()">
				Enter a Specific Grade : <input type="text" id="grade" required autofocus /><br><br> 
				<input type="submit" class="btn btn-primary" value="Enter" />
				<input type="reset" class="btn btn-primary"> <br><br>
			</form><br><br/><br>
		</div>
	</div>
	<div class="row justify-content-center align-items-center" style="height: 60vh; margin: 0;">
		<div>
			<div id="tbody"></div>
		</div>
	</div>
<script>
function listStudent() {

	event.preventDefault();
	// Get form values
	let grade = document.getElementById("grade").value;

	let formData = "grade="+grade;
	var url = "http://localhost:8080/gradingsystem-api/StudentByGradeServlet?"+formData;
	var listPromise = $.ajax(url, "GET", formData);
	
	listPromise.then(function (response) {

		var msg = JSON.parse(response).errMessage;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";
			$('#errorMsg').css({'display':'block'});
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='green'><b>Perfect</b></font>";
			$('#errorMsg').css({'display':'block'});
			
	        var list = JSON.parse(response);
	        cont = "<h3>List Of Students :</h3><table class='table'><thead><tr><th>S.No</th><th>Student Name</th><th>Register Number</th><th>Percentage ( % )</th><th>Grade</th></tr></thead><tbody>";
	
	        for (let stud of list) {
	            cont += "<tr><td></td><td>";
	            cont += stud.studentName;
	            cont += "</td><td>";
	            cont += stud.regNo;
	            cont += "</td><td>";
	            cont += stud.avg;
	            cont += "</td><td>";
	            cont += stud.grade;
	            cont += "</td></tr>";
	        }
	
	        cont += "</tbody></table>";
	
	        var list = document.getElementById("tbody");
	        list.innerHTML = cont;
		}
    });
}

</script>
</body>
</html>