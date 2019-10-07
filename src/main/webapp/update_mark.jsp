	
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
			<h3>Update Student Marks</h3>
			<br>
			<form onsubmit="insertMarks()">
				Enter the Register Number : <input type="number" id="regno" min="1000" max="1100" required autofocus /><br><br>
				Enter the Mark for ENGLISH : <input type="number" id="english" min="0" max="100" required><br><br>
				Enter the Mark for MATHS : <input type="number" id="maths" min="0" max="100" required><br><br>
				Enter the Mark for PHYSICS : <input type="number" id="physics" min="0" max="100" required><br><br>
				Enter the Mark for CHEMISTRY : <input type="number" id="chemistry" min="0" max="100" required><br><br>
				Enter the Mark for COMPUTER : <input type="number" id="computer" min="0" max="100" required><br><br>
				<input type="submit" class="btn btn-primary" value="Submit" />
				<input type="reset" class="btn btn-primary">
			</form>
		</div>
	</div>
<script>
function insertMarks() {
	
	event.preventDefault();
	// Get form values
	let regno = document.getElementById("regno").value;
	let mark1 = document.getElementById("english").value;
	let mark2 = document.getElementById("maths").value;
	let mark3 = document.getElementById("physics").value;
	let mark4 = document.getElementById("chemistry").value;
	let mark5 = document.getElementById("computer").value;
	// prepare formdata
	let formData = "regno="+regno + "&mark1="+mark1+ "&mark2="+mark2+ "&mark3="+mark3+ "&mark4="+mark4+ "&mark5="+mark5;		
	console.log(formData);
	//send ajax request
	var url = server + "/updateMark?"+formData;
	var registerPromise = $.ajax(url, "GET", formData);
	
	registerPromise.then(function(response) {
		console.log("Error:" + JSON.stringify(response));
		var msg = JSON.parse(response).responseMessage;

		if(msg == "success"){			
			document.querySelector("#messageBody").innerHTML = "<font color='green'>Reg-No :<b>"+regno+"</b> Mark is Updated</font>";
			$('#errorMsg').css({'display':'block'});
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='red'>" + msg + "</font>";
			$('#errorMsg').css({'display':'block'});
		}
	});
}

/* <button class="btn btn-outline-success" onclick="updateMark()">Update</button> */
</script>
