<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!-- starRating CSS -->
<link rel="stylesheet" type="text/css" href="/resources/star.css" />
 
<div class="main">
  <div class="col-sm-12 col-md-12" style="margin-top: 50px;">
    
    
    <!-- 위에는 영화 평점+리뷰 리스트가 나와야함 -->
    <div class="row">
      <div class="col-sm-offset-2 col-sm-8 text-right">
        <label>영화검색기</label>
        <input id="searchMovie" type="text"><button id="searchBtn">검색</button>
      </div>
    </div>
    
    <div class="row">
      <div class="col-sm-offset-2 col-sm-8">
    	영화뿌리는 공간
   	  </div>
    </div>
    
    <div class="row" style="margin-bottom:50px; display:none;">
      <div class="col-sm-offset-2 col-sm-8">
		<span class="star-input">
		  <span class="input">
		    <input type="radio" name="star-input" value="1" id="p1">
		    <label for="p1">0.5</label>
		    <input type="radio" name="star-input" value="2" id="p2">
		    <label for="p2">1.0</label>
		    <input type="radio" name="star-input" value="3" id="p3">
		    <label for="p3">1.5</label>
		    <input type="radio" name="star-input" value="4" id="p4">
		    <label for="p4">2.0</label>
		    <input type="radio" name="star-input" value="5" id="p5">
		    <label for="p5">2.5</label>
		    <input type="radio" name="star-input" value="6" id="p6">
		    <label for="p6">3.0</label>
		    <input type="radio" name="star-input" value="7" id="p7">
		    <label for="p7">3.5</label>
		    <input type="radio" name="star-input" value="8" id="p8">
		    <label for="p8">4.0</label>
		    <input type="radio" name="star-input" value="9" id="p9">
		    <label for="p9">4.5</label>
		    <input type="radio" name="star-input" value="10" id="p10">
		    <label for="p10">5.0</label>
		  </span>
		  <output for="star-input"><b>0</b>점</output>						
		</span>
   	  </div>
    </div>
    
    <div class="row">
      <div class="col-sm-offset-2 col-sm-8">
      	<label>Comment</label>
    	<div style="border: 1px solid grey; width: 100%; height: 100px;"
    			contenteditable="true">
    	</div>
    	<div class="text-right">
    	  <button class="text-right" id="reviewBtn">등록</button>
    	</div>
   	  </div>
    </div>
    
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/star.js"></script>
<script>
$(document).ready(function(){
	
	$("#searchBtn").on("click",function(e){
		var _searchMoive = $("#searchMovie");
		console.log("search............");
		console.log(_searchMoive.val());
		
		$.getJSON("")
		
	});
	

});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>