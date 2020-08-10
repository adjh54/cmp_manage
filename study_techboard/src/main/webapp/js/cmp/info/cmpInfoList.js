/**
 * 회사_정보 게시글 목록 조회 페이지  
 * 작성 JQuery 문
 */
$(function(){
	
	// 초기 선택 값을 '회사명'으로 설정
	$("#searchKeyword option:eq(1)").attr("selected","selected");
	
	/*
	 * 게시글 검색 기능
	 * SELECT
	 */
	$('#searchBtn').on('click', function(e){

		e.preventDefault(); // 내장된 이벤트를 차단하는 명령
		$('#searchForm').attr('action', '/cmp/info/cmpInfoList');
		$('#searchForm').attr('method', 'POST');
		$('#searchForm').attr('target', '_self')
		$('#searchForm').submit();
		
	});
	
    /*
	 * 게시판 글 삭제
	 * UPDATE
	 */
    $('input[name=cmpInfoCancleBtn]').on('click', function(e){
    	
    	var cmpTitle = $(this).data("name");
    	
    	var result = confirm("'"+cmpTitle+"'의 회사정보를 삭제하시겠습니까?");
		
		if(result){
			
	    	e.preventDefault();
	    	
	    	var cmpNo = $(this).data('id');
	    	
	    	var formTag = '<form id="cmpInfoDeleteForm"></form>'
			var inputTag = '<input type ="hidden" name="cmpNo" value=' + cmpNo + '>';
			
			$('body').append(formTag);
			$('#cmpInfoDeleteForm').append(inputTag);
	
			
			$('#cmpInfoDeleteForm').attr('action', '/cmp/info/cmpInfoDelete');
			$('#cmpInfoDeleteForm').attr('method', 'POST');
			$('#cmpInfoDeleteForm').attr('target', '_self')
			$('#cmpInfoDeleteForm').submit();
		}
    });
    
    /*
     * 즐겨찾기 등록 / 해제 기능 
     * UPDATE
     */
    $('.cmpFavoritesYn').on('click', function(e){
    	
    	var cmpNoVal = $(this).data('cmpno');
    	var cmpFavoritesYnVal = $(this).data('id');
    	
    	
    	if("Y" == cmpFavoritesYnVal){
    		cmpFavoritesYnVal = "N"
    	}
    	else if("N" == cmpFavoritesYnVal){
    		cmpFavoritesYnVal = "Y"
    	}

    	var allData = {"cmpNo":cmpNoVal, "cmpFavoritesYn": cmpFavoritesYnVal};
		
		$.ajax({
	        url:"/cmp/info/cmpInfoUpdateFavoritesYn",
	        type:'POST',
	        data: allData,
	        success:function(data){
	        	location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
    });
    
    /*
     * 회사 좋아요 등록 / 해제 기능 
     * UPDATE
     */
    $('.cmpGoodYn').on('click', function(e){
    	
    	var cmpNoVal = $(this).data('cmpno');
    	var cmpGoodYn = $(this).data('id');
    	
    	if("Y" == cmpGoodYn){
    		cmpGoodYn = "N"
    	}
    	else if("N" == cmpGoodYn){
    		cmpGoodYn = "Y"
    	}

    	var allData = {"cmpNo":cmpNoVal, "cmpGoodYn": cmpGoodYn};
		
		$.ajax({
	        url:"/cmp/info/cmpInfoUpdateGoodYn",
	        type:'POST',
	        data: allData,
	        success:function(data){
	        	location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
    });
    
    /*
	 * 게시판 글 상세 페이지 이동
	 * POST 방식을 사용하기 위해서 동적 form 방식 이용
	 * ==> 해당 기술이 표준인지 아닌지는 모르겠음.. 다른 방식도 있을텐데...
	 * SELECT
	 */
	$('.cmpTitle').on('click', function(e){
	
		e.preventDefault();

		var cmpNo = $(this).data('id');
		
		var formTag = '<form id="cmpDetailForm"></form>'
		var inputTag = '<input type ="hidden" name="cmpNo" value=' + cmpNo + '>';
		var pageFlagTag = '<input type ="hidden" name="cmpPageFlag" value= "cmpInfoList">';
		
		$('body').append(formTag);
		$('#cmpDetailForm').append(inputTag);
		$('#cmpDetailForm').append(pageFlagTag);

		$('#cmpDetailForm').attr('action', '/cmp/info/cmpInfoDetail');
		$('#cmpDetailForm').attr('method', 'POST');
		$('#cmpDetailForm').attr('target', '_self')
		$('#cmpDetailForm').submit();
		
	});
	
	/*
	 * 게시판 글 수정 페이지 이동
	 * SELECT
	 */
    $('input[name=cmpInfoUpdateBtn]').on('click', function(e){
    	e.preventDefault();
    	
    	var cmpNo = $(this).data('id');
    	
    	var formTag = '<form id="cmpInfoUpdateForm"></form>'
		var inputTag = '<input type ="hidden" name="cmpNo" value=' + cmpNo + '>';
		
		$('body').append(formTag);
		$('#cmpInfoUpdateForm').append(inputTag);

		$('#cmpInfoUpdateForm').attr('action', '/cmp/info/cmpInfoUpdatePage');
		$('#cmpInfoUpdateForm').attr('method', 'POST');
		$('#cmpInfoUpdateForm').attr('target', '_self')
		$('#cmpInfoUpdateForm').submit();
		
    });

    /*
     * 게시판 글 등록 페이지 이동
     * SELECT
     */
    $('#cmpInfoInsertPageBtn').on('click', function(e){
    	
    	$(this).parents('a').attr('href', '/cmp/info/cmpInfoInsertPage');
    
    });
    
    /*
	 * 내 지원목록 페이지 이동
	 * SELECT
	 */
    $('#cmpApplyInfoPageBtn').on('click', function(e){
    	
    	$(this).parents('a').attr('href', '/cmp/applyInfo/cmpApplyInfoList');
    
    });
    
    /*
	 * 회사 제안 정보 페이지 이동
	 * SELECT
	 */
    $('#cmpOfferInfoPageBtn').on('click', function(e){
    
    	$(this).parents('a').attr('href', '/cmp/offerInfo/cmpOfferInfoList');
    
    });
    
    /*
     * 정렬기능 처리 
     * SELECT
     */
    $("a.descFlag").on('click', function(e){
    	
    	var orderkind = $(this).data("orderkind");
    	var ordering = $(this).data("ordering");

    	alert("orderkind   ["+orderkind+"] ordering   [ "+ordering+"]")
//    	console.log("orderkind>>> "+ orderkind + "/// ordering: "+ordering);
    	
    	var formTag = '<form id="cmpInfoSearchForm" action="/cmp/info/cmpInfoList" method="POST target="_self"></form>'
		var inputTag1 = '<input type ="hidden" name="orderingFlag" value="Y">';
		var inputTag2 = '<input type ="hidden" name="orderKind" value=A.'+orderkind+'>';
		var inputTag3 = '<input type ="hidden" name="ordering" value='+ordering+'>';
		
		$('body').append(formTag);
		$('#cmpInfoSearchForm').append(inputTag1);
		$('#cmpInfoSearchForm').append(inputTag2);
		$('#cmpInfoSearchForm').append(inputTag3);

		$('#cmpInfoSearchForm').submit();
		
    });
    
    /*
     * 공고유형 / 지원상태 검색 기능
     */
    $("#searchKeyword").on('change', function(e){
    	
    	var selectedVal = $(this).val();
    	
    	if("cmpRecuritKind" == selectedVal || "cmpApplyYn" == selectedVal || "cmpGoodYn" == selectedVal){
    		
    		$('#searchKeywordNext').attr("disabled", false);
    		$('#searchKeywordNext').attr("name", "searchContent");
    		$('#searchContent').attr("disabled", true);
    		
    		var appendCheckVal = $('#searchKeywordNext option:eq(1)').val()

    		if("cmpRecuritKind" == selectedVal){
    			
    			if( "" != appendCheckVal ){
    				$("#searchKeywordNext option:eq(1)").remove();
    				$("#searchKeywordNext option:eq(2)").remove();
    				$("#searchKeywordNext option:eq(3)").remove();
    				$("#searchKeywordNext option:eq(4)").remove();
    				
    			}
    			$("#searchKeywordNext option:eq(0)").after("<option value='1'>사람인</option>");
    			$("#searchKeywordNext option:eq(1)").after("<option value='2'>잡코리아</option>");
    			$("#searchKeywordNext option:eq(2)").after("<option value='3'>헤드헌터</option>");
    			$("#searchKeywordNext option:eq(3)").after("<option value='4'>인사담당자</option>");
    		}
    		else if("cmpApplyYn" == selectedVal){

    			if( "" != appendCheckVal){
    				$("#searchKeywordNext option:eq(1)").remove();
    				$("#searchKeywordNext option:eq(2)").remove();
        			$("#searchKeywordNext option:eq(3)").remove();
        			$("#searchKeywordNext option:eq(4)").remove();
    			}
    			
    			$("#searchKeywordNext option:eq(0)").after("<option value='Y'>지원</option>");
    			$("#searchKeywordNext option:eq(1)").after("<option value='N'>미지원</option>");
    		}
    		else if("cmpGoodYn" == selectedVal){
    			if( "" != appendCheckVal){
    				$("#searchKeywordNext option:eq(1)").remove();
    				$("#searchKeywordNext option:eq(2)").remove();
        			$("#searchKeywordNext option:eq(3)").remove();
        			$("#searchKeywordNext option:eq(4)").remove();
    			}
    			$("#searchKeywordNext option:eq(0)").after("<option value='Y'>좋아요</option>");
    			$("#searchKeywordNext option:eq(1)").after("<option value='N'>안좋아요</option>");
    		}
    		else {
    		$('#searchKeywordNext').attr("disabled", true);
    		$('#searchContent').attr("disabled", false);
    		}
    	
    	}
    
    });

});

/**
 * 페이징 처리 
 * @param curPage
 * @returns
 */
function fn_paging(curPage){
	location.href = "/cmp/info/cmpInfoList?curPage=" + curPage;
}

