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
<link rel="stylesheet" href="css/counter.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/button.css">
<body>
	
	<jsp:include page="headerAdmin.html"></jsp:include>

<div class="view" id="view">
	 <%
            String pageName = request.getParameter("pageName");
        if(pageName == null || "".equals(pageName.trim()))
        {
        	pageName = "adminHome.jsp";
        }
        %>
        
        <jsp:include page="<%=pageName%>"></jsp:include>
        
</div>

</body>
</html>