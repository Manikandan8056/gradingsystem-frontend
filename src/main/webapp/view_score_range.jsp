<div class="row justify-content-center align-items-center" style="height: 80vh;">
	<div>
		<div class="col-md-12 text-center">
			<h2>Score Range Details</h2>
		</div>
		<div>
			<div id="tbody"></div>
		</div>
	</div>
</div>

<script>
function viewRange() {
	//send ajax request
	//var url = server + "/gradingsystem-api/ViewScoreRangeServlet";
	var url = server + "/viewScore" 
	var viewPromise = $.ajax(url, "GET");
	
	viewPromise.then(function (response) {
		var msg = response.errMessage;
		console.log(msg);

		if(msg != undefined){
			document.querySelector("#message").innerHTML = "<font color='red'>" + msg + "</font>";
		}else{
			var list = response;
	        cont = "<table class='table'><thead><tr><th>S.No</th><th>GRADE</th><th>MINIMUN-RANGE</th><th>MAXIMUM-RANGE</th></tr></thead><tbody>";
			
	        for (let range of list) {
	            console.log(list);
	            cont += "<tr><td></td><td>";
	            cont += range.grade;
	            cont += "</td><td>";
	            cont += range.min;
	            cont += "</td><td>";
	            cont += range.max;
	            cont += "</td></tr>";
	        }
	
	        cont += "</tbody></table>";
	
	        var list = document.getElementById("tbody");
	        list.innerHTML = cont;
	    });
}

 viewRange();
 </script>