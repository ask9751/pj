<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 아이디로 로그인하셨습니당</title>
</head>
<body>
	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h3>네이버 ID로 로그인하셨습니다</h3>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>





<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var name = ${result}.response.name;
		var email = ${result}.response.email;
		var url = "${prevPage}";
		console.log(url);
		$("#name").html("환영합니다. "+name+"님");
		$("#email").html("님 E-mail 주소가는" + email + " 입니다. ㅇㅈ?");
		
		sessionStorage.setItem("naverName",${result}.response.name);
		
		setTimeout("location.href = '" +url +"'", 2000);
	  });
</script>



</body>
</html>