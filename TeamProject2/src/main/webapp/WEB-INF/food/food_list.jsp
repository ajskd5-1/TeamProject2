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
<style type="text/css">
.container-fluid{
   margin-top: 50px;
}
.row1{
  margin: 0px auto;
  width:100%
}
.images:hover{
  cursor: pointer;
}
.img{
	position: relative;
}
#text_box{
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
}
.col-md-4{
	padding: 5px;
}
.caption{
	margin-top: 10px;
	text-align:center;
}
</style>
</head>
<body>
  <div class="container">
  <div class="img"> 
    <p> 
   	   <img src="../resources/img/food.jpg" style="width:100%; height:400px;">
   	</p>
       <h1 class="font_title" id="text_box" style="font-size:50px; color:#F3F3F3; font-weight: bold;">맛집</h1>
   </div>
    <div class="row">
      <div class="col-sm-8">
       <div id="food_template">
        <div class="col-md-4" v-for="vo in food_data">
		    <div class="thumbnail">
		        <img :src="vo.poster" alt="Lights" style="width:100%;" class="images" v-on:click="detailData(vo.no)">
		        <div class="caption">
		          <p>{{vo.title }}</p>
		        </div>
		    </div>
		  </div>
       </div>
       <div style="height: 20px"></div>
       <div class="text-center">
         <button class="btn btn-sm btn-warning" v-on:click="prev()">이전</button>
          {{curpage}} page / {{totalpage}} pages
         <button class="btn btn-sm btn-success" v-on:click="next()">다음</button>
       </div>
      </div>
      
      <div class="col-sm-4" v-show="isShow" v-if="isShow===true">
        <table class="table">
          <tr>
            <td class="text-center" v-for="img in food_detail.poster.split('^')">
             <img :src="img" style="width:100%">
            </td>
          </tr>
        </table>
        <div style="height: 10px"></div>
		<table class="table">
          <tr>
           <td colspan="2"><h3>{{food_detail.title}}<span style="color:orange">{{food_detail.score}}</span></h3></td>
          </tr>
          <tr>
	         <td width="30%" style="color:gray">주소</td>
	         <td width="70%">{{food_detail.addr }}</td>
	      </tr>
	       <tr>
	         <td width="30%" style="color:gray">전화번호</td>
	         <td width="70%">{{food_detail.tel }}</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">음식종류</td>
	         <td width="70%">{{food_detail.type }}</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">영업시간</td>
	         <td width="70%">{{food_detail.time }}</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">주차</td>
	         <td width="70%">{{food_detail.parking }}</td>
	       </tr>
	       <tr v-if="food_detail.menu != 'no'">
	         <td width="30%" style="color:gray">메뉴</td>
		         <td width="70%">
		           <ul>
		             <li v-for="m in food_detail.menu.split('^')">{{m}}</li>
		           </ul>
		         </td>
	       </tr>
        </table>
        <br>
        <div id="map" style="width:300px;height:300px;"></div>
      </div>
      
    </div>
  </div>
  <script>
   new Vue({
	 el:'.row',
	 data:{
		 curpage:1,
		 totalpage:0,
		 food_data:[],
		 food_detail:{},
         no:0,
         isShow:false
	 },
	 mounted:function(){
		 console.log("Vue:this="+this)
		 let _this=this;
		 axios.get("http://localhost:8080/web/food/food_list.do",{
			 params:{
				 page:_this.curpage
			 }
		 }).then(function(result){
			 console.log("function=>this="+_this)
			 console.log(result);
			 _this.food_data=result.data;
			 _this.curpage=result.data[0].curpage;
			 _this.totalpage=result.data[0].totalpage;
		 })
	 },
	 methods:{
		 prev:function(){
			 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
			 let _this=this;
			 axios.get("http://localhost:8080/web/food/food_list.do",{
				 params:{
					 page:_this.curpage
				 }
			 }).then(function(result){
				 console.log(result);
				 _this.food_data=result.data;
				 _this.curpage=result.data[0].curpage;
				 _this.totalpage=result.data[0].totalpage;
			 })
		 },
		 next:function(){
			 this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
			 
			 let _this=this;
			 axios.get("http://localhost:8080/web/food/food_list.do",{
				 params:{
					 page:_this.curpage
				 }
			 }).then(function(result){
				 console.log(result);
				 _this.food_data=result.data;
				 _this.curpage=result.data[0].curpage;
				 _this.totalpage=result.data[0].totalpage;
			 })
		 },
		 detailData:function(no){
			 let _this=this;
			 _this.isShow=true
			 // vue.do?fno=1&gno=10
		     /*
		           public String detail(int gno,int fno)
		     */
			 axios.get("http://localhost:8080/web/food/food_detail.do",{
				 params:{
					 no:no
				 }
			 }).then(function(result){
				 console.log(result)
				 _this.food_detail=result.data;
				 if(window.kakao && window.kakao.maps){
				    	_this.initMap();
				    } else {
				    	_this.addScript();
				    }
			 })
			 
		 },
		 addScript:function() {
 			const script = document.createElement('script');
 			script.onload = () => kakao.maps.load(this.initMap);
 			script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ea28e916083d0f3f868b93941a56c62c&libraries=services';
 			document.head.appendChild(script);
		},
 		initMap:function(){
 			let _this = this;
 			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 			    mapOption = {
 			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
 			        level: 3 // 지도의 확대 레벨
 			    };  
 			
 			// 지도를 생성합니다    
 			var map = new kakao.maps.Map(mapContainer, mapOption); 
 			/* global kakao */
 			// 주소-좌표 변환 객체를 생성합니다
 			var geocoder = new kakao.maps.services.Geocoder();
 			
 			// 주소로 좌표를 검색합니다
 			geocoder.addressSearch(this.food_detail.addr, function(result, status) {
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
 			            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + _this.food_detail.title + '</div>'
 			        });
 			        infowindow.open(map, marker);
 			
 			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
 			        map.setCenter(coords);
 			    }  
 			});
 		}
	 }
   })
  </script>
</body>
</html>