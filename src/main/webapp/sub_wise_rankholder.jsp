<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subject wise RankHolder</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/counter.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/util.js"></script>
<script>
function rankHolder() {

	event.preventDefault();
	// step 1: Get form values
	let subCode = document.getElementById("subCode").value;
	//send ajax request
	
	let formData = "subjectCode="+subCode;
	var url = "http://localhost:8080/grading_system-web/SubjectWiseRankServlet?"+formData;
	var listPromise = $.ajax(url, "GET", formData);
	
	listPromise.then(function (response) {

		var msg = JSON.parse(response).errMessage;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#message").innerHTML = "<font color='red'>" + msg + "</font>";
		}else{
	        var list = JSON.parse(response);
	        
	        //document.getElementById("studlist").innerHTML = "";
	        cont = "<h3>Subject wise RankHolders :</h3><br><br/><table class='table'><thead><tr><th>S.No</th><th>Student Name</th><th>Register Number</th><th>"+subCode+"</th><th>OverAll-Grade</th></tr></thead><tbody>";
	
	        for (let stud of list) {
	            cont += "<tr><td></td><td>";
	            cont += stud.studentName;
	            cont += "</td><td>";
	            cont += stud.regNo;
	            cont += "</td><td>";
	            cont += stud.mark;
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


	<h3>Subject wise RankHolder</h3>
	<br>
	<div id="message"></div>
	<br>

	<form onsubmit="rankHolder()">
		Enter a Subject Code : <select id="subCode">
			<option value="ENG11">ENGLISH</option>
			<option value="MAT12">MATHS</option>
			<option value="PHY13">PHYSICS</option>
			<option value="CHE14">CHEMISTRY</option>
			<option value="COM15">COMPUTER</option>
		</select><br>
		<br> <input type="submit" class="btn btn-primary" value="Enter" />
		<input type="reset" class="btn btn-primary"> <br>
		<br>
		<br>

		<div id="tbody"></div>

	</form>


</body>
</html>