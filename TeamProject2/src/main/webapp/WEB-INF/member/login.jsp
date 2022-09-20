<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
   margin:auto;
	margin-top:-150px;
   margin-bottom:50px;
   width:320px;
   height: 200px;
}
</style>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container">
    <div class="row row1">
     <form method="post" action="../member/login_ok.do">
      <table class="table">
        <caption><h3 class="text-center">로그인</h3></caption>
        <tr>
          <td width=30% class="text-right">ID</td>
          <td width=70%>
            <input type=text name=id size=15 class="input-sm">
          </td>
        </tr>
        <tr>
          <td width=30% class="text-right">PWD</td>
          <td width=70%>
            <input type=password name=pwd size=15 class="input-sm">
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit class="btn btn-sm btn-danger" value="로그인">
          </td>
        </tr>
      </table>
     </form>
    </div>
  </div>
  
</body>
</html>









