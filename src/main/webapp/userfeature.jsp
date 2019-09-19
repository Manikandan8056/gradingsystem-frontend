<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserFeature</title>
</head>
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

	<div class="mx-auto" style="width: 300px;">
		<br>
		<br> <a href="result.jsp">Check the Result</a><br>
		<br> <a href="update_mark.jsp">Update student marks</a><br>
		<br> <a href="grade_wise_list.jsp">List the student based on
			grade</a><br>
		<br> <a href="specific_grade.jsp">List the student on
			specific grade</a><br>
		<br> <a href="sub_wise_rankholder.jsp">Subject wise
			rankholder</a><br>
		<br> <a href="view_score_range1.jsp">View Score Range</a><br>
		<br>

	</div>

</body>
</html>