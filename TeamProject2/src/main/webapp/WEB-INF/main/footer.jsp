<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <li><a href="${vo.link }" target="_blank" style="color: yellow;">${vo.title }</a></li>
            <br>
          </c:forEach>
        </ol>
      </div>
      <div class="one_third">
      <h1 class="font_title" style="color: white; margin-top: -5px;">추천 관광지</h1>
        <c:forEach var="vo" items="${locationList }">
        <div class="col-md-4">
	      <div class="thumbnail">
	        <a href="#">
	          <img src="${vo.poster }" alt="Lights" style="width:100%">
	          <div class="caption">
	            <p>${vo.title }</p>
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
          <div class="block clear"><a href="#"><i class="fas fa-phone"></i></a> <span><strong>Give us a call:</strong> +00 (123) 456 7890</span></div>
        </li>
        <li class="one_quarter">
          <div class="block clear"><a href="#"><i class="fas fa-envelope"></i></a> <span><strong>Send us a mail:</strong> support@domain.com</span></div>
        </li>
        <li class="one_quarter">
          <div class="block clear"><a href="#"><i class="fas fa-clock"></i></a> <span><strong> Monday - Saturday:</strong> 08.00am - 18.00pm</span></div>
        </li>
        <li class="one_quarter">
          <div class="block clear"><a href="#"><i class="fas fa-map-marker-alt"></i></a> <span><strong>Come visit us:</strong> Directions to <a href="#">our location</a></span></div>
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