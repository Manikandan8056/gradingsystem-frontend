
	<h2>Score Range Details</h2>
	<br />
	<div id="tbody"></div>

<script>
function viewRange() {
	//send ajax request
	var url = server + "/gradingsystem-api/ViewScoreRangeServlet";
	var viewPromise = $.ajax(url, "GET");
	
	viewPromise.then(function (response) {
        var list = JSON.parse(response);
        //document.getElementById("studlist").innerHTML = "";
        cont = "<table class='table'><thead><tr><th>S.No</th><th>GRADE</th><th>MINIMUN-RANGE</th><th>MAXIMUM-RANGE</th></tr></thead><tbody>";

        for (let range of list) {
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
    }, function(error) {
		console.log("Error:" + JSON.stringify(response));
		var msg = JSON.parse(error).errMessage;
		console.log(msg);
		document.querySelector("#tbody").innerHTML = "<font color='red'>" + msg + "</font>";
	});
}

 viewRange();
 </script>
