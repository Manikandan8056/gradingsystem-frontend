
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
                    <button type="button" class="close" href="adminHome.jsp" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="messageBody" align=center></div>
	                    <form method="post" onsubmit="addEmployee()">
	                        <div class="form-group">
	                            <input type="text" class="form-control" autocomplete="off" name="name"
	                                id="name" placeholder="employee name" required="required" >
	                        </div>
	                        <div class="form-group">
	                            <input type="email" class="form-control" autocomplete="off" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"  title="Enter valid email id" placeholder="email" required="required" >

	                        </div>
	                        <div class="form-group">
	                            <input type="number" class="form-control" autocomplete="off"  name="mobile" id="mobile"
	                               pattern="[0-9]{1,10}" title="Please enter 10 digits mobile number" placeholder="Mobile Number" required="required" >
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
	                        
	                        <div class="form-group">
								<select id="subject" class="form-control">
									<option value="ENGLISH">ENGLISH</option>
									<option value="MATHS">MATHS</option>
									<option value="PHYSICS">PHYSICS</option>
									<option value="CHEMISTRY">CHEMISTRY</option>
									<option value="COMPUTER">COMPUTER</option>
								</select><br><br>
	                        </div>
	                       
	                        <div class="form-group" align=center>

	                            <button type="submit" class="btn btn-primary btn-xs">Add
	                                </button>
	                            &nbsp;
	                            <button type="reset" class="btn btn-secondary btn-xs">clear</button>

	                            <button type="submit" class="btn btn-primary btn-xs">Add</button>&nbsp;
	                            <button type="reset" class="btn btn-primary btn-xs">clear</button>

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
	let subject = document.getElementById("subject").value;
	// prepare formdata
	let formData = "name="+name + "&email="+mailId+ "&mobno="+mobNo+ "&password="+password+ "&role="+role+ "&subject="+subject;		
	console.log(formData);
	//send ajax request
	var url = server + "/gradingsystem-api/EmployeeServlet?"+formData;
	var registerPromise = $.ajax(url, "GET", formData);
	
	registerPromise.then(function(response) {
		console.log("Error:" + JSON.stringify(response));
		var msg = JSON.parse(response).responseMessage;

		if(msg == "success"){			
			document.querySelector("#messageBody").innerHTML = "<font color='green'>"+ msg +"</font>";
		}else{
			document.querySelector("#messageBody").innerHTML = "<font color='red'>" + msg + "</font>";
		}
	});
}

/* <button class="btn btn-outline-success" onclick="updateMark()">Update</button> */
</script>
	
