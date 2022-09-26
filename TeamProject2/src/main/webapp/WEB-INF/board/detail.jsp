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
.table {
  border: none;
}
.Search tr{
  background-color: white;
}
.aa{
  border: none;
}
th{
  background-color: white;
  border: none;
  color: #333333;
}
td{
  background-color: white;
  border: none;
}
.table.table-hover{
  border-color: white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container boardContainer">
      <h4 class="text-left">제목 : &nbsp;&nbsp;<span>${vo.subject }</span></h4>
      <br>
      <table class="table">
        <tr>
         <th width=20% class="text-center">번호</th>
         <td width=30% class="text-left">${vo.no }</td>
         <th width=20% class="text-center">작성일</th>
         <td width=30% class="text-left">${vo.dbday }</td>
        </tr>
        <tr>
         <th width=20% class="text-center">작성자</th>
         <td width=30% class="text-left">${vo.name }</td>
         <th width=20% class="text-center">조회수</th>
         <td width=30% class="text-left">${vo.hit }</td>
        </tr>
        <c:if test="${vo.filecount!=0 }">
        	<tr>
        		<th width=20% class="text-center">첨부파일</th>
        		<td colspan="3">
        			<ul>
        				<c:forEach var="fname" items="${fList }" varStatus="s">
        					<li><a href="download.do?fn=${fname }">${fname }</a>(${sList[s.index]}Bytes)</li>
        				</c:forEach>
        			</ul>
        		</td>
        	</tr>
        </c:if>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
           <pre style="white-space: pre-wrap;border:none;background-color: white;">${vo.content }</pre>
          </td>
        </tr>
        
        <tr>
          <td colspan="4" class="text-right">
           <c:if test="${sessionScope.id==vo.name }">
            <a href="update.do?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
            <a href="delete.do?no=${vo.no }" class="btn btn-xs btn-warning">삭제</a>
           </c:if>
            <a href="list.do" class="btn btn-xs btn-success">목록</a>
          </td>
        </tr>
      </table>
      <table>
      
      </table>
        <div class="text-left">
           <p>이전글
           <hr>
           <p>다음글
        </div>
    </div>
</body>
</html>
