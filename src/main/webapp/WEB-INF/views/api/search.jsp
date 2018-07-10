<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>네이버 영화 API 검색 서비스</h2><br /><br />

	<form name="searchForm" action="/api/search" method="POST">

		영화 이름 <input type="text" name="query" /> 
		      <input type="submit" value="검색" />

	</form>


</body>
</html>