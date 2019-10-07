
<div class="img" style="height: 92vh;">

	<div class="row justify-content-center align-items-center" style="height: 80vh; margin: 0;">
		
		<div class="col-md-6">
			<div style="display:none;" id="errorMsg" class="alert alert-danger alert-dismissible fade show" role="alert">
			  		<i id="messageBody"></i>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    	<span aria-hidden="true">&times;</span>
			  </button>
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
									<input type="text" autocomplete="off" id="username" class="form-control" placeholder="UserName" required autofocus>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											Password
										</div>
									</div>
									<input type="password" id="password" class="form-control" placeholder="Password">
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
	var url = server + "/gradingsystem-api/AdminLoginServlet?"+formData ;
	var login = $.ajax(url, "GET", formData);
	
	login.then(function (response) {
		console.log(response.errorMessage);
		
		var msg = JSON.parse(response).errorMessage;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#messageBody").innerHTML = "<font color='red'>"+msg+"</font>";  
			$('#errorMsg').css({'display':'block'});
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='green'>You are successfully Logged in.</font>";
			$('#errorMsg').css({'display':'block'});
			window.location.replace('adminfeature.jsp')
		}
    });
}
</script>
</div>