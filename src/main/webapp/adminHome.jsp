	<div class="row justify-content-center align-items-center"
		style="height: 30vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert">
				  		<i id="messageBody"></i>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    	<span aria-hidden="true">&times;</span>
				  </button>
				</div>
		</div>
	</div>
	<div style="text-align:center">
		<div class="headerContainerWrapper"></div>
			<div class="bodyContainerWrapper">
				<div class="bodyContainer">
					<div class="padding">	
						<div class="row justify-content-center align-items-center" style="height: 30vh; margin: 0;">
							<div>
								<a href="?pageName=define_score_range.jsp" class="transparent_btn red" style="font-size: large;">Define Score Range</a><br> <br>
								<a href="?pageName=view_score_range.jsp" class="transparent_btn blue" style="font-size: large;">View Score Range</a><br> <br>
								<a href="" class="transparent_btn yellow" onsubmit="deleteFunc()" style="font-size: large;">Delete All Score Range</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	
<script>
	
		function deleteFunc() {
			  var txt;
			  if (confirm("Are you sure, Do you want to delete the score Ranges?")) {
					event.preventDefault();
				  	var url = "http://localhost:8080/gradingsystem-api/DeleteScoreRangeServlet";
				  	var deletePromise = $.get(url);
					
				  	deletePromise.then(function (response) {
						console.log("Error:" + JSON.parse(response).message);
						var status = JSON.parse(response).message;
						console.log(status);
						
						if(status == "success"){
							document.querySelector("#messageBody").innerHTML = "<font color='green'>Score range deleted successfully.</font>";
							$('#errorMsg').css({'display':'block'});
							txt = "Score range deleted successfully";
						}else{
							document.querySelector("#messageBody").innerHTML = "<font color='red'>"+status+"</font>";  
							$('#errorMsg').css({'display':'block'}); 
						}

					});
					  
			  } else {
			    txt = "Delete Score Range Canceled!";
			    alert(txt);
			  }
		}
</script>