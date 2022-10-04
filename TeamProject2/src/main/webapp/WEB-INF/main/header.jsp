<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="bgded overlay" style="background-image:url('../images/demo/backgrounds/제주도배경4.jpg');"> 
  <!-- ################################################################################################ -->
  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1 class="font_title"><a href="../main/main.do">제주도</a></h1>
      </div>
      <!-- ################################################################################################ -->
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="../main/main.do" class="font_title">Home</a></li>
          <li><a class="drop" href="#">Dropdown</a>
            <ul>
              <li><a href="#">Level 2</a></li>
              <li><a class="drop" href="#">Level 2 + Drop</a>
                <ul>
                  <li><a href="#">Level 3</a></li>
                  <li><a href="#">Level 3</a></li>
                  <li><a href="#">Level 3</a></li>
                </ul>
              </li>
              <li><a href="#">Level 2</a></li>
            </ul>
          </li>
          <li><a href="../location/location_list.do">관광지</a></li>
          <li><a href="../food/food_list.do">맛집</a></li>
          <li><a href="../board/list.do">자유게시판</a></li>
          <li><a href="../news/news.do">실시간 뉴스</a></li>
          <c:if test="${sessionScope.id!=null }">
          <li><a href="../course/course.do">코스짜기</a></li>
            <li><a href="../mypage/home.do">마이페이지</a></li>
            <li><a href="../member/logout.do">로그아웃</a></li>
          </c:if>
          <c:if test="${sessionScope.id==null }">
            <li><a href="../member/login.do">로그인</a></li>
            <li><a href="../member/join.do">회원가입</a></li>
          </c:if>
         
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </header>
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <article>
      <h3 class="heading font_title">Gravida ligula pulvinar</h3>
      <p>Sem eu tincidunt magna nulla eu turpis mauris eget ante fusce pharetra sodales arcu sed rutrum ipsum a ipsum.</p>
    </article>
    
    <br>
    <form class="inline text-center" method="post" action="../search/search.do">
      <select name="type" id="type" style="color: black; width: 60px; height: 30px">
		<option value="location">관광지</option>
	    <option value="food">맛집</option>
	  </select>
	  <input type="text" class="input-md" style="color:black; height:30px;" name="ss">
	  <input type="submit" class="btn btn-md btn-info" value="검색">
    </form>
    <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->
</div>
</body>
</html>