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
		<div class="row justify-content-center align-items-center" style="height: 30vh; margin: 0;">
			
			<div class="vertical-menu">
				<a href="?pageName=define_score_range.jsp" style="text-align-last: center;font-size: large;">Define Score Range</a><br> <br>
				<a href="?pageName=view_score_range.jsp" style="text-align-last: center;font-size: large;">View Score Range</a><br> <br>
				<a href="" onclick="deleteFunc()" style="text-align-last: center;font-size: large;">Delete All Score Range</a>
			</div>
		</div>
	
	
<script>
	
		function deleteFunc() {
			  var txt;
			  if (confirm("Are you sure, Do you want to delete the score Ranges?")) {
					event.preventDefault();
				  	//var url = server + "/gradingsystem-api/DeleteScoreRangeServlet";
				  	var url =server + "/score/deleteScore";
				  	var deletePromise = $.post(url);
					
				  	deletePromise.then(function (response) {
						console.log("Error:" + response.status);
						var status = response.status;
						var error = response.errorMessage;
						console.log(status);
						
						if(status == "success"){
							document.querySelector("#messageBody").innerHTML = "<font color='green'>Score range deleted successfully.</font>";
							$('#errorMsg').css({'display':'block'});
							txt = "Score range deleted successfully";
						}else{
							document.querySelector("#messageBody").innerHTML = "<font color='red'>"+error+"</font>";  
							$('#errorMsg').css({'display':'block'}); 
						}

					});
					  
			  } else {
			    txt = "Delete Score Range Canceled!";
			    alert(txt);
			  }
		}
</script>