<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
@font-face {
    font-family: 'MaplestoryOTFBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'IM_Hyemin-Bold';
}
.font_title{
	font-family: 'MaplestoryOTFBold';
}
</style>
</head>
<body>
  <center>
     <table border=1 bordercolor=black width=900 height="700">
      <tr>
        <td width=100% height=100 colspan="2"><tiles:insertAttribute name="header"/></td>
      </tr>
      <tr>
         <td width=30% height="500"><tiles:insertAttribute name="menu"/></td>
         <td width=70% height=500><tiles:insertAttribute name="content"/></td>
      </tr>
      <tr>
         <td width=100% height=100 colspan="2"><tiles:insertAttribute name="footer"/></td>
      </tr>
    </table>
  </center>
  
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>