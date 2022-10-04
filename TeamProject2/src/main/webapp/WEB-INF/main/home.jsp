<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body id="top">

<div class="wrapper row3">
  <main class="hoc container clear"> 
  
    <!-- <div class="container">
      <div class="row inline">
        <select name="분류" id="ss">
		  <option value="no">선택</option>
		  <option value="location">관광지</option>
		  <option value="food">맛집</option>
		  <option value="board">게시판</option>
	    </select>
        <input type="text" class="input-sm" style="width: 150px;">
        <input type="button" class="btn btn-sm btn-primary" value="검색">
      </div>
    </div> -->
    
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
          <article><a href="#"><i class="fas fa-tablets"></i></a>
            <h6 class="heading">Himenaeos</h6>
            <p>Ac vestibulum rutrum orci augue iaculis nibh quis porta nunc nisi suscipit leo nam ac lacus</p>
            <footer><a class="btn" href="#">More Details</a></footer>
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
    <!-- <nav class="ref-sort">
      <ul>
        <li class="current"><a href="#">Ultricies</a></li>
        <li><a href="#">Curabitur</a></li>
        <li><a href="#">Porttitor</a></li>
        <li><a href="#">Pulvinar</a></li>
      </ul>
    </nav> -->
    <ul class="nospace group ref-img">
      <c:forEach var="vo" items="${list }">
        <li class="one_third"><a class="imgover" href="#"><img src="${vo.poster }"></a></li>
      </c:forEach>
    </ul>
    <footer class="block center"><a class="btn" href="#">View more here</a></footer>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h6 class="heading">Pellentesque consectetuer</h6>
      <p>Felis vitae sapien gravida interdum curabitur eu quam nec est</p>
    </div>
    <div id="latest" class="group">
      <article class="one_third first"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a>
        <div class="excerpt">
          <time datetime="2045-04-03T08:15+00:00"><i class="far fa-calendar-alt"></i> 03<sup>rd</sup> April 2045 @ 15:00pm</time>
          <h6 class="heading">Aliquam volutpat donec posuere</h6>
          <ul class="meta">
            <li><i class="fas fa-user rgtspace-5"></i> <a href="#">Admin</a></li>
            <li><i class="fas fa-tags rgtspace-5"></i> <a href="#">Tag 1</a>, <a href="#">Tag 2</a></li>
          </ul>
          <p>Ornare dolor phasellus ornare dui vel euismod ultrices orci libero pulvinar justo quis condimentum quam.</p>
          <footer><a class="btn" href="#">Full Story</a></footer>
        </div>
      </article>
      <article class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a>
        <div class="excerpt">
          <time datetime="2045-04-02T08:15+00:00"><i class="far fa-calendar-alt"></i> 02<sup>nd</sup> April 2045 @ 15:00pm</time>
          <h6 class="heading">Nisl id ligula pellentesque</h6>
          <ul class="meta">
            <li><i class="fas fa-user rgtspace-5"></i> <a href="#">Admin</a></li>
            <li><i class="fas fa-tags rgtspace-5"></i> <a href="#">Tag 1</a>, <a href="#">Tag 2</a></li>
          </ul>
          <p>Felis nunc interdum vitae pretium ac bibendum vel velit phasellus commodo nullam vitae quam cras auctor.</p>
          <footer><a class="btn" href="#">Full Story</a></footer>
        </div>
      </article>
      <article class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a>
        <div class="excerpt">
          <time datetime="2045-04-01T08:15+00:00"><i class="far fa-calendar-alt"></i> 01<sup>st</sup> April 2045 @ 15:00pm</time>
          <h6 class="heading">Commodo metus proin blandit</h6>
          <ul class="meta">
            <li><i class="fas fa-user rgtspace-5"></i> <a href="#">Admin</a></li>
            <li><i class="fas fa-tags rgtspace-5"></i> <a href="#">Tag 1</a>, <a href="#">Tag 2</a></li>
          </ul>
          <p>Quam molestie luctus vehicula orci massa interdum justo nec rutrum risus augue ut nisl suspendisse elit.</p>
          <footer><a class="btn" href="#">Full Story</a></footer>
        </div>
      </article>
    </div>
    <!-- ################################################################################################ -->
  </section>
</div>
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