<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <!-- ################################################################################################ -->
  <h6></h6>
  <nav class="sdb_holder">
    <ul>
      <li>회원 관리
        <ul>
          <li><a href="../member/join_before.do">회원 수정</a></li>
          <li><a href="../member/memberDelete.do">회원 탈퇴</a></li>
        </ul>
      </li>
      <%--
      <li><a href="#">Navigation - Level 1</a>
        <ul>
          <li><a href="#">Navigation - Level 2</a></li>
          <li><a href="#">Navigation - Level 2</a>
            <ul>
              <li><a href="#">Navigation - Level 3</a></li>
              <li><a href="#">Navigation - Level 3</a></li>
            </ul>
          </li>
        </ul>
      </li>
      <li><a href="#">Navigation - Level 1</a></li>
      --%>
    </ul>
  </nav>
  <h3><a href="../mypage/my_course.do" class="font_title">나만의 코스</a></h3>
  <!-- ################################################################################################ -->
</body>
</html>