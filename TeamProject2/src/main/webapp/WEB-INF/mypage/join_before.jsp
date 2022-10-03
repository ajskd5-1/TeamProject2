<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	hr {
		
		height: 1px;
		background-color:#353535;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">비밀번호 확인<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABmJLR0QA/wD/AP+gvaeTAAAEsklEQVR4nO2aXYhVVRTHf/fah96shog+INJC7WG0qYZ8uAlKRD5EQVE9mPRgJUEg6oNWPigiaFASFDa9VDCROU8RRB+U00thKBTS+GIGmdnH5Ndkk2gz14d1Nmftw7n3nnPP2nfuOPOHBefO7P1fa+199jp777VgGtOYxjSmMEoTpHcu0A3cpuQWoAuYAVwLlKPfi4ChiTHTDlcCjwL9wHGglkO2TIC9ZqgAm4Dfyee0lkk7+8uAX2jdcS3dbba9MFYBF7BxftItg0eA/7FzflItgxuAYWydd3IUeKZ9rrSG1wjjvJaH2uZNTswEzhB+AIaYuP1LQzxGeOed3GtldNmKCFhiyNUMy62ILrMiAu5K/H4XeBG4M5LbgTmRXI1sd2cjM/ovcAo4CfwMHAEOAN8Ba4ANCe5eQ7vNcIT4Fb0A3GTEWwb24S+Bg0bcphghNnDQmPtB/AE4ZsxvgvPEBr5szF1C9gGOf9SK2DIIXq6erXduNeAz9XuWFbHlAGgcDsD5QwDOYAMwHICzIwOfhg5Slp9Xh1sTOjoOoY27KoQOyz21NirUXt1ch1UMqBrxdLrOuthD/GruDqhnt9KzJ6Ce3NA3vSHv7xYqPccD6smNc8SGVQLqqSg95ywIrWLAr+p5oRFnGhap56MB9eTGe8Qz8wlhNlhl4FOl550AOlrGPcAYsXF9AXT0Kf4x4O4AOgrhFXwD5xtyL8Af4O2G3GYoA3uJjdxlyK1nfy/hzjCF8QCxoefxg1ar6MHPMt1vwBkUXxAbuw//niAvrgD2K77PC1vXBtwBnCU2+s0CXG8pnn+QWDAp8BT+yW1NCxzrEhwrzKxrE/TsjQOrc/R9PuoTIqC2DTfiz+A4sJXGx9gSsC3RrxZxFUUVuU0+DQwgZTpBMY/0tNb7SB4xiZnAB3X6zCtoy3341/Y14A8CD8Ji0p2pAT/iZ3d6kZvkeu0XF7AjzXknAwV4m2K5UjQIvI6/ruvJeNR2UP2tSC7wowa6ToTcUV2nnv8E1gKPIyn0ejgTtVkb9UnjyosVyO4xDf8V4K2LLuAF/FdaR/G5SBwYVf8fRUro5qh2u9T/hyLOrow2VJGyPIcK8BX+7I9geK1WQqrC+vEdc/IhUgCZFTOiPkkeN1DLqP81qSLOnUCKLx30IIwgsaEwbgZeQjJBzdb2AbKltXujts34DiNpcz0QznnX5kv8g1MFiQmFnC8jh54B/IRoFhkD3gauSeGtADvIXmE2Djyr+ldJL9FZX8RZjflIvZ5F8eNvwNOK++EWeDdmcL6G3B32tOr0LGAl8knK8gnLI7r4cUvOvq+qvo2+806+yet4N/I6/m3stJPNKTo3ZuzbT7zuG828k7PA0rwD8Fcgx508kaLzyQz9PiZOvCYDnpnzAF8HHoBh/APO9cjevFGfb4lzDkGdB3gj8ADUgJ1K384mbb9Hqsog25ovvMnRd3uhRM/OkgbtfiKuOAs+8w4l/ISntaRVkQ3WaeucyTrzJjs8kAvJDcAhbGv/k7PvsDSl3SFkMmYjhZRtc77TsJo2vPadjEZng0ve+R6msPPgp8W0nOISXvMax/Ad3w88hwTGKYEdSAFGH5KGN8VFTxuROw+EFnwAAAAASUVORK5CYII="
	 style="height:50px; width:50px"></h1>
     	<hr>
     	<div class="col-md-offset-4">
         <div class="col-md-6">
			<%-- 비밀번호 --%>
			  <h4 class="font_title">비밀번호</h4>
			  <input class="form-control text-center" type="password" size=35 placeholder="비밀번호를 입력하세요" ref=pwd v-model="pwd"><br>
			 
			  
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--확인--%>
			  <div class="text-center">
			    <%-- 확인 --%><input type=button class="btn btn-success" value="확인" v-on:click="ok()">
			    <%-- 취소--%><a href="../main/main.do"><input type=button class="btn btn-warning" value="취소"></a>
			    <br>
			    <div style="margin-top:10px;"><span id="jPrint"></span></div>
			  </div>
    </div>
    </div>
    </div>
    </div>
   <script>
   new Vue({
	   	el:'.container',
	   	data:{
	   		pwd:''
	   	},
	   	methods:{
	   		ok:function(){
	   			if(this.pwd==="")
	   			{
	   			    $('#jPrint').text("비밀번호를 입력해 주세요")
				    $('#jPrint').css("color","red")
	   				this.$refs.pwd.focus();//$('#id명').focus()
	   				return;
	   			}
	   			
	   			// 비밀번호 입력
	   			let _this=this;
	   			//axios.post() axios.get()
	   			axios.get('http://localhost:8080/web/member/join_before_ok.do',{
	   				params:{
	   					pwd:this.pwd
	   				}
	   			}).then(function(result){
	   				let res=result.data;
	   				if(res==='yes')
	   				{
	   					location.href="../member/join_update.do";
	   				}
	   				else
	   				{
	   					 $('#jPrint').text("비밀번호가 틀립니다")
					     $('#jPrint').css("color","red")
	   					_this.pwd="";
	   					_this.$refs.pwd.focus();
	   				}
	   			})
	   		}
	   	}
	   })
   </script>
</body>
</html>