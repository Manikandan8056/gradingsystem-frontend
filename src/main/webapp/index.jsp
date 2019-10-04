<!DOCTYPE html>
<html>
<title>Grading System</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/app.js"></script>

</head>

<body>

	<jsp:include page="header.html"></jsp:include>

<div class="view" id="view">
	 <%
            String pageName = request.getParameter("pageName");
        if(pageName == null || "".equals(pageName.trim()))
        {
        	pageName = "home.html";
        }
        %>
        
        <jsp:include page="<%=pageName%>"></jsp:include>
        
</div>
</body>
</html>
