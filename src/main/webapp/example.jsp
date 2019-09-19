<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script>

        $(document).ready(function () {
            console.log('Jquery');
            liststudent();
        });

        function getname() {
            event.preventDefault();
            console.log("btn")
            var name = document.getElementById("name").value;

            document.write(name);
            console.log(name);
        }

        function liststudent() {

            var url = "http://localhost:8081/bankapp-web/StudentByGradeServlet?grade=C";
            $.getJSON(url, function (response) {
                var list = response;
                //document.getElementById("studlist").innerHTML = "";
                cont = "<table class='table'><thead><tr><th>Reg-No</th><th>StudentName</th><th>Average</th><th>Grade</th></tr></thead><tbody>";

                for (let users of list) {
                    cont += "<tr><td>";
                    cont += users.regNo;
                    cont += "</td><td>";
                    cont += users.studentName;
                    cont += "</td><td>";
                    cont += users.avg;
                    cont += "</td><td>";
                    cont += users.grade;
                    cont += "</td></tr>";
                }

                cont += "</tbody></table>";

                var list = document.getElementById("tbody");
                list.innerHTML = cont;
            });
        }

    </script>
</head>

<body>
	<form onsubmit="liststudent()">
		name : <input type="text" class="name" name="name" id="name"
			placeholder="UserName" required autofocus /> <br>
		<button type="submit">Login</button>
	</form>

	<div id="tbody"></div>
</body>

</html>