<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/applyInfo/cmpApplyInfoList.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>'이종훈'님의 회사지원 상태 목록</h1>
		</div>
		
		<!-- Search Bar -->
		<!-- 
		<div class="col-xs-4 col-xs-offset-8">
			<div class="input-group">
				<form class="well" id="searchForm">
					<select class="" name="searchKeyword">
						<option value="default">선택</option>
						<option value="boardKindName">종류</option>
						<option value="boardTitle">제목</option>
						<option value="boardCn">내용</option>
						<option value="regstId">등록자 ID</option>
					</select>
					<input class="input-control" type="text" name="searchContent" placeholder="검색어를 입력하세요">
					<button class="btn btn-sm btn-default" type="button" id="searchBtn">검색</button>
				</form>
			</div>
		</div> 
		-->
		<a><button class="btn btn-info pull-right" type="button" id= 'cmpInfoPageBtn'>회사정보 목록</button></a>
		<form class="form-horizontal" id="cmpInfoListForm">
		<!-- Table Grid -->
		<div> 게시물 총 개수: ${listCnt.cmpApplyInfoCnt}</div>
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="4%"/>	<!-- 번호 				>> 	4 -->
				<col width="12%"/>	<!-- 회사명(회사위치) 	>>	20 -->	
				<col width="10%"/>	<!-- 회사규모 			>>	50 -->
				<col width="6%"/>	<!-- 프로세스			>>	85 -->
				<col width="18%"/>	<!-- 서류전형 			>>	85 -->
				<col width="18%"/>	<!-- 1차면접 			>>	85 -->
				<col width="18%"/>	<!-- 2차면접 			>>	85 -->
				<col width="5%"/>	<!-- 기능 				>>	85 -->
			</colgroup>
			<thead>
				<tr class="bg-info">
					<th class="text-center">번호</th>
					<th class="text-center">회사 명 (회사 위치)</th>
					<th class="text-center">회사규모</th>
					<th class="text-center">프로세스</th>
					<th class="text-center">서류 전형</th>
					<th class="text-center">1차면접 전형</th>
					<th class="text-center">2차면접 전형</th>
					<th class="text-center">기능</th>
				</tr>
			</thead>
			
			<c:choose>
				<c:when test="${0 ne listCnt.cmpApplyInfoCnt and '' ne listCnt.cmpApplyInfoCnt}">
					<c:forEach items="${cmpApplyInfoList}" var="list">
						<tbody>
							<tr>
								<td class="text-center">${list.rownum}</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${'N' eq list.cmpGoodYn}">
											<a class="cmpGoodYn" data-id="${list.cmpGoodYn}" data-cmpNo="${list.cmpNo}" style="font-size: 15px;">♡</a>
										</c:when>
										<c:when test="${'Y' eq list.cmpGoodYn}">
											<a class="cmpGoodYn" data-id="${list.cmpGoodYn}" data-cmpNo="${list.cmpNo}" style="font-size: 20px; color: red;">♥</a>
										</c:when>
									</c:choose>
									<a style="cursor:hand; font-weight: bold;" class="cmpTitle" data-id="${list.cmpNo}">
										<c:out value="${list.cmpTitle}"/><br>
									</a>
									<c:out value="(${list.cmpLocation})"/> 
								</td>
								<td class="text-center">
									${list.foundedYear}년차 / ${list.cmpEmpCnt}명
									<br> ${list.cmpTouch}억 / 
									<c:choose>
										<c:when test="${'1' eq list.cmpKind}">
											<c:out value="중소기업"/>
										</c:when>
										<c:when test="${'2' eq list.cmpKind}">
											<c:out value="중견기업"/>
										</c:when>
										<c:when test="${'3' eq list.cmpKind}">
											<c:out value="대기업"/>
										</c:when>
										<c:when test="${'4' eq list.cmpKind}">
											<c:out value="외국계 기업"/>
										</c:when>
										<c:otherwise>
											<c:out value="미지정 기업"/>
										</c:otherwise>
									</c:choose>
								</td>
								
								<td class="text-center">
									<c:choose>
										<c:when test="${'Y' eq list.cmpProcessFinalCompleteYn}">
											<c:out value="종료"/>
										</c:when>
										<c:when test="${'N' eq list.cmpProcessFinalCompleteYn}">
											<p style="font-weight: bold; color: red;">
												<c:out value="진행중"/>
											</p>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">
								
									<c:choose>
										<c:when test="${'A00' eq list.cmpApplyDocKindCode}">
											<p style="font-weight: bold;">
												<c:out value="대기 중"/>
											</p>
										</c:when>
									
										<c:when test="${'A01' eq list.cmpApplyDocKindCode}">
											<a style="font-weight: bold;">
												<c:out value="서류검토 진행 중"/><br>
											</a>
											*지원일자: ${list.cmpApplyDocInterviewDttm}(${list.applyDocInterviewDayOfWeek})<br>
											[ ${list.applyDocExcessDay}일 지남 ]
										</c:when>

										<c:when test="${'A03' eq list.cmpApplyDocKindCode}">
											<p style="font-weight: bold;">
												<c:out value="합격"/>
											</p>
											*최종 통보일자: ${list.cmpApplyDocResultDttm}
										</c:when>
										
										<c:when test="${'A04' eq list.cmpApplyDocKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="불 합격"/><br>	
											</p>
											*최종 통보일자: ${list.cmpApplyDocResultDttm}
										</c:when>
										
										<c:when test="${'A05' eq list.cmpApplyDocKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="미 연락"/><br>
												<c:out value="[일주일 초과]"/>
											</p>
										</c:when>
										
										<c:when test="${'A06' eq list.cmpApplyDocKindCode}">
											<a style="font-weight: bold;">
												<c:out value="코딩테스트 진행중"/><br>
											</a>
												*테스트 일자: ${list.cmpApplyDocInterviewDttm}(${list.applyDocInterviewDayOfWeek})<br>
										</c:when>
										
										<c:when test="${'A07' eq list.cmpApplyDocKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="최종합격"/>
											</p>
										</c:when>
									</c:choose>
								</td>
								
								<td class="text-center">
									<c:choose>
										<c:when test="${'A00' eq list.cmpApply1stKindCode}">
											-
										</c:when>
										
										<c:when test="${'A02' eq list.cmpApply1stKindCode}">
											<a style="cursor:hand; font-weight: bold;" class="proceedingStatus" data-id="${list.cmpNo}">
												<c:out value="면접 진행중"/><br>
											</a>
												*면접일자: ${list.cmpApply1stInterviewDttm}(${list.apply1stInterviewDayOfWeek})<br>
												[ ${list.apply1stExcessDay}일 뒤 면접 예정]
										</c:when>
										
										<c:when test="${'A03' eq list.cmpApply1stKindCode}">
											<p style="font-weight: bold;">
												<c:out value="합격"/><br>
											</p>
											*최종 통보일자: ${list.cmpApply1stResultDttm}
										</c:when>
										
										<c:when test="${'A04' eq list.cmpApply1stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="불 합격"/><br>
											</p>
												*최종 통보일자: ${list.cmpApply1stResultDttm}
										</c:when>
										
										<c:when test="${'A05' eq list.cmpApply1stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="미 연락"/><br>
												<c:out value="[일주일 초과]"/>
											</p>
										</c:when>
										
										<c:when test="${'A06' eq list.cmpApply1stKindCode}">
											<a style="font-weight: bold;">
												<c:out value="코딩테스트 진행중"/><br>
											</a>
												*테스트 일자: ${list.cmpApplyDocInterviewDttm}(${list.applyDocInterviewDayOfWeek})<br>
										</c:when>
										
										<c:when test="${'A07' eq list.cmpApply1stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="최종합격"/>
											</p>
											*최종 통보일자: ${list.cmpApply1stResultDttm}
										</c:when>
										
										<c:when test="${'A08' eq list.cmpApply1stKindCode}">
											<a style="font-weight: bold;">
												<c:out value="면접검토 진행중"/><br>
											</a>
											*검토 시작일자: ${list.cmpApply1stInterviewDttm}(${list.apply1stInterviewDayOfWeek})<br>
											[ ${list.apply1stExcessDay}일 지남 ]
										</c:when>
										<c:when test="${'A09' eq list.cmpApply1stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="미 참석"/><br>
											</p>
										</c:when>
									</c:choose>
								</td>
								
								<td class="text-center">
									<c:choose>
										<c:when test="${'A00' eq list.cmpApply2stKindCode}">
											-
										</c:when>
										
										<c:when test="${'A02' eq list.cmpApply2stKindCode}">
											<a style="cursor:hand; font-weight: bold;" class="cmpTitle" data-id="${list.cmpNo}">
												<c:out value="면접 진행중"/><br>
												*면접일자: ${list.cmpApply2stInterviewDttm}(${list.apply2stInterviewDayOfWeek})<br>
												[ ${list.apply2stExcessDay}일 뒤 면접 예정]
											</a>
										</c:when>
										
										<c:when test="${'A03' eq list.cmpApply2stKindCode}">
											<p style="font-weight: bold;">
												<c:out value="합격"/>
											</p>
												*최종 통보일자: ${list.cmpApply2stResultDttm}	
										</c:when>
										
										<c:when test="${'A04' eq list.cmpApply2stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="불 합격"/><br>
											</p>
											*최종 통보일자: ${list.cmpApply2stResultDttm}
										</c:when>
										
										<c:when test="${'A05' eq list.cmpApply2stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="미 연락"/><br>
												<c:out value="[일주일 초과]"/>
											</p>
										</c:when>
										
										<c:when test="${'A06' eq list.cmpApply2stKindCode}">
											<a style="font-weight: bold;">
												<c:out value="코딩테스트 진행중"/><br>
												*테스트 일자: ${list.cmpApply2stInterviewDttm}(${list.apply2stInterviewDayOfWeek})<br>
											</a>
										</c:when>
										
										<c:when test="${'A07' eq list.cmpApply2stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="최종합격"/>
											</p>
											*최종 통보일자: ${list.cmpApply2stResultDttm}
										</c:when>
										
										<c:when test="${'A08' eq list.cmpApply2stKindCode}">
											<a style="cursor:hand; font-weight: bold;">
												<c:out value="면접검토 진행중"/><br>
											</a>
											*검토 시작일자: ${list.cmpApply2stInterviewDttm}(${list.apply2stInterviewDayOfWeek})<br>
											[ ${list.apply2stExcessDay}일 지남 ]
										</c:when>
										
										<c:when test="${'A09' eq list.cmpApply2stKindCode}">
											<p style="font-weight: bold; color: red;">
												<c:out value="미 참석"/><br>
											</p>
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:if test="${'Y' eq list.useYn}">
										<div class="text-center">
											<input type="button" class="btn btn-default" name= "interviewInsertBtn" data-id="${list.cmpApplyNo}" value="상태 변경"/>
										</div>
									</c:if>
								</td>
							</tr>
						</tbody>		
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<td colspan="7" class="text-center text-import">지원 하신 회사가 존재하지 않습니다.</td>						
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		
		<nav aria-label="Page navigation example" style="text-align: center;">
			<ul class="pagination text-center">
				<c:choose>
					<c:when test="${pagination.curRange ne 1 }">
						<li class="page-item"><a href="#" class="page-link" onClick="fn_paging(1)">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pagination.prevPage}')">Next</a></li>
					</c:otherwise>
				</c:choose>
			
	            <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
	                <c:choose>
	                    <c:when test="${pageNum eq pagination.curPage}">
	                        <li class="page-item active"><a href="#" class="page-link" onClick="fn_paging('${pageNum}')">${pageNum}</a></li>
	                    </c:when>
	                    <c:otherwise>
	                         <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pageNum}')">${pageNum}</a></li>
	                    </c:otherwise>
	                </c:choose>
	            </c:forEach>
	            
	            <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
	                <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pagination.nextPage}')">Next</a></li>
	            </c:if>
	            <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
	                <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pagination.pageCnt}')">End</a></li>
	            </c:if>
            </ul>
        </nav>
	</div>
</div>
</body>
</html>