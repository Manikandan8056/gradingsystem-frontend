
<div class="img" style="height: 92vh;">

	<div class="row justify-content-center align-items-center" style="height: 80vh; margin: 0;">
		
		<div class="col-md-6">
			<div style="display:none;" id="errorMsg" class="alert alert-danger alert-dismissible fade show" role="alert">
			  		<i id="messageBody"></i>
			</div>
		</div>
		
		<div class="w-100"></div>
		
		<div class="col-md-6 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0, 0, 0, 0.5); border-radius: 10px; height:55vh;">
			<form class="mx-auto formstyle"  onsubmit="adminLogin()" style="font: message-box;opacity: 0.8;border-radius: 10px;background-color: black;color: white;padding:0 20px;">
				<div class="row justify-content-center align-items-center" style="height:300px">
					<div class="col">
						<h3>Admin Login</h3>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											AdminName
										</div>
									</div>
									<input type="text" autocomplete="off" id="username" class="form-control"  pattern="[A-Za-z]{1,20}$" title="Enter only alphabets and less than 20 letter" placeholder="UserName" required autofocus>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											Password
										</div>
									</div>
									<input type="password" id="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
	                            title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" placeholder="Password">
								</div>
							</div>
							<input type="submit" class="btn btn-primary" value="Login"> 
							<input type="reset" class="btn btn-primary" ><br><br>
							<a href="index.jsp" >Back</a>
					</div>
				</div>
			</form>
		</div>
	</div>

<script>
function adminLogin() {

	event.preventDefault();
	// step 1: Get form values
	let userName = document.getElementById("username").value;
	let passWord = document.getElementById("password").value;
	
	// prepare formdata
	let formData = "username="+userName + "&password="+passWord;	
	//send ajax request
	//var url = server + "/gradingsystem-api/AdminLoginServlet?"+formData ;
	var url = server + "/admin/login?"+formData ;
	var login = $.post(url);
	
	login.then(function (response) {

		var data = response; //JSON.parse(response)
		console.log(data);
		
			document.querySelector("#messageBody").innerHTML = "<font color='green'>You are successfully Logged in.</font>";
			$('#errorMsg').css({'display':'block'});
			window.location.replace('adminfeature.jsp')
		
    },
	function(response) {
		console.log("error");	
		console.log(response);
		
		var msg = response.responseJSON.errorMessage;
		console.log(msg);
			document.querySelector("#messageBody").innerHTML = "<font color='red'>" + msg + "</font>";
			$('#errorMsg').css({'display':'block'});
		
	});
}
</script>
</div>