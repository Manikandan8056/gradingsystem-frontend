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
                    <h4 class="modal-title">Profile</h4>
                    <button type="button" class="close" href="adminHome.jsp" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="registermsg" align=center style="color: red;"></div>
	                    <form method="post" onsubmit="AddNewEmployee()">
	                        <div class="form-group">
	                            <input type="text" class="form-control" autocomplete="off" name="name"
	                                id="name" placeholder="employee name" required="required" >
	                        </div>
	                        <div class="form-group">
	                            <input type="email" class="form-control" autocomplete="off" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
	                            title="Enter valid email id" placeholder="email" disabled required="required" >
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
	                        	<label class="radio" disabled>
	                            	<input type="radio" class="form-group" name="role" id="role" value="A" disabled required><span id="role">&nbsp;Admin</span>&nbsp;
								</label>
								<label class="radio" disabled>
									<input type="radio" class="form-group" name="role" id="role"  value="T" checked disabled required><span id="role">&nbsp;Teacher</span>
	                        	</label>
	                        </div>
	                        
	                        <div class="form-group" align=center>
	                            <button type="submit" class="btn btn-primary btn-xs">Save
	                                </button>
	                            &nbsp;
	                            <button type="reset" class="btn btn-secondary btn-xs">Cancel</button>
	                        </div>                    
	                    </form>
                </div>            
            </div>
        </div>
    </div>
<script>msg();</script>