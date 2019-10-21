
<title>Fauclty subject allocation</title>

<div class="row justify-content-center align-items-center"
		style="height: 20vh; margin: 0;">
		<div class="col-md-6">
				<div style="display:none;" id="errorMsg" class="alert alert-primary alert-dismissible fade show" role="alert">
				  		<i id="messageBody"></i>
				</div>
		</div>
	</div>
	
<body>
    <div class="row justify-content-center">
        <div class="col text-center">
                <h5>Fauclty subject allocation</h5>
        </div>
        <div class="w-100"></div>
        <div class="col-md-3">
            <form onsubmit="addEmployee()">
            	<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<label for="" class="text-center text-light bg-info form-control">Select Faculty</label>
						</div>
						<select name="" id="facultyData" class="form-control">
              
            			</select><br>
					</div>
				</div>
            
            	<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<label for="" class="text-center text-light bg-info form-control">Choose Subject</label>
						</div>
						<select id="subject" class="form-control">
            
            			</select><br>
					</div>
				</div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-outline-info" onclick="">Add</button>
                <button class="btn btn-outline-secondary" onClick="window.location='?pageName=adminHome.jsp';">Back</button>
            </div>
               </form>
        </div>
 
    </div>
    <script>
    	
		$.getJSON(server+'/user/list', (res) => {
			console.log(res);
			let content = '';
			let staffData = document.getElementById('facultyData');
			for(let data of res)
			{
				content +=  '<option value="'+data.id+'">'+data.name+'</option>';
			}
			staffData.innerHTML = content;
			});

		$.getJSON(server+'/subjectList', (res) => {
			console.log(res);
			let subjectData = document.getElementById('subject');
			let content= '';
			for(let data of res)
			{
				console.log(data);
				//content +=  '<tr><td> '+data.name+'</td><td><input type="radio" id="subject" value="' + data.id + '"/></td></tr>';
				content += "<option value=" + data.id + ">" + data.name + "</option>";
			
			}
			console.log(content);
			subjectData.innerHTML = content;
			});

		function addEmployee(){
			event.preventDefault();
			let staffId = document.getElementById('facultyData').value;
			let subId = document.getElementById('subject').value;
			console.log('staff=>'+staffId);
			console.log('SubjectID=>'+subId);

			let formData = "uid="+staffId + "&sid="+subId;

			var url = server + "/admin/employeeSubject";
			var updatePromise = $.post(url, formData);
			
			updatePromise.then(function(response) {
				console.log(response);
				
				var msg = response;
				console.log(msg);
				
					document.querySelector("#messageBody").innerHTML = "<font color='green'>Successfully Updated </font>";
					$('#errorMsg').css({'display':'block'});
			}, function(response) {
				console.log("error");	
				console.log(response);
				
				var msg = response.responseJSON.errorMessage;
				console.log(msg);
					document.querySelector("#messageBody").innerHTML = "<font color='red'>" + msg + "</font>";
					$('#errorMsg').css({'display':'block'});
				
			});
			}
		
   	</script>
</body>
