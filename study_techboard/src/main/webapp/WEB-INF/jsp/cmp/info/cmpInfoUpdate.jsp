<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/info/cmpInfoUpdate.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>" ${cmpInfoItem.cmpTitle} " 회사 수정 페이지</h1>
		</div>
		
		<form class="form-horizontal" id="cmpInfoUpdateForm">
		<input type="hidden" name = cmpNo value="${cmpInfoItem.cmpNo}"/>
		<input type="hidden" name = cmpApplyYn value="${cmpInfoItem.cmpApplyYn}"/>
		
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="20%">	<!-- 10 -->
						<col width="30%">	<!-- 100 -->
						<col width="50%">	<!-- 100 -->
					</colgroup>
				
				<tbody>
					<tr>
						<th class="text-center">
							<label for="cmpTitle">
								<c:out value="회사 명(*)"/>
							</label>
						</th>
						<td colspan="2">
							<input class= "form-control" type="text" id="cmpTitle" name="cmpTitle" value="${cmpInfoItem.cmpTitle}"/>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpRecuritUrl">
								<c:out value="공고 URL"/>
							</label>
						</th>
						<td colspan="2">
							<input class= "form-control" type="text" id="cmpRecuritUrl" name="cmpRecuritUrl" value="${cmpInfoItem.cmpRecuritUrl}"/>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpRecuritKind">
								<c:out value="공고 유형(*)"/>
							</label>
						</th>
						<td colspan="2">
							<div class="input-group">
								<div class="input-group-addon">공고 위치(*)</div>
								<select class= "form-control" style="width: 300px" id="cmpRecuritKind" name="cmpRecuritKind">
									<option value="1" <c:if test="${'1' eq cmpInfoItem.cmpRecuritKind}">selected</c:if>>
										<c:out value="사람인"/>
									</option>
									<option value="2" <c:if test="${'2' eq cmpInfoItem.cmpRecuritKind}">selected</c:if>>
										<c:out value="잡코리아"/>
									</option>
									<option value="3" <c:if test="${'3' eq cmpInfoItem.cmpRecuritKind}">selected</c:if>>
										<c:out value="헤드헌터"/>
									</option>
									<option value="4" <c:if test="${'4' eq cmpInfoItem.cmpRecuritKind}">selected</c:if>>
										<c:out value="인사담당자"/>
									</option>
								</select>
							
								<div class="input-group-addon">포지션 유형(*)</div>
								<select class= "form-control" style="width: 300px" id="cmpProgrammerKind" name="cmpProgrammerKind">
									<option value="1" <c:if test="${'1' eq cmpInfoItem.cmpProgrammerKind}">selected</c:if>>Full-Stack 업무</option>
									<option value="2" <c:if test="${'2' eq cmpInfoItem.cmpProgrammerKind}">selected</c:if>>Front-end 업무</option>
									<option value="3" <c:if test="${'3' eq cmpInfoItem.cmpProgrammerKind}">selected</c:if>>Back-end 업무</option>
								</select>
							</div>
						</td>
					</tr>
						
					
					
					<tr>
						<th class="text-center">
							<label for="cmpJobPosition">
								<c:out value="공고 제목(*)"/>
							</label>
						</th>
						<td colspan="2">
							<input class= "form-control" type="text" id="cmpJobPosition" name="cmpJobPosition" value="${cmpInfoItem.cmpJobPosition}"/>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpJobResponse">
								<c:out value="회사 주요업무(*)"/>
							</label>
						</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpJobResponse" name="cmpJobResponse">${cmpInfoItem.cmpJobResponse}</textarea>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpJobQualification">
								<c:out value="회사 자격조건(*)"/>
							</label>
						</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpJobQualification" name="cmpJobQualification">${cmpInfoItem.cmpJobQualification}</textarea>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpJobPrefer">
								<c:out value="회사 우대조건"/>
							</label>
						</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpJobPrefer" name="cmpJobPrefer">${cmpInfoItem.cmpJobPrefer}</textarea>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpWarefare">
								<c:out value="회사 복지사항"/>
							</label>
						</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpWarefare" name="cmpWarefare">${cmpInfoItem.cmpWarefare}</textarea>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpRecuritProcess">
								<c:out value="회사 채용절차(*)"/>
							</label>
						</th>
						<td colspan="2">
							<input class="form-control" type="text" id="cmpRecuritProcess" name="cmpRecuritProcess" value="${cmpInfoItem.cmpRecuritProcess}"/>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpDeadlineDttm">
								<c:out value="공고 마감일자(*)"/>
							</label>
						</th>
						<td colspan="2">
							<input class= "form-control" type="date" id="cmpDeadlineDttm" name="cmpDeadlineDttm" value="${cmpInfoItem.cmpDeadlineDttm}"/>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpKind">
								<c:out value="회사 정보(*)"/>
							</label>
						</th>
						<td colspan="2">
						
							<div class="input-group">
								<div class="input-group-addon" style="width: 200px;">
									<c:out value="회사 종류(*)"/>
								</div>
								<select class= "form-control" style="width: 240px;" id ="cmpKind" name="cmpKind">
									<option value="1" <c:if test="${cmpInfoItem.cmpKind eq '1'}">selected</c:if>>중소기업</option>
									<option value="2" <c:if test="${cmpInfoItem.cmpKind eq '2'}">selected</c:if>>중견기업</option>
									<option value="3" <c:if test="${cmpInfoItem.cmpKind eq '3'}">selected</c:if>>대기업</option>
									<option value="4" <c:if test="${cmpInfoItem.cmpKind eq '4'}">selected</c:if>>외국계 기업</option>
								</select>
							</div>
						
							<div class="input-group">
								<div class="input-group-addon" style="width: 200px;">
									<c:out value="회사 설립년도(*)"/>
								</div>
								<input class= "form-control" type="number" style="text-align: right;" id="cmpFoundedYear" name="cmpFoundedYear" placeholder="YYYY" value="${cmpInfoItem.cmpFoundedYear}"/>
								<div class="input-group-addon">년</div>
							</div>
							
							<div class="input-group">	
								<div class="input-group-addon" style="width: 200px;">
									<c:out value="회사 직원수(*)"/>
								</div>
								<input class= "form-control" type="number" style="text-align: right;" id="cmpEmpCnt" name="cmpEmpCnt" placeholder="00" value="${cmpInfoItem.cmpEmpCnt}"/>
								<div class="input-group-addon">명</div>
							</div>
							
							<div class="input-group">
								<div class="input-group-addon" style="width: 200px;">
									<c:out value="회사 매출액(*)"/>
								</div>
								<input class= "form-control" type="number" style="text-align: right;" id="cmpTouch" name="cmpTouch" placeholder="00" value="${cmpInfoItem.cmpTouch}"/>
								<div class="input-group-addon">억</div>
							</div>
							
							<div class="input-group">
								<div class="input-group-addon" style="width: 200px;">
									<c:out value="회사 위치(역)"/>
								</div>
								<input class= "form-control" type="text" id="cmpLocation" name="cmpLocation" value="${cmpInfoItem.cmpLocation}"/>
								<div class="input-group-addon">
									<c:out value="역"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="text-center">
							<label for="cmpIncedenceRate">
								<c:out value="입사율/퇴사율(*)"/>
							</label>
						</th>
						<td colspan="2">
							<div class="input-group">
								<div class="input-group-addon">
									<c:out value="입사율:"/>
								</div>
								<input class="form-control" type="number" style="text-align: right;" id="cmpIncedenceRate" name="cmpIncedenceRate" value="${cmpInfoItem.cmpIncedenceRate}"/>
								<div class="input-group-addon">
									<c:out value="%"/>
								</div>
								
								<div class="input-group-addon">
									<c:out value="퇴사율:"/>
								</div>
								<input class="form-control" type="number" style="text-align: right;" id="cmpResignationRate" name="cmpResignationRate" value="${cmpInfoItem.cmpResignationRate}"/>
								<div class="input-group-addon">
									<c:out value="%"/>
								</div>
							</div>
						</td>
					</tr>					
					<tr>
						<th class="text-center">
							<label for="cmpHomepageUrl">
								<c:out value="회사 홈페이지 URL"/>
							</label>
						</th>
						<td colspan="2">
							<input class= "form-control" type="text" id="cmpHomepageUrl" name="cmpHomepageUrl" value="${cmpInfoItem.cmpHomepageUrl}"/>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">
							<label for="cmpComment">
								<c:out value="회사 한줄평"/>
							</label>
						</th>
						<td colspan="2">
							<textarea class="form-control" rows="5" id="cmpComment" name="cmpComment">${cmpInfoItem.cmpComment}</textarea>
						</td>
					</tr>
					
				</tbody>
			</table>
		</form>
		<div class="btn-group pull-right">
			<button class="btn btn-success" type="button" id= "cmpInfoUpdateBtn">수정</button>
			<a>
				<button class="btn btn-danger" type="button" id= 'cmpInfoCancleBtn'>취소</button>
			</a>
			
		</div>
	</div>
</div>

</body>
</html>