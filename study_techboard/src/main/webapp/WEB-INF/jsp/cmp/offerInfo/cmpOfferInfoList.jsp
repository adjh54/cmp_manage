<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../../js/cmp/offerInfo/cmpOfferInfoList.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>'이종훈'님의 제안정보 목록</h1>
		</div>
			<!-- Search Bar -->
			<div class="col-xs-6 col-xs-offset-7">
				<div class="input-group">
					<form class=" form-horizontal well" id="searchForm">
						<div class="input-group">
							<input type="radio" name="searchKeywordChk" value="type1" checked="checked"/>
							<select class="input-control" style="width:80px; height:25px;" id="searchKeyword" name="searchKeyword">
								<option value="default">선택</option>
								<option value="cmpTitle">회사명</option>
								<option value="cmpLocation">회사위치</option>
								<option value="cmpRecuritKind">공고유형</option>
								<option value="cmpApplyYn">지원상태</option>
							</select>
							<select class="input-control" style="width: 80px; height:25px;" id="searchKeywordNext"  disabled="disabled">
								<option value="default">선택</option>
							</select>
							<input class="input-control" type="text" id ="searchContent" name="searchContent" placeholder="검색어를 입력하세요">
							<button class="btn btn-sm btn-default" type="button" id="searchBtn">검색</button>
						</div>
						<br>
						<div class="input-group">
							<input type="radio" name="searchKeywordChk" value="type2"/>
							<div class="input-group-addon" style="width: 80px;">
								<c:out value="제안일자"/>
							</div>
							<input type="date" style="width: 130px;" id="regDttmStart" name="searchContent" disabled="disabled"/>
							<c:out value="~"/>
							<input type="date" style="width: 130px;" id="regDttmEnd" name="searchContent2" disabled="disabled"/>
							
							<button class="btn btn-sm btn-default" type="button" id="regDttmSearchBtn" disabled="disabled">검색</button>
						</div>
						
					</form>
				</div>
			</div>
			<div class="d-flex justify-content-between">
				<a>
					<button class="btn btn-info pull-right" type="button" id='cmpInfoPageBtn'>
						<c:out value="회사정보 목록"/>
					</button>
					<button class="btn btn-success pull-right" type="button" id='cmpBatchReplyBtn'>
						<c:out value="일괄 회신"/>
					</button>
				</a>
			</div>
		<form class="form-horizontal" id="cmpInfoListForm">
		<!-- Table Grid -->
		<div class="input-group"> 
			<c:out value="게시물 총 개수: ${cmpInfoOfferListCnt.cmpOfferInfoCnt}"/>
		</div>
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="4%"/>	<!-- 번호 				>> 	4 -->
				<col width="4%"/>	<!-- 번호 				>> 	4 -->
				<col width="7%"/>	<!-- 즐겨찾기 			>>	20 -->	
				<col width="10%"/>	<!-- 제안일자 			>>	20 -->	
				<col width="20%"/>	<!-- 회사명(회사위치) 	>>	20 -->	
				<col width="8%"/>	<!-- 공고유형 			>>	50 -->
				<col width="12%"/>	<!-- 회사규모			>>	70 -->
				<col width="12%"/>	<!-- 입사율/퇴사율		>>	70 -->
				<col width="7%"/>	<!-- 지원상태 			>>	85 -->
				<col width="12%"/>	<!-- 기능 				>>	85 -->
			</colgroup>
			
			<thead>
				<tr class="bg-light">
					<th class="text-center" colspan="10">
						<div class="input-group pull-left">
							<div class="input-control">
								<button class="btn btn-sm" type ="button" id="cmpInfoDownload">
									<c:out value="엑셀 다운로드"/>
								</button>
							</div>
						</div>
						<div class="input-group pull-right">
							<select class="input-control" style="height: 30px;" id="collectListPage">
								<option value="10">10개씩 보기</option>
								<option value="20">20개씩 보기</option>
								<option value="50">50개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							&nbsp;
							<select class="input-control" style="height: 30px;" id="kindOrdering" >
								<option value="REG_DTTM">최신순</option>
								<option value="CMP_TITLE">이름순</option>
								<option value="CMP_RECURIT_KIND">공고유형순</option>
								<option value="CMP_DEADLINE_DTTM">마감일자순</option>
							</select>
						</div>
					</th>
				</tr>
			
				<tr class="bg-info">
					<th class="text-center"><input type="checkbox" id="chkAll"/> </th>
					<th class="text-center">번호</th>
					<th class="text-center">즐겨찾기</th>
					<th class="text-center">제안일자</th>
					<th class="text-center">회사 명 (회사 위치)</th>
					<th class="text-center">공고유형</th>
					<th class="text-center">회사규모</th>
					<th class="text-center">입사율/퇴사율</th>
					<th class="text-center">지원상태</th>
					<th class="text-center">기능</th>
				</tr>
			</thead>
			
			<c:choose>
				<c:when test="${0 ne cmpInfoOfferListCnt.cmpOfferInfoCnt and '' ne cmpInfoOfferListCnt.cmpOfferInfoCnt}">
					<c:forEach items="${cmpOfferInfoList}" var="list">
						<tbody>
							<tr>
								<td class="text-center">
									<input class="form-check-input" type="checkbox" name="cmpBatchReply" data-cmpno ="${list.cmpNo}" data-cmpreplyyn= "${list.cmpReplyYn}" />
								</td>
								<td class="text-center">${list.rownum}</td>
								<td class="text-center" >
									<c:choose>
										<c:when test="${'N' eq list.cmpFavoritesYn}">
											<a class= "cmpFavoritesYn" data-id="${list.cmpFavoritesYn}" data-cmpNo="${list.cmpNo}" style="font-size: 25px;">☆</a>
										</c:when>
										<c:when test="${'Y' eq list.cmpFavoritesYn}">
											<a class= "cmpFavoritesYn" data-id="${list.cmpFavoritesYn}" data-cmpNo="${list.cmpNo}" style="font-size: 25px;">★</a>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center" >
									<c:out value="${list.regDttm}"/>(${list.regDayOfWeek})
								</td>
										
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
									
									<c:choose>
										<c:when test='${ "N" eq list.cmpBlockYn }'>
											<c:out value="(${list.cmpLocation})"/> 	
										</c:when>
										<c:when test='${ "Y" eq list.cmpBlockYn }'>
											<c:out value="(블록기업)"/>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${1 eq list.cmpRecuritKind}">
											<c:out value="사람인"/>
										</c:when>
										<c:when test="${2 eq list.cmpRecuritKind}">
											<c:out value="잡코리아"/>
										</c:when>
										<c:when test="${3 eq list.cmpRecuritKind}">
											<c:out value="헤드헌터"/><br>
											<c:choose>
												<c:when test="${'N' eq list.cmpReplyYn}">
													<p style="font-weight: bold; color: red;">(미 회신)</p>
												</c:when>
												<c:when test="${'Y' eq list.cmpReplyYn}">
													(회신완료)
												</c:when>
											</c:choose>
										</c:when>
										<c:when test="${4 eq list.cmpRecuritKind}">
											<c:out value="인사담당자"/><br>
											<c:choose>
												<c:when test="${'N' eq list.cmpReplyYn}">
													<p style="font-weight: bold; color: red;">(미 회신)</p>
												</c:when>
												<c:when test="${'Y' eq list.cmpReplyYn}">
													(회신완료)
												</c:when>
											</c:choose>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${'N' eq list.cmpBlockYn}">
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
												<c:when test="${'5' eq list.cmpKind}">
													<c:out value="공공기업"/>
												</c:when>
												<c:otherwise>
													<c:out value="미지정 기업"/>
												</c:otherwise>
											</c:choose>	
										</c:when>
										<c:when test="${'Y' eq list.cmpBlockYn}">
											<c:out value="블록기업"/>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${'N' eq list.cmpBlockYn}">
											${list.cmpIncedenceRate}% / ${list.cmpResignationRate}%
										</c:when>
										<c:when test="${'Y' eq list.cmpBlockYn}">
											<c:out value="블록기업"/>
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${'Y' eq list.cmpApplyYn}">
											<p style="font-weight: bold;">
												<c:out value="지원완료"/>
											</p>
										</c:when>
										<c:when test="${'N' eq list.cmpApplyYn}">
											<c:out value="미 지원"/>
										</c:when>
									</c:choose>
								</td>
								
								<td>
									<c:if test="${'Y' eq list.useYn and 'N' eq list.cmpReplyYn}">
										<div class="text-center">
											<input type="button" class="btn btn-default" name= "cmpInfoUpdateBtn" data-id="${list.cmpNo}" value="수정"/>
											<input type="button" class="btn btn-default" name= 'cmpInfoCancleBtn' data-id="${list.cmpNo}" data-name="${list.cmpTitle}"value="삭제"/>
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
							<td colspan="10" class="text-center text-import">해당 데이터가 존재하지 않습니다.</td>						
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		<a>
			<button class="btn btn-primary pull-right" type="button" id="insertCmpOfferInfoPageBtn">
				<c:out value="제안받은 회사등록"/>
			</button>
		</a>
	</div>
	<!-- class="row" -->
	
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
</body>
</html>