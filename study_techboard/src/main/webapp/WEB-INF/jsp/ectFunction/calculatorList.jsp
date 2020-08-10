<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../js/etcFunction/calculatorList.js"></script>			<!-- 외부 JS 파일 잡기 -->
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h1>계산기</h1>
			</div>
			<table class="table table-bordered">
				<thead>
					<colgroup>
						<col width="33%">
						<col width="33%">
						<col width="33%">
					</colgroup>
				</thead>
				
				<tbody style="text-align: center;">
					<tr>
						<td>미리보기 창</td>
						<td colspan="2">
							<input type="text" disabled="disabled" id="preCalcuText"/>
						</td>
					</tr>
					
					<tr>
						<td colspan="3">
							<input type="text" id="calcuText" name="calcuText" disabled="disabled"/>
							<i class="fa fa-caret-square-o-left" aria-hidden="true">
								<button class="btn"  id ="backSpace">지우기</button>
							</i>
						</td>
					</tr>
					
					<tr>
						<td><button class="btn" disabled="disabled">.</button></td>
						<td><button class="btn" id="resetBtn">C</button></td>
						<td><button class="btn" id="resultBtn" value ="=">=</button></td>
					</tr>
					
					<tr>
						<td><button class="btn signBtn" value="+">+</button></td>
						<td><button class="btn signBtn" value="-">-</button></td>
						<td><button class="btn signBtn" value="/">/</button></td>
					</tr>
					<tr>
						<td><button class="btn numberBtn" value="7">7</button></td>
						<td><button class="btn numberBtn" value="8">8</button></td>
						<td><button class="btn numberBtn" value="9">9</button></td>
					</tr>
					<tr>
						<td><button class="btn numberBtn" value="4">4</button></td>
						<td><button class="btn numberBtn" value="5">5</button></td>
						<td><button class="btn numberBtn" value="6">6</button></td>
					</tr>
					<tr>
						<td><button class="btn numberBtn" value="1">1</button></td>
						<td><button class="btn numberBtn" value="2">2</button></td>
						<td><button class="btn numberBtn" value="3">3</button></td>
					</tr>
					
					<tr>
						<td><button class="btn">.</button></td>
						<td><button class="btn numberBtn" value="0">0</button></td>
						<td><button class="btn">.</button></td>
					</tr>
				</tbody>
			</table>
		</div>
		<a class="btn btn-primary" href="/" role="button">메인으로 이동</a>
	</div>
	
</body>
</html>