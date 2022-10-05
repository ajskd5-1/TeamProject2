<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="group btmspace-80">
      <div class="one_third first">
        <h1 class="font_title" style="color: white; margin-top: -5px;">실시간 제주도 뉴스</h1>
        <ol type="1">
          <c:forEach var="vo" items="${newList }" varStatus="s">
            <li><a href="#" target="_blank" style="color: yellow;">${vo.title }</a></li>
            <br>
          </c:forEach>
        </ol>
      </div>
      <div class="one_third">
      <h1 class="font_title" style="color: white; margin-top: -5px;">추천 관광지</h1>
        <c:forEach var="lvo" items="${locationList }">
        <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="../location/detail_before.do?no=${lvo.no }">
	          <img src="${lvo.poster }" alt="Lights" style="width:100%; height: 75.99px;">
	          <div class="caption">
	            <p>${lvo.title }</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    </c:forEach>
      </div>
      <div class="one_third">
      <h1 class="font_title" style="color: white; margin-top: -5px;">추천 맛집</h1>
        <c:forEach var="fvo" items="${foodList }">
        <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="#">
	          <img src="${fvo.poster }" alt="Lights" style="width:100%; height: 75.99px;">
	          <div class="caption">
	            <p>${fvo.title }</p>
	          </div>
	        </a>
	      </div>
	    </div>
	    </c:forEach>
      </div>
    </div>
    <!-- ################################################################################################ -->
    <div id="ctdetails" class="clear">
      <ul class="nospace clear">
        <li class="one_quarter first">
          <div class="block clear font_title">쌍용교육센터</span></div>
        </li>
        <li class="one_quarter">
          <div class="block clear font_title"><h4>이종환  김휘  박지원  서지현</h4></div>
        </li>
        <li class="one_quarter">
          <div class="block clear"><a href="#"><i class="fas fa-map-marker-alt"></i></a> <span><strong>깃허브 주소:</strong><a href="https://github.com/ajskd5-1/TeamProject2">https://github.com/ajskd5-1/TeamProject2</a></span></div>
        </li>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
</body>
</html>