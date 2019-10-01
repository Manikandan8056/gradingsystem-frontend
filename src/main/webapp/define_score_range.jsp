
	
	<div class="row justify-content-center align-items-center"
		style="height: 20vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert">
				  		<i id="messageBody"></i>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    	<span aria-hidden="true">&times;</span>
				  </button>
				</div>
		</div>
	</div>
	
	<div class="row justify-content-center align-items-center" style="height: 20vh; margin: 0;">
		<div>
			<h3>Define Score Range</h3><br>
				<form onsubmit="updateRange()">
					Enter the Grade : <input type="text" id="grade" required autofocus style="width: 17vh"><br>
					<br> 
					Enter Minimum Score : <input type="number" id="min" min="0" max="100" required><br>
					<br> 
					Enter Maximum Score : <input type="number" id="max" min="0" max="100" required><br>
					<br> 
					<div>
						<input type="submit" class="btn btn-primary" value="Submit" style="margin: 10px;width: 35vh;"><br>
						<input type="reset" class="btn btn-primary" style="margin: 10px;width: 35vh;">
					</div>
				</form>
		</div>
	</div>


<script>
function updateRange() {
	event.preventDefault();
	// Get form values
	let gradeRange = document.getElementById("grade").value;
	let minimum = document.getElementById("min").value;
	let maximum = document.getElementById("max").value;
	// prepare formdata
	let formData = "grade="+gradeRange + "&min="+minimum + "&max=" + maximum;		
	console.log(formData);
	//send ajax request
	var url = "http://localhost:8080/gradingsystem-api/DefineScoreRangeServlet?"+formData;
	var registerPromise = $.ajax(url, "GET", formData);
	
	registerPromise.then(function(response) {
		console.log("Error:" + JSON.stringify(response));
		var msg = JSON.parse(response).responseMessage;
		console.log(msg);
		//alert(msg);
		if( msg != undefined ){
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";
			$('#errorMsg').css({'display':'block'});
		}
	});
}

</script>
