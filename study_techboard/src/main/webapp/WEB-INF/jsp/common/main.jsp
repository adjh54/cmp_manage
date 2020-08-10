<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>

<script type="text/javascript">
	/* 
	 * Javascript / jQuery 영역 
	 */
	$(function(){

		/*
		* '강민우 영역' 버튼 클릭 Function
		*/
		$('#mBtnHtml').click(function(){
			$(this).parents("a").attr("href", "/study/html");
		})
		$('#mBtnJavascript').click(function(){
			$(this).parents("a").attr("href", "/study/javascript");
		})
		$('#mBtnJquery').click(function(){
			$(this).parents("a").attr("href", "/study/jquery");
		})
		$('#mBtnJava').click(function(){
			$(this).parents("a").attr("href", "/study/java");
		})
		
		/*
		* '이종훈 영역' 버튼 클릭 Function
		*/
		$('#jBtn').click(function(){
			$(this).parents("a").attr("href", "/board/boardList");
		});
		
		/*
		* '지원목록 영역' 버튼 클릭 Function
		*/
		$('#cmpInfoPage').click(function(){
			$(this).parents('a').attr('href', '/cmp/info/cmpInfoList')
		})
		
		/*
		* '계산기 기능' 버튼 클릭 Function
		*/
		$('#calculatorPage').click(function(){
			$(this).parents("a").attr("href", "/ectFunction/calculator");
		});
		/*
		* '주소 검색 기능' 버튼 클릭 Function
		*/
		$('#addressPage').click(function(){
			$(this).parents("a").attr("href", "/ectFunction/addressList");
		});
		/*
		* '맵(네이버, 구글)' 버튼 클릭 Function
		*/
		$('#mapPage').click(function(){
			$(this).parents("a").attr("href", "/ectFunction/mapList");
		});
		
	});
</script>
</head>


	<div class="container">
		<div class="row">
			<div class="jumbotron text-center"> 
				<p>메인 페이지</p>
				<p>아래를 선택하시오</p>
			</div>

    		<div class="col text-center">
 				<table class="table table-dark">
 					<thead class="bg-dark"'>
 						<tr class="bg-info">
	    					<th scope="col" class="text-center">개발자 영역</th>
	    					<th scope="col" class="text-center">사용 URL</th>
	    				</tr>
 					</thead>
 					
 					<tbody>
 						<tr>
	    					<th class="text-center">강민우 영역</th>
	    					<td>
	    						<a>
	    							<button class="btn btn-danger" id= "mBtnHtml">HTML</button>
	    							<button class="btn btn-danger" id= "mBtnJavascript">JavaScript</button>
	    							<button class="btn btn-danger" id= "mBtnJquery">JQuery</button>
	    							<button class="btn btn-danger" id= "mBtnJava">JAVA</button>
	    						</a>
	    					</td>
	    				</tr>
    			
	    				<tr>
	    					<th class="text-center">이종훈 영역</th>
	    					<td>
	    						<a>
	    							<button class="btn btn-success" id= "jBtn">이종훈 영역</button>
	    							<button class="btn btn-success" id= "cmpInfoPage">통합 회사지원 관리시스템</button>
	    						</a>
	    					</td>
	    				</tr>
	    				
	    				<tr>
	    					<th class="text-center">기타 유틸리티</th>
	    					<td>
	    						<a>
	    							<button class="btn btn-success" id= "calculatorPage">계산기</button>
	    							<button class="btn btn-success" id= "addressPage">주소 검색</button>
	    							<button class="btn btn-success" id= "mapPage">맵(네이버, 구글)</button>
	    						</a>
	    					</td>
	    				</tr>
 					</tbody>
    			</table>

		    </div>
		  </div>
	</div>
</html>