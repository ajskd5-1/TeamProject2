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
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
          <td>예약일</td>
        </tr>
        <tr v-for="vo in course_list">
          <td>
            <table class="table">
              <tr>
                <td>{{vo.rday}}</td>
                <td>
                  <input type="text" class="btn btn-sm btn-info" value="상세보기" @click="detail(vo.rday)">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>
    <div class="row" id="detail" v-show="isShow" v-if="isShow===true">
      <table class="table">
        <tr>
          <td>예약일</td>
          <td>장소</td>
          <td>주소</td>
          <td>인원</td>
          <td></td>
        </tr>
        <tr v-for="dvo in course_detail">
          <td>{{dvo.rday}}</td>
          <td>{{dvo.place}}</td>
          <td>{{dvo.addr}}</td>
          <td>{{dvo.inwon}}</td>
          <td><input type="text" class="btn btn-sm btn-warning" value="삭제" @click="delBtn(dvo.no)"></td>
        </tr>
        <tr>
          <td colspan="5">
            <div id="map" style="width:100%;height:350px;"></div>
		  </td>
        </tr>
      </table>
    </div>
  </div>
  <script>
    let a;
    let t;
    let c;
    new Vue({
    	el : '.container',
    	data : {
    		rday : '',
    		course_list:[],
    		course_detail:[],
    		addrs : '',
    		titles : '',
    		isShow : false
    	},
    	mounted : function(){
    		let _this = this;
    		axios.get('http://localhost:8080/web/mypage/my_course_vue.do',{
    			params:{
    				
    			}
    		}).then(function(result){
    			_this.course_list = result.data;
    		})
    		
    	},
    	methods : {
    		detail:function(rday){
    			let _this = this;
    			_this.isShow = true;
    			axios.get('http://localhost:8080/web/mypage/my_course_detail.do', {
    				params : {
    					rday : rday
    				}
    			}).then(function(result){
    				_this.course_detail = result.data;
    				_this.addrs = result.data[0].addrs;
        			_this.titles = result.data[0].titles;
        			a = _this.addrs.split("^");
        			t = _this.titles.split("^");
    				if(window.kakao && window.kakao.maps){
         		    	_this.initMap();
         		    } else {
         		    	_this.addScript();
         		    }
    				alert(c.length);
    			})
    		},
    		delBtn:function(no){
    			axios.get('http://localhost:8080/web/mypage/my_course_delete.do', {
    				params : {
    					no : no
    				}
    			}).then(function(result){
    				location.href="../mypage/my_course.do";
    			})
    		},
    		addScript : function(){
				const script = document.createElement('script');
    			script.onload = () => kakao.maps.load(this.initMap);
    			script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=4361dd205c905a772605200caa3e5d2d&libraries=services';
    			document.head.appendChild(script);
    		},
    		initMap : function(){
    			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    		    mapOption = { 
	    		        //center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    		        center: new kakao.maps.LatLng(33.40139051451825, 126.62293085635457),
	    		        level: 10 // 지도의 확대 레벨
	    		    };
	    		
	    		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    		/* global kakao */
	    		
	    		///////////////////////////////////////////
	    		// 주소-좌표 변환 객체를 생성합니다
	    		var geocoder = new kakao.maps.services.Geocoder();

	    		// 주소로 좌표를 검색합니다
	    		for(let i=0; i<a.length; i++){
	    		geocoder.addressSearch(a[i], function(result, status) {

	    		    // 정상적으로 검색이 완료됐으면 
	    		     if (status === kakao.maps.services.Status.OK) {

	    		    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    		    	
	    		        // 결과값으로 받은 위치를 마커로 표시합니다
	    		        var marker = new kakao.maps.Marker({
	    		            map: map,
	    		            position: coords
	    		        });

	    		        // 인포윈도우로 장소에 대한 설명을 표시합니다
	    		        var infowindow = new kakao.maps.InfoWindow({
	    		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + t[i] + '</div>'
	    		        });
	    		        infowindow.open(map, marker);
	    		        
	    		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    		        //map.setCenter(coords);
	    		    } 
	    		});
	    		}
    		}
    	}
    })
  </script>
</body>
</html>