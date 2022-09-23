<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.container.boardContainer{
  width: 960px;
  height: 1024px;
  margin: 0px auto;
}
.Search {
  border: none;
}
.Search tr{
  background-color: white;
}
.aa{
  border: none;
}
th{
  background-color: inherit;
  border: none;
  color: #333333;
}
td{
  border: none;
}
.table.table-hover{
  border-color: white;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container boardContainer">
      <h1 class="text-center">자유게시판</h1>
      <br><br><br>
      <form action="board/find.do" method="post">
      <table class="Search">
        <tr>
            <td width="60%" class="aa" style="text-align: left;">
              <a href="../board/insert.do" class="btn btn-L btn-primary">게시물 작성</a>
            </td>
            <td width="5%" class="aa"><input type="checkbox" name=fd value="N">이름</td>
            <td width="5%" class="aa"><input type="checkbox" name=fd value="S">제목</td>
            <td width="5%" class="aa"><input type="checkbox" name=fd value="C">내용</td>
            <td width="15%" class="aa"><input type=text name=ss size=40 class="input-sm"></td>
            <td width="10%" class="aa" style="text-align: center;"><button class="btn btn-sm btn-info">검색</button></td>
        </tr>
      </table>
      </form>
      <hr>
      <br><br>
      <table class="table table-hover">
       <thead>
        <tr>
          <th width=10% class="text-center">번호</th>
          <th width=45% class="text-center">제목(댓글수)</th>
          <th width=15% class="text-center">이름</th>
          <th width=20% class="text-center">작성일</th>
          <th width=10% class="text-center">조회수</th>
        </tr>
       </thead>
       <tbody>
       <c:forEach var="vo" items="${list }">
        <tr>
          <td width=10% class="text-center">${vo.no }</td>
          <td width=45%>
            <a href="#">${vo.sbject }<span style="color: gray;"> (${vo.recount })</span></a>
          </td>
          <td width=15% class="text-center">${vo.name }</td>
          <td width=20% class="text-center">${vo.dbday }</td>
          <td width=10% class="text-center">${vo.hit }</td>
        </tr>
        </c:forEach>
       </tbody>
      </table>
    </div>
  </div>
</body>
</html>
<!-- 확성기 링크
https://img.icons8.com/cotton/64/000000/commercial--v1.png
https://img.icons8.com/external-anggara-flat-anggara-putra/32/000000/external-megaphone-ecommerce-interaface-anggara-flat-anggara-putra.png
https://img.icons8.com/tiny-color/16/000000/commercial.png
 -->