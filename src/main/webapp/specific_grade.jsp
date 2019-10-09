
	
	<div class="row justify-content-center align-items-center" style="height: 20vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert" >
				  		<i id="messageBody" style="text-align:center;"></i>
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
	//var url = server + "/gradingsystem-api/StudentByGradeServlet?"+formData;
	var url = server + "/SpecficGradeWiseList?"+formData;

	var listPromise = $.ajax(url, "GET", formData);
	
	listPromise.then(function (response) {

		var msg = response.errMessage;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";
			$('#errorMsg').css({'display':'block'});
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='green'><b>Perfect</b></font>";
			$('#errorMsg').css({'display':'block'});
			
	        var list = response;
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
