/**
 * 회사_지원_정보 목록 조회 페이지  
 * 작성 JQuery 문
 */
$(function(){
	
	
	/*
	 * 회사_정보 목록 페이지 이동 처리 함수
	 * SELECT
	 */
	$('#cmpInfoPageBtn').on('click', function(e){
		$(this).parents('a').attr('href', '/cmp/info/cmpInfoList');
	});
	
	/*
	 * 회사_정보 상세 조회 페이지 이동 처리 함수
	 * SELECT
	 */
	$('.cmpTitle').on('click', function(e){
	
		e.preventDefault();

		var cmpNo = $(this).data('id');
		
		var formTag = '<form id="cmpApplyDetailForm"></form>'
		var cmpNoTag = '<input type ="hidden" name="cmpNo" value=' + cmpNo + '>';
		var pageFlagTag = '<input type ="hidden" name="cmpPageFlag" value= "cmpApplyInfoList">';
		
		$('body').append(formTag);
		$('#cmpApplyDetailForm').append(cmpNoTag);
		$('#cmpApplyDetailForm').append(pageFlagTag);

		$('#cmpApplyDetailForm').attr('action', '/cmp/info/cmpInfoDetail');
		$('#cmpApplyDetailForm').attr('method', 'POST');
		$('#cmpApplyDetailForm').attr('target', '_self')
		$('#cmpApplyDetailForm').submit();
	});
	
	/*
	 * 면접 등록 처리 함수 
	 * UPDATE
	 */
    $('input[name=interviewInsertBtn]').on('click', function(e){
    	
    	e.preventDefault();

		var cmpApplyNo = $(this).data('id');
		
		var formTag = '<form id="cmpApplyDetailForm"></form>'
		var cmpApplyNoTag = '<input type ="hidden" name="cmpApplyNo" value=' + cmpApplyNo + '>';
		
		$('body').append(formTag);
		$('#cmpApplyDetailForm').append(cmpApplyNoTag);

		$('#cmpApplyDetailForm').attr('action', '/cmp/applyInfo/cmpApplyInfoUpdatePage');
		$('#cmpApplyDetailForm').attr('method', 'POST');
		$('#cmpApplyDetailForm').attr('target', '_self')
		$('#cmpApplyDetailForm').submit();
    });
    
    
    /*
     * 상태변경 버튼 처리 함수 
     */
    $('input[name=statusChangeBtn]').on('click', function(e){
    	alert('상태변경 연동');
    });
    
    /*
     * 상태가 '진행중' 버튼 처리 함수
     */
    $('.proceedingStatus').on('click', function(e){
    	alert("진행중 상태 연동완료");
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
    
});

/**
 * 페이징 처리 
 * @param curPage
 * @returns
 */
function fn_paging(curPage){
	location.href = "/cmp/applyInfo/cmpApplyInfoList?curPage=" + curPage;
}
