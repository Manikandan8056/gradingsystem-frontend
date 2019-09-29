<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Score Range</title>
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
	<br>
	<br>

	<h2>Score Range Details</h2>
	<br />
	<div id="tbody"></div>

<script>
function viewRange() {
	//send ajax request
	var url = "http://localhost:8080/gradingsystem-api/ViewScoreRangeServlet";
	var viewPromise = $.ajax(url, "GET");
	
	viewPromise.then(function (response) {
        var list = JSON.parse(response);
        //document.getElementById("studlist").innerHTML = "";
        cont = "<table class='table'><thead><tr><th>S.No</th><th>GRADE</th><th>MINIMUN-RANGE</th><th>MAXIMUM-RANGE</th></tr></thead><tbody>";

        for (let range of list) {
            cont += "<tr><td></td><td>";
            cont += range.grade;
            cont += "</td><td>";
            cont += range.min;
            cont += "</td><td>";
            cont += range.max;
            cont += "</td></tr>";
        }

        cont += "</tbody></table>";

        var list = document.getElementById("tbody");
        list.innerHTML = cont;
    }, function(error) {
		console.log("Error:" + JSON.stringify(response));
		var msg = JSON.parse(error).errMessage;
		console.log(msg);
		document.querySelector("#tbody").innerHTML = "<font color='red'>" + msg + "</font>";
	});
}

 viewRange();
 </script>
</body>
</html>