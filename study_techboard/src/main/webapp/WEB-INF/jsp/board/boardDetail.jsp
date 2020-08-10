<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../js/board/boardDetail.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>

<body>
<div class="container">
	<div class= "row">
		<div class="page-header">
			<h1>기술게시판 상세목록</h1>
		</div>
		<button class="btn btn-danger pull-right" type="button" id= "boardDeleteBtn">게시글 삭제</button>
		<form class="form-horizontal" id="modifyForm">
		<input type="hidden" name = "boardId" value="${boardDetailItem.boardId}"/>
			<table class="table table-bordered table-hover">
				<colgroup>
					<col width="20%">	<!-- 20 -->
					<col width="80%">	<!-- 100 -->
				</colgroup>
				
				<tr>
					<th>게시물 명</th>
					<td><input class= "form-control" type="text" name="boardTitle" value="${boardDetailItem.boardTitle}"/></td>
				</tr>
				<tr>
					<th>게시물 내용</th>
					<td><textarea class="form-control" rows="10" name="boardCn">${boardDetailItem.boardCn}</textarea> </td>
				</tr>
				<tr>
					<th>게시물 종류</th>
					<td>
						<select class="form-control" name="boardKindCode">
							<option value="01" <c:if test="${'01' eq boardDetailItem.boardKindCode}">selected</c:if> >JAVA</option>
							<option value="02" <c:if test="${'02' eq boardDetailItem.boardKindCode}">selected</c:if> >DATABASE</option>
							<option value="99" <c:if test="${'99' eq boardDetailItem.boardKindCode}">selected</c:if> >Extra</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>부가 설명 내용</th>
					<td><textarea class="form-control" rows="5" name="addDescCn">${boardDetailItem.addDescCn}</textarea> </td>			
				</tr>
				<tr>
					<th>등록자 ID</th>
					<td><input type="text" class="form-control" value="${boardDetailItem.regstId}" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td><input type="text" class="form-control" value="${boardDetailItem.rgsrDttm}" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>신청자 ID</th>
					<td><input type="text" class="form-control" value="${boardDetailItem.aplcId}" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>신청일자</th>
					<td><input type="text" class="form-control" value="${boardDetailItem.rqstDttm}" readonly="readonly"/></td>
				</tr>
			</table>
		</form>
		<a><button class="btn btn-danger pull-right" type="button" id= 'boardCancleBtn'>취소</button></a>
		<button class="btn btn-success pull-right" type="button" id= "cmpInfoModBtn">수정</button>
	</div>
</div>
</body>
</html>