<!-- 
<head>
<meta charset="ISO-8859-1">
<title>List of Student based on grading</title>
</head> -->

<div>
	<h2>List of Student based on Grading (Top-Bottom)</h2>
	<br />
	<div id="tbody"></div>
</div>
<script>
function listStudent() {
	//send ajax request
	//var url = server + "/gradingsystem-api/GradeWiseListServlet";
	var url =server + "/grade/gradeWiseList";
	
	var listPromise = $.ajax(url, "GET");
	
	listPromise.then(function (response) {

		var msg = response.errMessage;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#message").innerHTML = "<font color='red'>" + msg + "</font>";
		}else{
		        var list = response;
		        //document.getElementById("studlist").innerHTML = "";
		        cont = "<table class='table table-hover table-bordered table-striped'><thead><tr><th>S.No</th><th>Student Name</th><th>Register Number</th><th>Percentage ( % )</th><th>Grade</th></tr></thead><tbody>";
		
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

 listStudent();
 </script>
 
