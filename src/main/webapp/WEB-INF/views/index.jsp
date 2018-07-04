<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link href="/resources/carousel.css" rel="stylesheet">
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap-3.3.2/dist/js/bootstrap.min.js"></script>

<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/resources/bootstrap-3.3.2/docs/assets/js/vendor/holder.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/resources/bootstrap-3.3.2/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
<style>
.movimg {
	margin-bottom : 5px;
}
.wrap_desc{
	left:0;
	top:0;
	z-index:1000;
	width:50%;
	height:290px;
	padding-top:24px;
	opacity:1;
}
</style>

<!-- Carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" role="listbox" style="margin-bottom: 10px;">
		<div class="item active" >
			<img class="first-slide"
				src="https://www.suyongso.com/files/attach/images/115/733/477/014/9060e163a43cd0a58f88813dbf53d12a.png"

				alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>What's your name?</h1>
					<p>
						<code>Sign up and let me know your name.</code>
					</p>
					<p>
						<a style="color: white" href="/signup">회원가입페이지 이동</a>
					</p>
				</div>
			</div>
		</div>
		<div class="item">
			<img class="second-slide"
				src="https://2.bp.blogspot.com/-eSC4Gupz5ns/WNCnusetmrI/AAAAAAAAAQg/oG3xz6lXO7UZuzJYgqTE4_cX3-Bxl0biwCLcB/s1600/%25EB%2584%2588%25EC%259D%2598%2B%25EC%259D%25B4%25EB%25A6%2584%25EC%259D%2580%2B%25EB%25B0%25B0%25EA%25B2%25BD%25ED%2599%2594%25EB%25A9%25B4%2B%25EA%25B3%25A0%25ED%2599%2594%25EC%25A7%2588-2.jpg"
				alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Reviews of movies</h1>
					<p><code>Please write a movie review.</code></p>
					<p>
						<a style="color: white;" href="/board/list" role="button">게시판 이동</a>
					</p>
				</div>
			</div>
		</div>
		<div class="item">
			<img class="third-slide"
				src="http://mblogthumb3.phinf.naver.net/MjAxNzExMjZfNjEg/MDAxNTExNzA4Mjk1NTYy.4SXS_LsnEU28hSmgwnyu0KAhwTNGPqWfa7f4kwVuEEog.47VS0GKZACI3hkDdzEhRmm8GgKBq7BvRBeqDanMgjfYg.JPEG.bongdoly123/743487.jpg?type=w2"
				alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Great pictures</h1>
					<p><code>Go to the gallery and watch the pictures.</code></p>
					<p>
						<a style="color: white;" href="/photo/list" role="button">갤러리 이동</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>
	
<!-- youtube media add -->
 <div class="container">
 
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="margin:200px 360px;">    
      <!-- Modal content-->
      <div class="modal-content" style="width:1000px;">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-center">
          <c:if test="${favor ne null}">
				오늘의 추천영화 
		  </c:if></h4>
        </div>
        
        <div class="modal-body">
          <div class="row">
			<div class="col-sm-12 center-block">		
 				<c:forEach items="${favor}" var="Recommend">
				<div class="col-sm-4">
 					<div class="recommend"><img src="${Recommend.image}"></div>
					<div>${Recommend.title}</div>
					<div>${Recommend.genre}</div>
					<div>감독 : ${Recommend.director}</div>
					<div>제작 국가 : ${Recommend.country}</div>
				</div>		
				</c:forEach>	 	
			</div>
          </div>
        </div>
        
        <div class="modal-footer">
        	<div class="col-sm-12">
        	  <label class="btn btn-primary active pull-left">
        	    <input type="checkbox" value="notToday" name="notToday">
        	    <span class="cr"></span>오늘 하루 이 창을 열지 않습니다
        	  </label>
        	  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	</div>
        	
        </div>
      </div>
      
    </div>
  </div>

</div>



<div class="row">

	<div class="col-sm-12">

		<div class="col-sm-12">
			<h1 style="color: black;">주간 인기영화 </h1>
		</div>
	</div>
									
	<div class="col-sm-12 dec">	
		<c:forEach items="${week}" var="week" begin="0" end="5">
			<div class="col-sm-2">
				<div class="info"><a href="https://${week.infoLink}"><img class="movimg" style="width: 90%;" src="https://${week.img}"></a></div>
				<span style="display:none;"class="wrap_desc">${week.des}</span>
				<div>${week.tit }</div>
				<div>평점 : ${week.grade }</div>
				<div>${week.open }</div>				
			</div>		
		</c:forEach>
	</div>
		
	<div class="col-sm-12">
		<div class="col-sm-12">

			<h1 style="color: black;">월간 인기영화 </h1>
		</div>
	</div>	
		
	<div class="col-sm-12">
		<c:forEach items="${month}" var="month" begin="0" end="5">
				<div class="col-sm-2 dec">
					<div class="info"><a href="https://${month.infoLink}"><img class="movimg" style="width: 90%;" src="https://${month.img}"></a></div>
					<div>${month.tit }</div>
					<div>평점 : ${month.grade }</div>
					<div>${month.open }</div>					
				</div>		
		</c:forEach>
	</div>
	
	<div class="col-sm-12">
		<div class="col-sm-12">
			<h1 style="color: black;">연간 인기영화 </h1>
		</div>
	</div>
		
	<div class="col-sm-12">
		<c:forEach items="${year}" var="year" begin="0" end="5">
				<div class="col-sm-2">
					<div class="info"><a href="https://${year.infoLink}"><img class="movimg" style="width: 90%;" src="https://${year.img}"></a></div>
					<div>${year.tit }</div>
					<div>평점 : ${year.grade }</div>
					<div>${year.open }</div>
				</div>		
		</c:forEach>
	</div>
</div>
<script>	
$(document).ready(function(){

	/* $('.info').on("click",function(e){

	var info = $('info');
>>>>>>> a1c150011f9b3772a56522aa51250a29e961fd98
	$('.info').on("click",function(e){
		e.preventDefault();
		var infosrc = $(e.target)[0].parentElement.href;
		console.log(infosrc);		
	}); */
	
	/* $(".movimg").mouseenter(function(e){
		e.stopPropagation();
		var img = $(e.target);
		
		if(img.attr('class') == 'movimg') {
			img.css('display','none');
			img.closest('div').siblings('.wrap_desc').css("display","block");
			}; 
	});
		
	$(".movimg").mouseleave(function(e){
		e.stopPropagation();
		var target = $(e.target);
		if(target.closest('span').attr('class') == 'wrap_desc') {
			
			var img = target.closest('div').find('img');
			console.log(img[0]);
			img.css("display","block");
			target.closest('span').css("display","none");		
		};	
	}); */
	
	(function() {
		var name = '${prin}';
		if(name != "") {
<<<<<<< HEAD
			console.log($("#myModal"));
=======
>>>>>>> a1c150011f9b3772a56522aa51250a29e961fd98
			$("#myModal").modal();
		}
	})();
});
</script>	
    <!-- Wrap the rest of the page in another container to center all the content. -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>