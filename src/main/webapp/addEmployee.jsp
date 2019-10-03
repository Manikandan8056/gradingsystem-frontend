<!-- 
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>
function AddNewEmployee(){
    event.preventDefault();
    var name = document.getElementById("name").value;
    var fathername = document.getElementById("fathername").value;
      var email = document.getElementById("email").value;
    var department = document.getElementById("department").value;
    var formData ="name=" + name + "&fathername=" + fathername+ "&email=" + email + "&department=" + department;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/addEmployee.do?"+ formData;
    $.get(url, function(response){
        console.log("AddNewEmployee:"+response);
       var data=JSON.parse(response);
       if(data!=null){
            document.getElementById("registermsg").innerHTML="successfully added.....<br><b>Employee ID:"+data;
           }

     });
    }

function checkEmail(){
    event.preventDefault();
      var email = document.getElementById("email").value;
    var formData ="email=" + email;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/checkEmail.do?"+ formData;
    $.get(url, function(response){
       var data=JSON.parse(response);
       if(data.result){
           document.getElementById("registermsg").innerHTML="email id already exist....";
           document.getElementById("email").focus();
       }
       else
       {
       document.getElementById("registermsg").innerHTML="";
       }
     });
    }

function checkDepartment(){
    event.preventDefault();
      var department = document.getElementById("department").value;
    var formData ="department=" + department;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/checkDepartment.do?"+ formData;
    $.get(url, function(response){
       var data=JSON.parse(response);
       if(data.result==false){
           document.getElementById("registermsg").innerHTML="department doesn't exist....";
           document.getElementById("department").focus();
       }
       else
           {
           document.getElementById("registermsg").innerHTML="";
           }
     });
    }
    
    function checkName()
{
    var name=document.getElementById("name").value;
    var nameRegex= /^[A-Za-z\s]*$/;
    if(nameRegex.test(name))
    {
    document.getElementById("registermsg").innerHTML="";
    }
else
    {
    document.getElementById("registermsg").innerHTML="enter alphabets only";
       document.getElementById("name").focus();
    }
}

function checkFName()
{
    var name=document.getElementById("fathername").value;
    var nameRegex= /^[A-Za-z\s]*$/;
    if(nameRegex.test(name))
    {
    document.getElementById("registermsg").innerHTML="";
    }
else
    {
    document.getElementById("registermsg").innerHTML="enter alphabets only";
       document.getElementById("fathername").focus();
    }
}

    
</script>
</head> -->

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
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="registermsg" align=center style="color: red;"></div>
	                    <form method="post" onsubmit="AddNewEmployee()">
	                        <div class="form-group">
	                            <input type="text" class="form-control" autocomplete="off" name="name"
	                                id="name" placeholder="employee name" required="required" onfocusout="checkName()">
	                        </div>
	                        <div class="form-group">
	                            <input type="email" class="form-control" autocomplete="off" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
	                            title="Enter valid email id" placeholder="email" required="required" onfocusout="checkEmail()">
	                        </div>
	                        <div class="form-group">
	                            <input type="number" class="form-control" autocomplete="off"  name="mobile" id="mobile"
	                               pattern="[0-9]{1,10}" title="Please enter 10 digits mobile number" placeholder="Mobile Number" required="required" onfocusout="checkEmail()">
	                        </div>
	                        
	                        <div class="form-group">
	                            <input type="password" class="form-control" autocomplete="off" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
	                            title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" 
	                            placeholder="set your password" required>
	                        </div>
	                        
	                        <div class="form-group">
	                            <input type="radio" class="form-group" name="role" id="role" value="A" required><span id="role">&nbsp;Admin</span>&nbsp;
								<input type="radio" class="form-group" name="role" id="role"  value="T" required><span id="role">&nbsp;Teacher</span>
	                        </div>
	                        
	                        <div class="form-group">
								<select id="subject" class="form-group">
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
	                            <button type="reset" class="btn btn-primary btn-xs">clear</button>
	                        </div>                    
	                    </form>
                </div>            
            </div>
        </div>
    </div>
<script>msg();</script>
	
