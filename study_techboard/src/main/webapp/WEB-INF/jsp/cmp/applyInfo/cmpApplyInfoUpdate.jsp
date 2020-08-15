<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/applyInfo/cmpApplyInfoUpdate.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>"${item.cmpTitle}" 회사 면접 정보 등록/수정 페이지</h1>
		</div>
		
		<form class="form-horizontal" id="cmpApplyInfoUpdateForm">
		<input type="hidden" name = cmpApplyNo value="${item.cmpApplyNo}"/>
		
		
		<c:if test="${'NULL' ne item.cmpRecuritProcess or '' ne item.cmpRecuritProcess}">
			<table border="1" class="table table-bordered table-hover">
				<colgroup>
					<col width="20%">	<!-- 10 -->
					<col width="40%">	<!-- 10 -->
					<col width="40%">	<!-- 100 -->
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center">${item.cmpTitle}의 채용 절차</th>
						<td class="text-center" colspan="2">
							${item.cmpRecuritProcess}
							<c:choose>
								<c:when test="${'N' eq item.cmpProcessFinalCompleteYn}">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-danger" id="prcessComplteYnBtn" data-cmpno ="${item.cmpNo}" data-cmptitle ="${item.cmpTitle}" value="최종완료 처리"/>
								</c:when>
								
								<c:when test="${'Y' eq item.cmpProcessFinalCompleteYn}">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-danger" id="rePrcessComplteYnBtn" data-cmpno ="${item.cmpNo}" data-cmptitle ="${item.cmpTitle}" value="진행중 처리"/>
								</c:when>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>
		<div class="page-header">
			<h4>서류 전형 상태</h4>
		</div>
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="20%">	<!-- 10 -->
						<col width="40%">	<!-- 100 -->
						<col width="40%">	<!-- 100 -->
					</colgroup>
				<tbody>
					<tr>
						<th class="text-center">서류전형 지원상태</th>
						<td colspan="2">
							<select id="cmpApplyDocKindCode" name="cmpApplyDocKindCode" class="form-control" >
								<option value ="A00" <c:if test="${'A00' eq item.cmpApplyDocKindCode}">selected</c:if>>대기중</option>
								<option value ="A01" <c:if test="${'A01' eq item.cmpApplyDocKindCode}">selected</c:if>>서류검토 진행중</option>
								<option value ="A03" <c:if test="${'A03' eq item.cmpApplyDocKindCode}">selected</c:if>>합격</option>
								<option value ="A04" <c:if test="${'A04' eq item.cmpApplyDocKindCode}">selected</c:if>>불합격</option>
								<option value ="A05" <c:if test="${'A05' eq item.cmpApplyDocKindCode}">selected</c:if>>미 연락(일주일 초과)</option>
								<option value ="A06" <c:if test="${'A06' eq item.cmpApplyDocKindCode}">selected</c:if>>코딩테스트 진행중</option>
								<option value ="A07" <c:if test="${'A07' eq item.cmpApplyDocKindCode}">selected</c:if>>최종합격</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">서류전형 지원일자</th>
						<td><input class= "form-control" type="date" id="cmpApplyDocInterviewDttm" name="cmpApplyDocInterviewDttm" value="${item.cmpApplyDocInterviewDttm}"/></td>
						<td><input class= "form-control" type="time" id="cmpApplyDocInterviewTime" name="cmpApplyDocInterviewTime" value="${item.cmpApplyDocInterviewTime}"/></td>
					</tr>
					<tr>
						<th class="text-center">서류전형 참고 정보</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpApplyDocInterviewInfo" name="cmpApplyDocInterviewInfo">${item.cmpApplyDocInterviewInfo}</textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center">최종 통보일자</th>
						<td colspan="2">
							<input class= "form-control" type="date" id="cmpApplyDocResultDttm" name="cmpApplyDocResultDttm" value="${item.cmpApplyDocResultDttm}" disabled="disabled"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="page-header">
				<h4>1차 면접 상태</h4>
			</div>
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="20%">	<!-- 10 -->
						<col width="40%">	<!-- 100 -->
						<col width="40%">	<!-- 100 -->
					</colgroup>
				<tbody>
					<tr>
						<th class="text-center">1차 면접상태</th>
						<td colspan="2">
							<select id="cmpApply1stKindCode" name="cmpApply1stKindCode"  class="form-control" >
								<option value ="A00" <c:if test="${'A00' eq item.cmpApply1stKindCode}">selected</c:if>>대기중</option>
								<option value ="A02" <c:if test="${'A02' eq item.cmpApply1stKindCode}">selected</c:if>>면접 진행중</option>
								<option value ="A08" <c:if test="${'A08' eq item.cmpApply1stKindCode}">selected</c:if>>면접검토 진행중</option>
								<option value ="A03" <c:if test="${'A03' eq item.cmpApply1stKindCode}">selected</c:if>>합격</option>
								<option value ="A04" <c:if test="${'A04' eq item.cmpApply1stKindCode}">selected</c:if>>불합격</option>
								<option value ="A05" <c:if test="${'A05' eq item.cmpApply1stKindCode}">selected</c:if>>미 연락(일주일 초과)</option>
								<option value ="A06" <c:if test="${'A06' eq item.cmpApply1stKindCode}">selected</c:if>>코딩테스트 진행중</option>
								<option value ="A07" <c:if test="${'A07' eq item.cmpApply1stKindCode}">selected</c:if>>최종합격</option>
								<option value ="A09" <c:if test="${'A09' eq item.cmpApply1stKindCode}">selected</c:if>>미 참석</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="text-center">1차 면접일자</th>
						<td><input class= "form-control" type="date" id="cmpApply1stInterviewDttm" name="cmpApply1stInterviewDttm" value="${item.cmpApply1stInterviewDttm}"/></td>
						<td><input class= "form-control" type="time" id="cmpApply1stInterviewTime" name="cmpApply1stInterviewTime" value="${item.cmpApply1stInterviewTime}"/></td>
					</tr>
					<tr>
						<th class="text-center">1차 면접정보</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpApply1stInterviewInfo" name="cmpApply1stInterviewInfo">${item.cmpApply1stInterviewInfo}</textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center">최종 통보일자</th>
						<td colspan="2">
							<input class= "form-control" type="date" id="cmpApply1stResultDttm" name="cmpApply1stResultDttm" value="${item.cmpApply1stResultDttm}"  disabled="disabled"/>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="page-header">
				<h4>2차 면접 상태</h4>
			</div>
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="20%">	<!-- 10 -->
						<col width="40%">	<!-- 100 -->
						<col width="40%">	<!-- 100 -->
					</colgroup>
				<tbody>		
					<tr>
						<th class="text-center">2차 면접상태</th>
						<td colspan="2">
							<select id="cmpApply2stKindCode" name="cmpApply2stKindCode" class= "form-control" >
								<option value ="A00" <c:if test="${'A00' eq item.cmpApply2stKindCode}">selected</c:if>>대기중</option>
								<option value ="A02" <c:if test="${'A02' eq item.cmpApply2stKindCode}">selected</c:if>>면접 진행중</option>
								<option value ="A08" <c:if test="${'A08' eq item.cmpApply2stKindCode}">selected</c:if>>면접검토 진행중</option>
								<option value ="A03" <c:if test="${'A03' eq item.cmpApply2stKindCode}">selected</c:if>>합격</option>
								<option value ="A04" <c:if test="${'A04' eq item.cmpApply2stKindCode}">selected</c:if>>불합격</option>
								<option value ="A05" <c:if test="${'A05' eq item.cmpApply2stKindCode}">selected</c:if>>미 연락(일주일 초과)</option>
								<option value ="A06" <c:if test="${'A06' eq item.cmpApply2stKindCode}">selected</c:if>>코딩테스트 진행중</option>
								<option value ="A07" <c:if test="${'A07' eq item.cmpApply2stKindCode}">selected</c:if>>최종합격</option>
								<option value ="A09" <c:if test="${'A09' eq item.cmpApply1stKindCode}">selected</c:if>>미 참석</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="text-center">2차 면접일자</th>
						<td><input class= "form-control" type="date" id="cmpApply2stInterviewDttm" name="cmpApply2stInterviewDttm" value="${item.cmpApply2stInterviewDttm}"/></td>
						<td><input class= "form-control" type="time" id="cmpApply2stInterviewTime" name="cmpApply2stInterviewTime" value="${item.cmpApply2stInterviewTime}"/></td>
					</tr>
					<tr>
						<th class="text-center">2차 면접정보</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpApply2stInterviewInfo" name="cmpApply2stInterviewInfo">${item.cmpApply2stInterviewInfo} </textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center">최종 통보일자</th>
						<td colspan="2">
							<input class= "form-control" type="date" id="cmpApply2stResultDttm" name="cmpApply2stResultDttm" value="${item.cmpApply2stResultDttm}" disabled="disabled"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="page-header">
				<h4>면접 정보 관리</h4>
			</div>
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="20%">	<!-- 10 -->
						<col width="40%">	<!-- 100 -->
						<col width="40%">	<!-- 100 -->
					</colgroup>
				<tbody>		
					<tr>
						<th class="text-center">면접 대비 정보</th>
						<td colspan="2">
							<textarea class="form-control" rows="15" id="cmpInterviewPrepareInfo" name="cmpInterviewPrepareInfo">${item.cmpInterviewPrepareInfo}</textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center">면접 후기 정보</th>
						<td colspan="2">
							<textarea class="form-control" rows="15" id="cmpInterviewReviewInfo" name="cmpInterviewReviewInfo">${item.cmpInterviewReviewInfo}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			
		</form>
		<div class="input-group pull-right">
			<button class="btn btn-success" type="button" id="cmpApplyInfoUpdateBtn">수정</button>
			<a>
				<button class="btn btn-danger" type="button" id='cmpApplyInfoCancleBtn'>취소</button>
			</a>
		</div>
	</div>
</div>

</body>
</html>