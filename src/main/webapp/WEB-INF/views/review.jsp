<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/star.css" />

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">   

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        
        <div class="modal-body">
 		  <div class="row">
  			
  			<div id="showMovie" class="col-sm-offset-1 col-sm-10">
			</div>
	  			
			<div class="row" style="margin-bottom:50px;">
      		  <div class="col-sm-offset-1 col-sm-10">
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
		  		  <output for="star-input"><b id="rating">0</b>점</output>						
			    </span>
   	  		  </div>
    	    </div>
    
    		<div class="row">
      		  <div class="col-sm-offset-1 col-sm-10">
      	        <label>Comment</label>
    			<div style="border: 1px solid grey; width: 100%; height: 100px;"
    			  contenteditable="true" id="comment">
    			</div>
    			<div class="text-right">
    	  		  <button class="text-right" id="reviewBtn">등록</button>
    			</div>
   	  		  </div>
    		</div>
	  		
	      </div>
	    </div>    
	  </div>
	  
	</div>
  </div>
</div>
<!-- Modal end -->
<div class="main" >
  <div class="col-sm-12 col-md-12" style="margin:50px 0px 50px 0px;">      
    
    <!-- 위에는 영화 평점+리뷰 리스트가 나와야함 -->
    <div class="row">
      <div class="col-sm-offset-1 col-sm-10 text-right">
        <label>영화검색기</label>
	    <input id="searchMovie" type="text"><button id="searchBtn">검색</button>    
   	  </div>
    </div>
    
    
    <div class="row reviewList">
      <div class="col-sm-offset-1 col-sm-10 text-center">
    	<table class="table">
    	<tr>
    	<td>번호 </td>
    	<td>사진 </td>
    	<td>평점 </td>
    	<td>후기 </td>
    	<td>글쓴이/등록일</td>
    	</tr>
    	<c:forEach var="list" items="${list}">
    	<tr>
    	<td>${list.vno }</td>    	
    	<td><img src="${list.imgLink }"></td>
    	<td>${list.rating }</td>
    	<th><p style="color: red;">${list.title}</p><p><c:out value="${list.comment}"/></p></th>
    	<th><p style="color: blue;">${list.mid}</p> 
    	    <p><fmt:formatDate value='${list.regdate }' pattern="yyyy.MM.dd"/>
	    	    <c:if test="${list.mid eq pageContext.request.userPrincipal.name}">
	    	    <form id="${list.vno}">
		    	    <input type="hidden" name="${list.vno}"> 
		    	    <button id="removeBtn">삭제</button>
	    	    </form>
	    	    </c:if>
    	    </p>
    	</th>
    	</tr>
    	</c:forEach>
    	</table>
   	  </div>
    </div>
    
    
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
  	  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	  crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	/* naver movie api */
	$("#searchBtn").on("click",function(e){	
		var _searchMoive = $("#searchMovie");
		var _showMovie = $("#showMovie");
		var keyword = _searchMoive.val();
		
		if(keyword == "") {
			alert("검색어를 입력하세요...");
			_searchMoive.focus();
			return false;
		}
		
		_showMovie.html("");				
		$.getJSON("/reviews/"+keyword, function(data){
			console.log(data);
			$(data).each(function(e){
				var str = "";
				if(this.imgSrc == "") {
					this.imgSrc = "https://ssl.pstatic.net/static/movie/2012/06/dft_img203x290.png";
				}
				str =
					"<div class='col-sm-3'>"
					+"<div class='text-center' style='margin-bottom: 5px;'>"
					+"<input type='radio' name='movie_info' data-link='"+this.imgSrc+"'value='"+this.title+"'>"
					+"</div>"
					+"<div><img class='movieImg' src='"+this.imgSrc+"'/></div>"
					+"<div>제 목 : "+this.title+"</div>"
					+"<div>개봉일 : "+this.pubDate+"</div>"
					+"<div>감 독 : "+this.director+"</div>"
					+"<div>유저평점 : "+this.userRating+"</div>"
					+"</div>";
					
				_showMovie.append(str);
			});
		});	
		$("#myModal").modal();
	});
	/* review submit */
	$("#reviewBtn").on("click",function(e){
		var _input = $("input[name=movie_info]:radio:checked").closest('div');
		var imgLink = _input.find('input').data('link');
		var title = _input.find('input').val();
		var rating = $("#rating").text();
		var comment = $("#comment").text();
		var mid = '${pageContext.request.userPrincipal.name}';
		
		$.ajax({
		      type: "post",
		      url : "/review",
		      beforeSend : function(xhr) {
					xhr.setRequestHeader('x-CSRFToken','${_csrf.token}');
			  },
		      dataType : "text",
		      headers : {
		        "content-type" : "application/json",
		        "x-http-method-override" : "post"
		      },
		      data : JSON.stringify({
		        mid : mid,
		        title : title,
		        comment : comment,
		        rating : rating,
		        imgLink : imgLink
		      }),
		      success : function(result) {		
				self.location = "/review";	    
		      }		      
		});
	});
	
	$(".reviewList").on("click","div #removeBtn",function(e){
		
		e.preventDefault();
		var target = e.target;
		var vno = target.parentElement[0].name;

		if(confirm("정말 삭제하시겠습니까?")){
			
		    $.ajax({
			    type : 'delete',
			    url : "/reviews/remove/"+vno,
			    beforeSend : function(xhr) {
					xhr.setRequestHeader('x-CSRFToken','${_csrf.token}');
				},
			    headers : {
			      "Content-Type" : "application/json",
			      "X-HTTP-Method-Override" : "DELETE"
			    },  
			    dataType : 'text',
			    success : function(result){
			    	self.location = "/review";
			      }
			 });		
		}	
	});
    
});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>