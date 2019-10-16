
	
	<div class="row justify-content-center align-items-center"
		style="height: 15vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert">
				  		<i id="messageBody"></i>
				</div>
		</div>
	</div>
	
	<div class="row justify-content-center align-items-center" style="height: 15vh; margin: 0;">
		<div class="form-group">
			<h3>Define Score Range</h3><br>
				<form onsubmit="updateRange()">
					Enter the Grade : <input type="text" id="grade" class="form-control" required autofocus style="width: 17vh"><br>
					Enter Minimum Score : <input type="number" id="min" min="0" max="100" class="form-control" required><br>
					Enter Maximum Score : <input type="number" id="max" min="0" max="100" class="form-control" required><br>
					<div>
						<input type="submit" class="btn btn-primary form-control" value="Submit" style="margin: 10px;width: 35vh;"><br>
						<input type="reset" class="btn btn-secondary form-control" style="margin: 10px;width: 35vh;">
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
	//var url = server + "/gradingsystem-api/DefineScoreRangeServlet?"+formData;
	console.log("server=>"+server);
	var url = server + "/score/defineScore?"+formData;
	var registerPromise = $.ajax(url, "GET", formData);
	
	registerPromise.then(function(response) {
		console.log("success:" + response.infoMessage);
		var msg = response.infoMessage;
		console.log(msg);
		//alert(msg);
		if( msg == "Success" ){
			document.querySelector("#messageBody").innerHTML = "<font color='green'>Successfully updated</font>";
			$('#errorMsg').css({'display':'block'});
		}
	},function(error) {
		var msg = error.responseJSON.errorMessage;
		console.log("Error:" + msg);
		if( msg != undefined ){
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";
			$('#errorMsg').css({'display':'block'});
		}
	});
}

</script>
