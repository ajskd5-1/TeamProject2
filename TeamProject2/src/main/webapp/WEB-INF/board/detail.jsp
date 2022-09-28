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
  height: 1200px;
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
  background-color: inherit;
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
  	  <c:if test="${vo.jeadmin==0 }">
       <h3 class="text-left font_title">제목 : &nbsp;&nbsp;${vo.subject }</h3>
      </c:if>
  	  <c:if test="${vo.jeadmin>0 }">
       <h3 class="text-left font_title"><img src="https://img.icons8.com/cotton/64/000000/commercial--v1.png">
        &nbsp;&nbsp;${vo.subject }</h3>
      </c:if>
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
 	  <div class="text-left">
	       <div class="prev font_title">
	         <c:forEach items="${plist }" var="plist" end="0">
	         	  이전글 &nbsp;&nbsp; <a href="../board/detail.do?no=${plist.no }">${plist.subject }_${plist.no }</a>
	         </c:forEach>
	       </div>
        <hr>
	       <div class="next font_title" style="background-color: inherit;">
	         <c:forEach items="${nlist }" var="nlist" end="0">
	         	  다음글 &nbsp;&nbsp; <a href="../board/detail.do?no=${nlist.no }">${nlist.subject }_${nlist.no }</a>
	         </c:forEach>
	       </div>
      </div>
      <br>
      <div class="comments">
       <table>
            <c:forEach items="" var="rvo">
              <hr>
              <div id="comment-1" class="comment" style="text-align: right; margin: 0px;">
                <c:forEach begin="1" end=""><span style="color:#f1c40f; margin-right: 4px; font-size: 18pt;">★</span></c:forEach></div>
              <div id="comment-2" class="comment" style="margin: 0px;">
                <div class="d-flex" style="margin-bottom: 15px;">
                  <div class="comment-img"><img src="../recipe/image/chef1.png" style="margin:5px 30px 20px 20px; height: 70px; width: 70px; "></div>
                  <div>
                    <h5 style="font-size:15pt; margin-bottom: 5px; font-style: italic; font-weight: bold; color: gray;"></h5>
                    <h5 style="font-size:13pt; margin-bottom: 8px; color: gray;"> <fmt:formatDate value="" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h5>
                    <p style="font-size:14pt; font-weight: bold;">
                      
                    </p>
                    <c:if test="">
                    <div class="button">
                      <input type="button" class="btn btn-primary" style=" border: none;" value="삭제" 
                    	onclick="location.href='../recipe/recipe_review_delete.do?re_no=${rvo.re_no}&cr_no=${vo.cr_no }'">
                      <input id="updateBtn" type="button" class="btn btn-primary" style="background-color: #528e5b; border: none; margin-left: " value="수정"><br>
                    	<div id ="update_tr" class="button" style="margin: 20px 0px; display:none;" >
                    	   <form method="post" id="update_frm" action="../recipe/recipe_review_update.do?re_no=${rvo.re_no}&cr_no=${vo.cr_no }" >
                    		 <input id="update_msg" name="update_msg" type="text" class="form-control" value="${rvo.re_msg}"> 
                    	   </form>
                    	<button type="submit" id="update_ok_Btn" class="btn btn-primary" style="background-color: #e7c04c;margin-top: 10px;border: none">수정하기</button>
                    	<button type="submit" id="update_no_Btn" class="btn btn-primary" style="background-color: #fff;margin-top: 10px; color: black;">취소</button>
                    	</div>
                    </div>	
                    </c:if>
                  </div>
                </div>
              </div><!-- End comment #1 -->
             </c:forEach>
             <br>
              <br>
         <!-- 후기 작성 -->
             <div class="reply-form">
               <h4 class="title">후기 작성</h4><br>
               <div class="star">
				<span style="font-size: 14pt; font-weight: bold;">별점 : </span><select id="selectStar" class="selectStar" name="selectStar" >
					<option value="1"> ★ </option>
					<option value="2"> ★ ★ </option>
					<option value="3"> ★ ★ ★ </option>
					<option value="4"> ★ ★ ★ ★ </option>
					<option value="5"> ★ ★ ★ ★ ★ </option>
				</select> 
			</div>
               <form method="post" action="../recipe/recipe_review_ok.do" name="review_frm" id="review_frm">
                 <div class="row" style="margin-top: 20px;">
                   <div class="col form-group" >
                     <input type="text"  id="re_msg" name="re_msg" class="form-control" placeholder="레시피 후기를 자유롭게 작성해주세요. 별점은 레시피 평가를 위해 사용됩니다.">
                   </div>
                     <input id="re_score" name="re_score" value="1" type="hidden">
                     <input id="re_tno" name="re_tno" value="" type="hidden" >
                     <input id="re_tno" name="re_type" value="1" type="hidden"><!-- type 1은 레시피예요, type 숫자 정해서 value="?" 물음표에 숫자 넣어주시면 됩니다.  -->
                 </div>
              </form>
                 <button type="submit" id="reviewBtn" class="btn btn-primary" style="background-color: #0ea2bd">작성하기</button>
             </div>
         </table>
       </div>

    </div>
</body>
</html>
