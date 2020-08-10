<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/offerInfo/cmpOfferInfoInsert.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>제안받은 회사등록</h1>
		</div>
		
		<form class="form-horizontal" id="insertForm">
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="10%">	<!-- 10 -->
						<col width="90%">	<!-- 100 -->
					</colgroup>
				
				<tbody>
					<tr>
						<th class="text-center">회사 명</th>
						<td><input class= "form-control" type="text" id="cmpTitle" name="cmpTitle"/></td>
					</tr>
					
					<tr>
						<th class="text-center">공고 유형</th>
						<td>
							<select class= "form-control" id="cmpRecuritKind" name="cmpRecuritKind">
								<option value="3">헤드헌터</option>
								<option value="4">인사담당자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="text-center">제안 일자</th>
						<td>
							&nbsp;&nbsp;
							<input class="radio-inline" type="radio" name="regDttmTodayYn" id="regDttmToday" value="Y" checked />
							<label class="form-check-label" for="regDttmToday">
								<c:out value="오늘"/>
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="radio-inline" type="radio" name="regDttmTodayYn" id="regDttmOtherDay" value="N" />
							<label class="form-check-label" for="regDttmOtherDay">
								<c:out value="날짜 선택"/>
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input class= "input-inline" type="date" id="regDttm" name="regDttm" disabled="disabled" />
						</td>
					</tr>
					
					<tr>
						<th class="text-center">블록 기업 여부</th>
						<td>
							&nbsp;&nbsp;
							<input class="radio-inline" type="radio" name="cmpBlockYn" id="cmpBlockYes" value="N" checked>
							<label class="form-check-label" for="cmpBlockYes">
								<c:out value="블록 기업이 아님"/>
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="radio-inline" type="radio" name="cmpBlockYn" id="cmpBlockYNo" value="Y">
							<label class="form-check-label" for="cmpBlockYNo">
								<c:out value="블록 기업"/>
							</label>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<c:out value="회사 규모"/>
						</th>
						<td colspan="2">
							<div class="input-group">
								<div class="input-group-addon">회사 설립년도</div>
								<input class= "form-input" type="number" style="text-align: right;" id = "cmpFoundedYear" name="cmpFoundedYear" placeholder="YYYY"/>
								<div class="input-group-addon">년</div>
								
								<div class="input-group-addon">회사 직원수</div>
								<input class= "form-input" type="number" style="text-align: right;" id = "cmpEmpCnt" name="cmpEmpCnt" placeholder="00"/>
								<div class="input-group-addon">명</div>
								
								<div class="input-group-addon">회사 매출액</div>
								<input class= "form-input" type="number" style="text-align: right;" id="cmpTouch" name="cmpTouch" placeholder="00"/>
								<div class="input-group-addon">억</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">회사 종류</th>
						<td>
							<select class= "form-control" id="cmpKind" name="cmpKind">
								<option value="1">중소기업</option>
								<option value="2">중견기업</option>
								<option value="3">대기업</option>
								<option value="4">외국계 기업</option>
								<option value="5">공공기업</option>
							</select>
						</td>
					</tr>
					
					
					<tr>
						<th class="text-center">입사율/퇴사율</th>
						<td>
							<div class="input-group">
								<div class="input-group-addon">입사율:</div>
								<input class= "form-control" type="number" style="text-align: right;" id="cmpIncedenceRate" name="cmpIncedenceRate"/>
								<div class="input-group-addon">%</div>
								<div class="input-group-addon">퇴사율:</div>
								<input class= "form-control" type="number" style="text-align: right;" id="cmpResignationRate" name="cmpResignationRate"/>
								<div class="input-group-addon">%</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="text-center">회사 위치</th>
						<td><input class= "form-control" type="text" id="cmpLocation" name="cmpLocation"/></td>
					</tr>
					
					<tr>
						<th class="text-center">회사 한줄평</th>
						<td><textarea class="form-control" rows="5" id="cmpComment" name="cmpComment"></textarea> </td>
					</tr>
					
				</tbody>
			</table>
		</form>
		<div class="btn-group pull-right">
			<a>
				<button class="btn btn-danger" type="button" id='cmpInfoCancleBtn'>취소</button>
			</a>
			<button class="btn btn-success" type="button" id="cmpInfoOfferInsertBtn">등록</button>
		</div>
	</div>
</div>

</body>
</html>