<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/info/cmpInfoList.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>통합 회사지원 관리시스템</h1>
		</div>
		<!-- Search Bar -->
		<div class="col-xs-5 col-xs-offset-7">
			<div class="input-group">
				<form class=" form-horizontal well" id="searchForm">
					<select class="input-control" style="width:80px; height:25px;" id="searchKeyword" name="searchKeyword">
						<option value="default">선택</option>
						<option value="cmpTitle">회사명</option>
						<option value="cmpLocation">회사위치</option>
						<option value="cmpRecuritKind">공고유형</option>
						<option value="cmpApplyYn">지원상태</option>
						<option value="cmpGoodYn">좋아요</option>
					</select>
					
					<select class="input-control" style="width: 80px; height:25px;" id="searchKeywordNext"  disabled="disabled">
						<option value="default">선택</option>
					</select>
					
					<input class="input-control" type="text" id ="searchContent" name="searchContent" placeholder="검색어를 입력하세요">
					<button class="btn btn-sm btn-default" type="button" id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<div class="btn-group pull-right">
			<a>
				<button class= "btn btn-danger" type ="button" id="cmpApplyInfoPageBtn">
					<c:out value="회사지원 상태 목록"/>
				</button>
				&nbsp;
				<button class= "btn btn-success" type ="button" id="cmpOfferInfoPageBtn">
					<c:out value="회사제안 정보 목록"/>
				</button>
			</a>
		</div>
		
		<form class="form-horizontal" id="cmpInfoListForm">
		<div> 게시물 총 개수: ${cmpInfoListCnt.cmpInfoCnt}</div>
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="4%"/>	<!-- 번호 				>> 	4 -->
				<col width="7%"/>	<!-- 즐겨찾기 			>>	20 -->	
				<col width="15%"/>	<!-- 회사명(회사위치) 	>>	20 -->	
				<col width="25%"/>	<!-- 포지션 			>>	50 -->
				<col width="8%"/>	<!-- 공고유형 			>>	50 -->
				<col width="12%"/>	<!-- 회사규모			>>	70 -->
				<col width="8%"/>	<!-- 지원상태 			>>	85 -->
				<col width="10%"/>	<!-- 마감일자 			>>	85 -->
				<col width="12%"/>	<!-- 기능 				>>	85 -->
			</colgroup>
			
			<thead>
				<tr class="bg-info">
					<th class="text-center">
						<c:out value="번호"/>
					</th>
					<th class="text-center">
						<c:out value="즐겨찾기"/>
					</th>
					<th class="text-center">
						<c:out value="회사 명 (회사 위치)"/>
					</th>
					<th class="text-center">
						<c:out value="포지션"/>
					</th>
					<th class="text-center">
						<c:out value="공고유형"/>
					</th>
					<th class="text-center">
						<c:out value="회사규모"/>
					</th>
					<th class="text-center">
						<c:out value="지원상태"/>
					</th>
					<th class="text-center">
						<c:out value="마감일자"/>
					</th>
					<th class="text-center">
						<c:out value="기능"/>
					</th>
				</tr>
			</thead>
			
			<c:choose>
				<c:when test="${0 ne cmpInfoListCnt.cmpInfoCnt and '' ne cmpInfoListCnt.cmpInfoCnt}">
					<c:forEach items="${cmpInfoList}" var="cmpInfo">
						<tbody>
							<tr>
								<td class="text-center">${cmpInfo.rownum}</td>
								<td class="text-center" >
									<c:choose>
										<c:when test="${'N' eq cmpInfo.cmpFavoritesYn}">
											<a class= "cmpFavoritesYn" data-id="${cmpInfo.cmpFavoritesYn}" data-cmpNo="${cmpInfo.cmpNo}" style="font-size: 25px;">☆</a>
										</c:when>
										<c:when test="${'Y' eq cmpInfo.cmpFavoritesYn}">
											<a class= "cmpFavoritesYn" data-id="${cmpInfo.cmpFavoritesYn}" data-cmpNo="${cmpInfo.cmpNo}" style="font-size: 25px;">★</a>
										</c:when>
									</c:choose>
								</td>									
								<td class="text-center">
										<c:choose>
											<c:when test="${'N' eq cmpInfo.cmpGoodYn}">
												<a class="cmpGoodYn" data-id="${cmpInfo.cmpGoodYn}" data-cmpNo="${cmpInfo.cmpNo}" style="font-size: 15px;">♡</a>
											</c:when>
											<c:when test="${'Y' eq cmpInfo.cmpGoodYn}">
												<a class="cmpGoodYn" data-id="${cmpInfo.cmpGoodYn}" data-cmpNo="${cmpInfo.cmpNo}" style="font-size: 20px; color: red;">♥</a>
											</c:when>
										</c:choose>
									<a style="cursor:hand; font-weight: bold;" class="cmpTitle" data-id="${cmpInfo.cmpNo}">
										<c:out value="${cmpInfo.cmpTitle}"/><br>
									</a>
										<c:out value="(${cmpInfo.cmpLocation})"/> 
								</td>
								<td class="text-left">▶ ${cmpInfo.cmpJobPosition}</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${1 eq cmpInfo.cmpRecuritKind}">
											<c:out value="사람인"/>
										</c:when>
										<c:when test="${2 eq cmpInfo.cmpRecuritKind}">
											<c:out value="잡코리아"/>
										</c:when>
										<c:when test="${3 eq cmpInfo.cmpRecuritKind}">
											<c:out value="헤드헌터"/><br>
											<c:choose>
												<c:when test="${'N' eq cmpInfo.cmpReplyYn}">
													<p style="font-weight: bold;">(미 회신)</p>
												</c:when>
												<c:when test="${'Y' eq cmpInfo.cmpReplyYn}">
													(회신완료)
												</c:when>
											</c:choose>
										</c:when>
										<c:when test="${4 eq cmpInfo.cmpRecuritKind}">
											<c:out value="인사담당자"/><br>
											<c:choose>
												<c:when test="${'N' eq cmpInfo.cmpReplyYn}">
													<p style="font-weight: bold;">(미 회신)</p>
												</c:when>
												<c:when test="${'Y' eq cmpInfo.cmpReplyYn}">
													(회신완료)
												</c:when>
											</c:choose>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">
									${cmpInfo.foundedYear}년차 / ${cmpInfo.cmpEmpCnt}명
									<br> ${cmpInfo.cmpTouch}억 / 
									<c:choose>
										<c:when test="${'1' eq cmpInfo.cmpKind}">
											<c:out value="중소기업"/>
										</c:when>
										<c:when test="${'2' eq cmpInfo.cmpKind}">
											<c:out value="중견기업"/>
										</c:when>
										<c:when test="${'3' eq cmpInfo.cmpKind}">
											<c:out value="대기업"/>
										</c:when>
										<c:when test="${'4' eq cmpInfo.cmpKind}">
											<c:out value="외국계 기업"/>
										</c:when>
										<c:when test="${'5' eq cmpInfo.cmpKind}">
											<c:out value="공공기업"/>
										</c:when>
										<c:otherwise>
											<c:out value="미지정 기업"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${'Y' eq cmpInfo.cmpApplyYn}">
											<p style="font-weight: bold;">
												<c:out value="지원완료"/>
											</p>
										</c:when>
										<c:when test="${'N' eq cmpInfo.cmpApplyYn}">
											<c:out value="미 지원"/>
										</c:when>
									</c:choose>
								</td>
								
								<td class="text-center">
									<c:out value="~ ${cmpInfo.cmpDeadlineDttm}"/>
									<c:choose>
										<c:when test="${'0' eq cmpInfo.deadlineDay }">
											<p style="color: red; font-weight: bold;">(오늘 마감)</p>
										</c:when>
										<c:when test="${0 > cmpInfo.deadlineDay}">
											<p style="color: red; font-weight: bold;">(공고 마감)</p>
										</c:when>
										<c:otherwise>
											<p style="color: red;font-weight: bold;">(${cmpInfo.deadlineDay}일 전)</p>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:if test="${'Y' eq cmpInfo.useYn}">
										<div class="text-center">
											<input type="button" class="btn btn-default" name= "cmpInfoUpdateBtn" data-id="${cmpInfo.cmpNo}" value="수정"/>
											<input type="button" class="btn btn-default" name= 'cmpInfoCancleBtn' data-id="${cmpInfo.cmpNo}" data-name="${cmpInfo.cmpTitle}"value="삭제"/>
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
							<td colspan="9" class="text-center text-import">해당 데이터가 존재하지 않습니다.</td>						
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		<a>
			<button class="btn btn-primary pull-right" type="button" id="cmpInfoInsertPageBtn">
				<c:out value="회사 등록하기"/>
			</button>
		</a>
		
		<nav aria-label="Page navigation example" style="text-align: center;">
			<ul class="pagination justify-content-center">
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
</html>