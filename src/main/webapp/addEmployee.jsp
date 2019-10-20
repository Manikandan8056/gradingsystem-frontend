
<script>
 function msg()  
{  
     $("#myModal").modal();
}  
</script>

    <div id="myModal" class="modal fade">
        <div class="modal-dialog modal-login">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Employee</h4>
                    <button type="button" class="close" onClick="window.location='?pageName=adminHome.jsp';" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="messageBody" align=center></div>
	                    <form method="post" onsubmit="addEmployee()">
	                        <div class="form-group">
	                            <input type="text" class="form-control" autocomplete="off" name="name"
	                                id="name" pattern="[A-Za-z]{1,20}$" title="Enter only alphabets and less than 20 letter" placeholder="employee name" required="required" >
	                        </div>
	                        <div class="form-group">
	                            <input type="email" class="form-control" autocomplete="off" name="email" id="email"  pattern="[a-z0-9._%+-]+@[a-z-]+\.[a-z]{2,}$"
	                            title="Enter valid email id" placeholder="email" required="required" >

	                        </div>
	                        <div class="form-group">
	                            <input type="number" class="form-control" autocomplete="off"  name="mobile" id="mobile"
	                               pattern="[6-9]{1}[0-9]{9}" title="Enter 10 digits mobile number, Phone number with 7-9 and remaing 9 digit with 0-9" 
	                               placeholder="Mobile Number" required="required" >
	                        </div>
	                        
	                        <div class="form-group">
	                            <input type="password" class="form-control" autocomplete="off" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
	                            title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" 
	                            placeholder="set your password" required>
	                        </div>
	                        
	                        <div class="form-group" style="text-align-centre">
	                            <input type="radio" class="form-group" name="role" id="role" value="A" required><span id="role">&nbsp;Admin</span>&nbsp;
								<input type="radio" class="form-group" name="role" id="role"  value="T" required><span id="role">&nbsp;Teacher</span>
	                        </div>
	                        
	                        <div class="form-group" align=center>

	                            <button type="submit" class="btn btn-primary btn-xs">Add</button>&nbsp;
	                            <button type="reset" class="btn btn-secondary btn-xs">clear</button>

	                        </div>                    
	                    </form>
                </div>            
            </div>
        </div>
    </div>
<script>msg();</script>

<script>
function addEmployee() {
	
	event.preventDefault();
	// Get form values
	let name = document.getElementById("name").value;
	let mailId = document.getElementById("email").value;
	let mobNo = document.getElementById("mobile").value;
	let password = document.getElementById("password").value;
	let role = document.getElementById("role").value;
	// prepare formdata
	let formData = "name="+name + "&email="+mailId+ "&mobno="+mobNo+ "&password="+password+ "&role="+role;		
	//send ajax request
	var url = server + "/admin/addEmployee";
	var registerPromise = $.post(url, formData);
	
	registerPromise.then(function(response) {
		console.log("Error:" + JSON.stringify(response));
		var msg = response.status;
		
			document.querySelector("#messageBody").innerHTML = "<font color='green'>Successfully added</font>";
	},
	function(response) {
		console.log("error");	
		console.log(response);
		
		var msg = response.errorMessage;
		console.log(msg);
			document.querySelector("#messageBody").innerHTML = "<font color='red'>" + msg + "</font>";
			$('#errorMsg').css({'display':'block'});
		
	});
}

/* <button class="btn btn-outline-success" onclick="updateMark()">Update</button> */
</script>
	
