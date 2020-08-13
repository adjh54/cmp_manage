/**
 * 회사_정보 게시글 목록 조회 페이지  
 * 작성 JQuery 문
 */
$(function(){
	
	// 초기 선택 값을 '회사명'으로 설정
	//$("#searchKeyword option:eq(1)").attr("selected","selected");
	
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
	
	/**
	 * 20개 / 50개 / 100개씩 묶어서 보기 기능
	 * SELECT
	 */
	$("#collectListPage").on('change', function(e){
	
		var pageSize = $(this).val();
		
//		location.href = "/cmp/info/cmpInfoList?pageSize=" + pageSize;
		
		var inputTag = '<input type ="hidden" name="pageSize" value=' + pageSize + '>';
		
		$('#searchForm').append(inputTag);
		
		e.preventDefault(); // 내장된 이벤트를 차단하는 명령
		$('#searchForm').attr('action', '/cmp/info/cmpInfoList');
		$('#searchForm').attr('method', 'POST');
		$('#searchForm').attr('target', '_self')
		$('#searchForm').submit();
	});
	
	$("#kindOrdering").on("change", function(e){
		var kind = "A."+$(this).val();

		var orderKind = '<input type ="hidden" name="orderKind" value=' + kind + '>';
		var ordering = '<input type ="hidden" name="ordering" value= "ASC">';
		var orderingFlag = '<input type ="hidden" name="orderingFlag" value= "Y">';
		
		$('#searchForm').append(orderKind);
		$('#searchForm').append(ordering);
		$('#searchForm').append(orderingFlag);
		
		e.preventDefault(); // 내장된 이벤트를 차단하는 명령
		$('#searchForm').attr('action', '/cmp/info/cmpInfoList');
		$('#searchForm').attr('method', 'POST');
		$('#searchForm').attr('target', '_self')
		$('#searchForm').submit();
	})
	
	
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
    
    $('#searchReset').on("click", function(e){
    	$("#type1Chk").prop("checked", true);
    	
    	// 활성화
		$('#type1SearchKeyword').attr("disabled", false);
		$('#type1SearchKeyContent').attr("disabled", false);
		
		// 비 활성화
		$('#type2SearchKeyword').attr("disabled", true);
		$('#type2SearchKeyContent').attr("disabled", true);
		$('#type3SearchKeyword').attr("disabled", true);
		$('#type3SearchKeyContent').attr("disabled", true);
		
    	$('#type1SearchKeyword option:eq(0)').prop("selected", true);
		$('#type1SearchKeyContent').val("");
		$('#type2SearchKeyword option:eq(0)').prop("selected", true);
		$('#type2SearchKeyContent option:eq(0)').prop("selected", true);
		$('#type3SearchKeyword option:eq(0)').prop("selected", true);
		$('#type3SearchKeyContent option:eq(0)').prop("selected", true);
    });
    
    
    /*
     * 선택적 조회 기능
     */
    $("input[name=searchKeywordChk").on("click", function(e){
    	var type = $(this).val();
    	
    	if("type1" == type){
    		// 활성화
    		$('#type1SearchKeyword').attr("disabled", false);
    		$('#type1SearchKeyContent').attr("disabled", false);
    		
    		// 비 활성화
    		$('#type2SearchKeyword').attr("disabled", true);
    		$('#type2SearchKeyContent').attr("disabled", true);
    		$('#type3SearchKeyword').attr("disabled", true);
    		$('#type3SearchKeyContent').attr("disabled", true);
    		
    	}
    	else if("type2" == type){
    		// 활성화
    		$('#type2SearchKeyword').attr("disabled", false);
    		$('#type2SearchKeyContent').attr("disabled", false);
    		
    		// 비 활성화
    		$('#type1SearchKeyword').attr("disabled", true);
    		$('#type1SearchKeyContent').attr("disabled", true);
    		$('#type3SearchKeyword').attr("disabled", true);
    		$('#type3SearchKeyContent').attr("disabled", true);
    	}
    	
    	if("type3" == type){
    		// 활성화
    		$('#type3SearchKeyword').attr("disabled", false);
    		$('#type3SearchKeyContent').attr("disabled", false);
    		
    		// 비 활성화
    		$('#type1SearchKeyword').attr("disabled", true);
    		$('#type1SearchKeyContent').attr("disabled", true);
    		$('#type2SearchKeyword').attr("disabled", true);
    		$('#type2SearchKeyContent').attr("disabled", true);
    	}
    
    });
    
    $("#cmpInfoDownload").on('click', function(e){
    	alert("다운로드 기능 구현 예정");
    })

});

/**
 * 페이징 처리 
 * @param curPage
 * @returns
 */
function fn_paging(curPage){
	location.href = "/cmp/info/cmpInfoList?curPage=" + curPage;
}

