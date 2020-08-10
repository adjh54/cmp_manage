<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../js/board/boardList.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>기술게시판 목록</h1>
		</div>
		
		<!-- Search Bar -->
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
		
		<!-- Table Grid -->
		<div> 게시물 총 개수: ${boardListCnt.boardCnt}</div>
		<table class="table table-bordered table-hover">
			<colgroup>
				<col width="4%"/>	<!-- 번호 		>> 	4 -->
				<col width="7%"/>	<!-- 종류 		>>	11 -->	
				<col width="20%"/>	<!-- 제목 		>>	31 -->
				<col width="35%"/>	<!-- 내용 		>>	61 -->
				<col width="8%"/>	<!-- 등록자ID 	>>	69 -->
				<col width="8%"/>	<!-- 등록일자 	>>	78 -->
				<col width="8%"/>	<!-- 신청일자 	>>	86 -->
				<col width="4%"/>	<!-- 상태 		>>	90 -->
				<col width="5%"/>	<!-- 조회수 	>>	95-->
			</colgroup>
			<thead>
				<tr class="bg-info">
					<th class="text-center">번호</th>
					<th class="text-center">종류</th>
					<th class="text-center">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center">등록자 ID</th>
					<th class="text-center">등록일자</th>
					<th class="text-center">신청일자</th>
					<th class="text-center">상태</th>
					<th class="text-center">조회수</th>
				</tr>
			</thead>
			
			<c:choose>
				<c:when test="${0 ne boardListCnt.boardCnt and '' ne boardListCnt.boardCnt}">
					<c:forEach items="${boardList}" var="board">
						<tbody>
							<tr>
								<td class="text-center">${board.rownum}</td>
								<td class="text-center">${board.boardKindName}</td>
								<td><a style="cursor: hand;" data-id="${board.boardId}">${board.boardTitle}</a></td>
								<td class="two-line">${board.boardCn}</td>
								<td class="text-center">${board.regstId}</td>
								<td class="text-center">${board.rgsrDttm}</td>
								<td class="text-center">${board.rqstDttm}</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${board.rqstTpCd eq '01'}">
											<c:out value="등록"></c:out>	
										</c:when>
										<c:when test="${board.rqstTpCd eq '02'}">
											<c:out value="승인"></c:out>	
										</c:when>
										<c:when test="${board.rqstTpCd eq '01'}">
											<c:out value="반려"></c:out>	
										</c:when>
									</c:choose>
								</td>
								<td class="text-center">${board.qryCnt}</td>
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
		
		
		<nav aria-label="Page navigation example">
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
		<a><button class="btn btn-primary pull-right" type="button" id= "boardRegistBtn">게시글 글쓰기</button></a>
	</div>
</div>
</body>
</html>