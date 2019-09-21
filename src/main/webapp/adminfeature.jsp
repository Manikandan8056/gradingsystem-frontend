<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminFeatures</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
	
	
	<div class="row justify-content-center align-items-center" style="height: 80vh; margin: 0;">
		
		<div>
			<a href="define_score_range.jsp">Define Score Range</a><br> <br> 
			<a href="view_score_range.jsp">View Score Range</a><br> <br>
			<a href="DeleteScoreRangeServlet" onclick="return confirm('Are you sure, Do you want to delete the score Ranges?');">Delete Score Range</a>
		</div>
	</div>

</body>
</html>