<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body id="top">

<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <section id="introblocks">
      <div class="sectiontitle">
        <h6 class="heading">Quisque adipiscing</h6>
        <p>Urna sed augue class aptent taciti sociosqu ad litora torquent</p>
      </div>
      <ul class="nospace group">
        <li class="one_quarter first">
          <article><a href="#"><i class="fas fa-golf-ball"></i></a>
            <h6 class="heading">Suspendisse</h6>
            <p>Per conubia nostra per mauris aliquet massa nulla facilisi porta ligula non elementum</p>
            <footer><a class="btn" href="#">More Details</a></footer>
          </article>
        </li>
        <li class="one_quarter">
          <article><a href="#"><i class="fas fa-ribbon"></i></a>
            <h6 class="heading">Inceptos</h6>
            <p>Ultricies justo urna egestas metus ut ornare leo augue pharetra risus morbi tincidunt massa</p>
            <footer><a class="btn" href="#">More Details</a></footer>
          </article>
        </li>
        <li class="one_quarter">
          <article><a href="../course/course.do"><i class='fas fa-map-marked-alt' style='font-size:36px'></i></a>
            <h4 class="heading font_title">코스짜기</h4>
            <p>수정하기</p>
            <footer><a class="btn" href="../course/course.do">More Details</a></footer>
          </article>
        </li>
        <li class="one_quarter">
          <article><a href="#"><img src="https://img.icons8.com/color/80/000000/noticeboard.png" style="margin-bottom: 10px;"/></a>
            <h6 class="heading font_title">자유게시판</h6>
            <p>제주도와 관련된 다양한 글을 올리고<br>
            	댓글과 채팅으로 소통하는 공간입니다.</p>
            <footer><a class="btn" href="../board/list.do">자유게시판 더보기</a></footer>
          </article>
        </li>
      </ul>
    </section>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section id="references" class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h1 class="font_title">관광지/레저</h1>
      <p>심심한 여행은 가라! 다양한 관광지/레저 상품으로 나만의 여행 만들어보세요.</p>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section id="references" class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h1 class="font_title">관광지/레저</h1>
      <p>심심한 여행은 가라! 다양한 관광지/레저 상품으로 나만의 여행 만들어보세요.</p>
    </div>
      <c:forEach var="vo" items="${list }">
        <div class="col-md-4">
	    <div class="thumbnail">
	      <a href="../location/detail_before.do?no=${vo.no }">
	        <img src="${vo.poster}" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p class="text-center">${vo.title }</p>
	        </div>
	      </a>
	    </div>
	  </div>
      </c:forEach>
    <footer class="block center"><a class="btn" href="../location/location_list.do">View more here</a></footer>
    <!-- ################################################################################################ -->
  </section>
</div>
<div class="wrapper row3">
  <section id="references" class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h1 class="font_title">추천 맛집</h1>
      <p>맛집 멘트</p>
    </div>
      <c:forEach var="vo" items="${flist }">
        <div class="col-md-4">
	    <div class="thumbnail">
	      <a href="../food/food_list.do">
	        <img src="${vo.poster}" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p class="text-center">${vo.title }</p>
	        </div>
	      </a>
	    </div>
	  </div>
      </c:forEach>
    <footer class="block center"><a class="btn" href="../food/food_list.do">View more here</a></footer>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<div class="container">
  <div class="two_third first">
	  <h2 class="font_title">게시판 인기글 <span class="font_title" style="color: orange;">TOP5</span></h2>
	  <p>게시판에서 조회수가 가장 높은 인기글을 소개합니다. <a href="../board/list.do">'자유게시판' 바로가기</a></p><br>
	  <c:forEach items="${blist }" var="bvo">
		  <div class="alert alert-warning">
		    <span class="font_title">[TOP ${bvo.rownum }]</span>&nbsp;&nbsp;
		    <a  style="color: #161392;" href="../board/detail.do?no=${bvo.no}" class="alert-link">${bvo.subject }</a>
		    &nbsp;&nbsp;&nbsp;&nbsp;(조회수: ${bvo.hit })
		  </div>
	  </c:forEach>
  </div>
  <div class="one_third" >
  	<br><br><br><br><br>
	  <img src="../images/demo/boardjeju3.jpg">
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>

</body>
</html>