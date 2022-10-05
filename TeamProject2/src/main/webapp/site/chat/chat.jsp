<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
.row1{
   width: 400px;
   height: 600px;
   margin: 0px auto;
}
.row{
  height:10px;
}
#chatArea{
  height: 380px;
  overflow-y:auto;
  border: none;
  background-color: #f1f6ff;
  color: navy;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
function connection() // 연결
{
	 // websocket => 웹에서 연결이 되게 만드는 소프트웨어 
	 websocket=new WebSocket("ws://localhost:8080/web/site/chat/chat-ws");
	 websocket.onopen=onOpen;//callback(시스템 자동으로 호출)
	 websocket.onclose=onClose;
	 websocket.onmessage=onMessage;
}
function onOpen(event) // 연결되었을때 처리 
{
	let name=$('#name').val();
	var user = "===== ' " + name +" '";
	var str = user + "님 서버와 연결되었습니다.=====";
	
	$("#recvMsg").append(str+"<br>");
}
function onClose(event) // 퇴장시 처리 
{
	let name=$('#name').val();
	var user = "===== ' " + name +" '";
	var str = user + "님 서버연결이 종료되었습니다.=====";
	
	$("#recvMsg").append(str+"<br>");
}
// roomin , makeroom , roomout
function onMessage(event) // 채팅 메세지 전송시 
{
	let data=event.data;
	if(data.substring(0,4)=="msg:")
	{
		appendMessage(data.substring(4));
	}
	
}
function disconnection() 
{
	//퇴장 버튼 클릭 
	websocket.close(); // onclose()
}
function send()
{
	let name=$('#name').val();
	if(name.trim()=="")
	{
		$('#name').focus();
		return;
	}
	let msg=$('#sendMsg').val();
	if(msg.trim()=="")
	{
		$('#sendMsg').focus();
		return;
	}
	
	websocket.send("msg:["+name+"]"+msg); // onMessage
	$('#sendMsg').val("");
	$('#sendMsg').focus();
}
function appendMessage(msg)// 채팅 문자열 추가
{
	$('#recvMsg').append(msg+"<br>");
	let ch=$('#chatArea').height();
    let m=$('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);
}
$(function(){
	$('#startBtn').click(function(){
		connection();
	})
	
	$('#endBtn').click(function(){
	    disconnection();
    })
    
    $('#sendBtn').click(function(){
	     send();
    })
    
    $('#sendMsg').keydown(function(key){
    	if(key.keyCode==13)
    	{
    	   send();	
    	}
    })
    
})
</script>
</head>
<body>
  <div class="container">
    <div class="row row1">
    <div class="row"></div>
    <div class="text-right"><a href="../board/list.do">
       <img src="https://img.icons8.com/material-outlined/24/000000/back--v1.png"/></a></div>
      <h3 class="text-center" style="margin-top: 0">
        <img src="https://img.icons8.com/color/48/000000/communication.png"/>     
          CHAT</h3>
      <div class="row"></div>
      <table class="table">
       <tr>
        <td>
         <input type=text id="name" size=20 class="input-sm" placeholder="닉네임을 입력해주세요.">
         <input type=button id="startBtn" value="입장" class="btn btn-sm btn-default">
         <input type=button id="endBtn" value="퇴장" class="btn btn-sm">
        </td>
       </tr>
       <tr>
         <td>
	         <div id="chatArea" style="padding: 12px;">
	           <div id="recvMsg"></div>
	         </div>
         </td>
       </tr>
       <tr>
         <td>
           <input type="text" id="sendMsg" size=35 class="input-sm">
           <input type=button id="sendBtn" value="전송" class="btn btn-sm btn-info">
         </td>
       </tr>
      </table>
    </div>
  </div>
</body>
</html>