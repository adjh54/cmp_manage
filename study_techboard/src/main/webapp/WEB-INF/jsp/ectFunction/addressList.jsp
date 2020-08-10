<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

	$(function(){

		$("input[type=text]").attr("disabled", "true");		// 모든 속성들 disabled


		// 주소 검색 팝업 처리 함수
		$('#jusoPopupBtn').click(function(){

			var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
			
			$(this).parents("a").attr("href", "/ectFunction/jusoPopup");
		});

		
		
	});

	// 주소 검색 팝업에서 제공받은 값들 처리 
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		const address = $("#address").val();

		console.log(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr,jibunAddr,zipNo,admCd,rnMgtSn,bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo)
		
		$("#roadFullAddr").val(roadFullAddr);
		$("#roadAddrPart1").val(roadAddrPart1);
		$("#addrDetail").val(addrDetail);
		$("#roadAddrPart2").val(roadAddrPart2);
		
		$("#engAddr").val(engAddr);
		$("#zipNo").val(zipNo);
	}


</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h1>주소 검색 기능</h1>
			</div>
		
			<table class="table table-bordered">
				<thead>
					<colgroup>
						<col width="30%"/>
						<col width="70%"/>
					</colgroup>		
				</thead>
				
				<tbody>
					<tr>
						<td>주소 검색 버튼</td>
						<td>
							<button id = "jusoPopupBtn">주소 검색</button>
						</td>
					</tr>
					<tr>
						<td>전체 주소</td>
						<td>
							<input type="text" class="form-control" id="roadFullAddr"/>
						</td>
					</tr>
					<tr>
						<td>부분 주소1(한글)</td>
						<td>
							<input type="text" class="form-control" id="roadAddrPart1"/>
						</td>
					</tr>
					<tr>
						<td>부분 주소2(한글)</td>
						<td>
							<input type="text" class="form-control" id="addrDetail"/>
						</td>
					</tr>
					<tr>
						<td>부분 주소3(한글)</td>
						<td>
							<input type="text" class="form-control" id="roadAddrPart2"/>
						</td>
					</tr>
					
					<tr>
						<td>영문 주소</td>
						<td>
							<input type="text" class="form-control" id="engAddr"/>
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td>
							<input type="text" class="form-control" id="zipNo"/>
						</td>
					</tr>
					
				</tbody>
			
			</table>

			<div>
				<a class="btn btn-primary" href="/" role="button">메인으로 이동</a>
			</div>
		</div>
		
	</div>
</body>
</html>