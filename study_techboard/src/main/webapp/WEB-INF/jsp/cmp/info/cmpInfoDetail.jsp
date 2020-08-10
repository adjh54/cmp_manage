<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/info/cmpInfoDetail.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>"${cmpInfoDetail.cmpTitle}" 회사 상세 정보</h1>
		</div>
		
		<form class="form-horizontal" id="cmpInfoDetailForm">
		<input type="hidden" name = "cmpNo" value="${cmpInfoDetail.cmpNo}"/>
		<input type="hidden" id="cmpApplyYn" name="cmpApplyYn" value="${cmpInfoDetail.cmpApplyYn}"/>
		<input type="hidden" id="cmpReplyYn" name="cmpReplyYn" value="${cmpInfoDetail.cmpReplyYn}"/>
		<input type="hidden" id="cmpPageFlag" name= "cmpPageFlag" value="${cmpPageFlag}"/>
			<table border="1" class="table table-bordered table-hover">
				<colgroup>
					<col width="10%">	<!-- 10 -->
					<col width="90%">	<!-- 100 -->
				</colgroup>
				<tbody>
					<c:choose>
					
						<c:when test="${'Y' eq cmpInfoDetail.cmpApplyYn}">
							<tr>
								<th class="text-center">회사 한줄평</th>
								<td><textarea class="form-control" rows="5" id = "cmpComment" name="cmpComment" readonly="readonly">${cmpInfoDetail.cmpComment}</textarea> </td>
							</tr>
						</c:when>
						
						<c:when test="${'N' eq cmpInfoDetail.cmpApplyYn }">
							<tr>
								<th class="text-center">회사 한줄평</th>
								<td><textarea class="form-control" rows="5" id = "cmpComment" name="cmpComment">${cmpInfoDetail.cmpComment}</textarea> </td>
							</tr>
							<tr>
								<th class="text-center">액션</th>
								<td><input type="button" class="btn btn-default pull-right" id= "cmpCommentBtn" value = "한줄평 수정"></td>
							</tr>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			
			<c:if test="${'N' eq cmpInfoDetail.cmpApplyYn}">
				<button class="btn btn-primary pull-right" type="button" id= "cmpApplyYnBtn">지원하기</button>
			</c:if>
			
			<c:if test="${( 'N' eq cmpInfoDetail.cmpReplyYn ) and ( 03 eq cmpInfoDetail.cmpRecuritKind or 04 eq cmpInfoDetail.cmpRecuritKind ) }">
				<button class="btn btn-primary pull-right" type="button" id= "cmpReplyYnBtn">회신 완료</button>
			</c:if>
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="10%">	<!-- 10 -->
						<col width="90%">	<!-- 100 -->
					</colgroup>
				
				<tbody>
					<tr>
						<th class="text-center">회사 명</th>
						<td>${cmpInfoDetail.cmpTitle}</td>
					</tr>
					
					<tr>
						<th class="text-center">공고 유형</th>
						<td>
							<c:choose>
								<c:when test="${1 eq cmpInfoDetail.cmpRecuritKind}">
									<c:out value="사람인"/>
								</c:when>
								<c:when test="${2 eq cmpInfoDetail.cmpRecuritKind}">
									<c:out value="잡코리아"/>
								</c:when>
								<c:when test="${3 eq cmpInfoDetail.cmpRecuritKind}">
									<c:out value="헤드헌터"/>
								</c:when>
								<c:when test="${4 eq cmpInfoDetail.cmpRecuritKind}">
									<c:out value="인사담당자"/>
								</c:when>
							</c:choose>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">회사 위치(역)</th>
						<td>${cmpInfoDetail.cmpLocation}</td>
					</tr>
					
					<tr>
						<th class="text-center">회사 마감일자</th>
						<td><c:out value="~ ${cmpInfoDetail.cmpDeadlineDttm}"/><p style="color: red;">(${cmpInfoDetail.deadlineDay}일 전)</p></td>
					</tr>
					
					<tr>
						<th class="text-center">회사 규모</th>
						<td>
							${cmpInfoDetail.foundedYear}년차 / ${cmpInfoDetail.cmpEmpCnt}명
							<br> ${cmpInfoDetail.cmpTouch}억 / 
							<c:choose>
								<c:when test="${'1' eq cmpInfoDetail.cmpKind}">
									<c:out value="중소기업"/>
								</c:when>
								<c:when test="${'2' eq cmpInfoDetail.cmpKind}">
									<c:out value="중견기업"/>
								</c:when>
								<c:when test="${'3' eq cmpInfoDetail.cmpKind}">
									<c:out value="대기업"/>
								</c:when>
								<c:when test="${'4' eq cmpInfoDetail.cmpKind}">
									<c:out value="외국계 기업"/>
								</c:when>
								<c:otherwise>
									<c:out value="미지정 기업"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>

					<tr>
						<th class="text-center">회사 채용절차</th>
						<td><c:out value="${cmpInfoDetail.cmpRecuritProcess}"/></td>
					</tr>
					
					<tr>
						<th class="text-center">회사 포지션</th>
						<td><p style="white-space: pre-line;">${cmpInfoDetail.cmpJobPosition}</p></td>
					</tr>
					
					<tr>
						<th class="text-center">개발자 분류</th>
						<td>
							<c:choose>
								<c:when test="${'1' eq cmpInfoDetail.cmpProgrammerKind }">Full-Stack 개발자</c:when>
								<c:when test="${'2' eq cmpInfoDetail.cmpProgrammerKind }">Front-end 개발자</c:when>
								<c:when test="${'3' eq cmpInfoDetail.cmpProgrammerKind }">Back-end 개발자</c:when>
							</c:choose>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">회사 주요업무</th>
						<td><p style="white-space: pre-line;">${cmpInfoDetail.cmpJobResponse}</p></td>
					</tr>
					
					<tr>
						<th class="text-center">회사 자격요건</th>
						<td><p style="white-space: pre-line;">${cmpInfoDetail.cmpJobQualification}</p></td>
					</tr>
					
					<tr>
						<th class="text-center">회사 우대조건</th>
						<td><p style="white-space: pre-line;">${cmpInfoDetail.cmpJobPrefer}</p></td>
					</tr>
					
					<tr>
						<th class="text-center">회사 복지사항</th>
						<td><p style="white-space: pre-line;">${cmpInfoDetail.cmpWarefare}</p></td>
					</tr>
					
					<tr>
						<th class="text-center">입사율/퇴사율</th>
						<td style="color: red; font-weight: bold;">
							입사율: ${cmpInfoDetail.cmpIncedenceRate}% / 퇴사율: ${cmpInfoDetail.cmpResignationRate}%
						</td>
					</tr>
					
					<tr>
						<th class="text-center">공고 URL</th>
						<td>
							<c:choose>
								<c:when test="${empty cmpInfoDetail.cmpRecuritUrl}">
									<c:out value="해당 자료가 존재하지 않습니다"/>
								</c:when>
								<c:when test="${not empty cmpInfoDetail.cmpRecuritUrl}">
									<a href="${cmpInfoDetail.cmpRecuritUrl}" target="blank">
									<c:out value="공고로 이동하기"/>
									</a>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th class="text-center">회사 홈페이지 URL</th>
						<td>
							<c:choose>
								<c:when test="${empty cmpInfoDetail.cmpHomepageUrl}">
									<c:out value="해당 자료가 존재하지 않습니다"/>
								</c:when>
								<c:when test="${not empty cmpInfoDetail.cmpHomepageUrl}">
									<a href="${cmpInfoDetail.cmpHomepageUrl}" target="blank">
										<c:out value="홈페이지로 이동하기"/>
									</a>
								</c:when>
							</c:choose>
						</td>
					</tr>
					
					<c:if test="${(not empty cmpInfoDetail.cmpInterviewPrepareInfo) or (not empty cmpInfoDetail.cmpInterviewReviewInfo)}">
						<tr>
							<th class="text-center">면접 대비 정보</th>
							<td>
								<p style="white-space: pre-line;">${cmpInfoDetail.cmpInterviewPrepareInfo}</p>
							</td>
						</tr>
						
						<tr>
							<th class="text-center">면접 후기 정보</th>
							
							<td>
								<p style="white-space: pre-line;">${cmpInfoDetail.cmpInterviewReviewInfo}</p>
							</td>
						</tr>
					</c:if>
					
				</tbody>
			</table>
			<a><button class="btn btn-success pull-right" type="button" id= 'cmpInfoCancleBtn'>뒤로가기</button></a>
		</form>
		
		
	</div>
</div>

</body>
</html>