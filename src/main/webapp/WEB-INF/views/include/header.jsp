<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Header 시작 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Movie Village</title>
<!-- CSS -->
<link href="/resources/bootstrap-3.3.2/dist/css/bootstrap.css" rel="stylesheet">
<link href="/resources/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
  	  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	  crossorigin="anonymous"></script>
</head>

<style>
/* ul li{
list-style: none;
}
*/
.navbar-nav>li:hover{
background-color:#eee;
}
.navbar .navbar-collapse {
  text-align: center;
  background-color: white;
}
.navbar .navbar-nav {
  margin: 0.5%;
  display: inline-block;
  float: none;
  vertical-align: center;
  font-weight: bold;
  text-align: center;
}
.navbar-inverse .navbar-nav>li>a{
	color: lightskyblue;
}

@font-face {
	font-family: 'InterparkGothicBold';
	src: url("/resources/InterparkGothicBold.ttf") format('truetype');

}
body{
	font-family: InterparkGothicBold;
}

</style>
<body>
	<!-- Body 시작 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: white;">
		<ul class="nav text-right" style="list-style: none; background-color: white;">

		<c:choose>
		  <c:when test="${pageContext.request.userPrincipal.name eq null}">
		  	<li style="float: right;"><a href="/login">Sign in</a></li>
			<li style="float: right;"><a href="/signup">Sign up</a></li>	
		  </c:when>
		  <c:otherwise>
		  	<li style="float: right;"><a class="logout">로그아웃</a></li>	
		  	<li style="float: right;"><a id="mid" href="#">${pageContext.request.userPrincipal.name}님</a></li>
		  </c:otherwise>
		</c:choose>				
		</ul>
		
	<div class="container-fluid" style="background-color: white; border-top: solid 1px #e5e5e5; border-bottom: solid 1px #e5e5e5;">
		
		<div class="navbar-header">	
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar" style="background-color: black;">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
				
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav" style="font-size: 18px;">
				<li><a href="/index">Home</a></li>
				<li><a href="/board/list">Board</a></li>
				<li><a href="/photo/list">Gallery</a></li>
				<li><a href="#">About us</a></li>
				<li><a href="/mailForm">Q&A</a></li>					
			</ul>
		</div>
	</div>				
</nav>
<script>
$(document).ready(function(){
	
	var Obj = $("#loginform");
	
	$("ul").on("click",".logout",function(e){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href = "/logout";
		}
	});
});
</script>
	<!-- Header 끝 -->