
	<div class="row justify-content-center align-items-center" style="height: 20vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert">
				  		<i id="messageBody"></i>
				</div>
		</div>
	</div>

	<div class="row justify-content-center align-items-center" style="height: 20vh; margin: 0;">
		<div>
			<h3>Check a Student Result</h3>
			<br>
			<form onsubmit="getResult()">
				Enter the Register Number : <input type="number" id="regno" min="1001"
					max="1100" required autofocus /><br> <br> <input
					type="submit" class="btn btn-primary" value="Enter" /> <input
					type="reset" class="btn btn-primary"> <br> <br> <br>
		
				<div id="cbody"></div>
			</form>
		</div>
	</div>
<script>
function getResult() {

	event.preventDefault();
	// step 1: Get form values
	let regNo = document.getElementById("regno").value;

	//send ajax request
	let formData = "regno="+regNo;
	//var url = server + "/gradingsystem-api/StudentResultServlet?"+formData;
	var url =server + "/studentResult?"+formData;
	var resultPromise = $.ajax(url, "GET", formData);
	
	resultPromise.then(function (response) {

		console.log("Ajax entry");
		var msg = response.errMsg;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#messageBody").innerHTML = "<font color='red'>" + msg + "</font>";
			$('#errorMsg').css({'display':'block'});
		}else{ 
			document.querySelector("#messageBody").innerHTML = "<font color='green'><b>Perfect</b></font>";
			$('#errorMsg').css({'display':'block'});
			
	        var list = response.marks;
			var student = response.SD;
		
	        //document.getElementById("studlist").innerHTML = "";
	        cont = "<h4>Result:</h4><br/><h5>Student Name : "+student.studentName+"</h5><h5>Register Number : "+student.regNo+"</h5><br>";
	
	        for (let marks of list) {
	            cont += "<h5>"+marks.subject.code+" : "+marks.mark+"</h5>";
	        }
	
	        cont += "<br><h5>OverAll Percentage : "+student.avg+"</h5><h5>Grade : "+student.grade+"</h5>";
	
	        var list = document.getElementById("cbody");
	        list.innerHTML = cont; 
		}
    });
}

</script>
