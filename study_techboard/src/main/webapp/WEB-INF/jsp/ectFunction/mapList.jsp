<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../js/etcFunction/mapList.js"></script>			<!-- 외부 JS 파일 잡기 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=31izdezatr"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28998e95973b7dcac107d08a1a32ab05"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>지도 표시</h1>
		</div>
		
		
		<table class="table table-bordered">
			<thead>
				<colgroup>
					<col width="20%"/>
					<col width="80%"/>
				</colgroup>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: center;">네이버 지도</td>
					<td><div id="map" style="width:100%;height:400px;"></div></td>
				</tr>
				<tr>
				
					<td style="text-align: center;">카카오 지도</td>
					<td><div id="kakaoMap" style="width:100%;height:400px;"></div></td>
				</tr>
				
			</tbody>
		</table>		
	</div>
</div>

<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);

var container = document.getElementById('kakaoMap'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
</body>
</html>