<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.container.boardContainer{
  width: 800px;
  height: 800px;
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
  background-color: white;
  border: none;
  color: #333333;
}
td{
  border: none;
  background-color: white;
}
.table{
  border-color: white;
  
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0; // 파일 번호 전역변수 
$(function(){
	$('#writeBtn').on('click',function(){
		let subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			return;
		}
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		$('#frm').submit();
	})
	
	$('#addBtn').click(function(){
		$('#user-table > tbody').append(
			'<tr id="m'+(fileIndex)+'">'
			+'<td width=20%>파일'+(fileIndex+1)+'</td>'
			+'<td width=80%><input type=file name=files['+(fileIndex)+']></td>'
			+'</tr>'
		)
		fileIndex=fileIndex+1;
	})
	$('#removeBtn').click(function(){
		if(fileIndex>0)
			{
				$('#m'+(fileIndex-1)).remove();
				fileIndex=fileIndex-1;
			}
	})
})
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container boardContainer">
    <h3><img src="https://img.icons8.com/cotton/64/000000/commercial--v1.png">
          &nbsp; 관리자님, 공지사항을 작성해주세요.</h3>
    <br><br><br>
    <div class="row">
    <%-- enctype="multipart/form-data" 파일업로드 프로토콜 (생략이되면 파일업로드를 할 수 없다) --%>
      <form method=post action="notice_ok.do" id="frm" enctype="multipart/form-data">
      <table class="table">
       <tr>
         <th width=20% class="text-right" >제목</th>
         <td width=80%>
           <input type=text name="subject" id="subject" size=70 class="input-sm">
         </td>
       </tr>
       <tr>
       	<th width=20% class="text-right">첨부파일</th>
       	<td width=80%>
       		<table class="table">
       			<tr>
       				<td class="text-right">
       					<input type=button value="추가" class="btn btn-xs btn-success" id="addBtn">
       					<input type=button value="취소" class="btn btn-xs btn-primary" id="removeBtn">
       				</td>
       			</tr>
       		</table>
       		<table class="table" id="user-table">
       			<tbody>
       				
       			</tbody>
       		</table>
       	</td>
       </tr>
       <tr>
         <th width=20% class="text-right">내용</th>
         <td width=80%>
           <textarea rows="10" cols="70" name="content" id="content"></textarea>
         </td>
       </tr>
      </table>
      </form>
      <div class="text-center">
          <input type=button value="글쓰기" class="btn btn-sm btn-warning" id="writeBtn">
          <input type=button value="취소" class="btn btn-sm btn-primary"
            onclick="javascript:history.back()">
      </div>
    </div>
  </div>
</body>
</html>