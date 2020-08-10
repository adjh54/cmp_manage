<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../js/board/boardRegist.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>게시글 등록</h1>
		</div>
		
		<form class="form-horizontal" id="registForm">
			<table border="1" class="table table-bordered table-hover">
					<colgroup>
						<col width="20%">	<!-- 20 -->
						<col width="80%">	<!-- 100 -->
					</colgroup>
					<tr>
						<th>게시물 명</th>
						<td><input class= "form-control" type="text" name="boardTitle"/></td>
					</tr>
					<tr>
						<th>게시물 내용</th>
						<td><textarea class="form-control" rows="5" name="boardCn"></textarea> </td>
					</tr>
					<tr>
						<th>게시물 종류</th>
						<td>
							<select class="form-control" name="boardKindCode">
								<option value="01">JAVA</option>
								<option value="02">DATABASE</option>
								<option value="99">Extra</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>등록자 ID</th>
						<td><input type="text" class="form-control"  name="regstId" value="adjh54" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>부가 설명 내용</th>
						<td><textarea class="form-control" rows="5" name="addDescCn"></textarea> </td>			
					</tr>
			</table>
		</form>
		<a><button class="btn btn-danger pull-right" type="button" id= 'boardCancleBtn'>취소</button></a>
		<button class="btn btn-success pull-right" type="button" id= "boardRegistBtn">등록</button>
	</div>
</div>

</body>
</html>