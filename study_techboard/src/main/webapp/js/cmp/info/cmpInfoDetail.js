/**
 * 회사_정보 상세 조회 페이지  
 * 작성 JQuery 문
 */
$(function(){
	
	/*
	 * '취소' 버튼 처리 함수
	 * cmpInfoList 플래그 일 경우 => 회사 목록 페이지 이동
	 * cmpApplyInfoList 플래그 일 경우 => 회사 지원 목록 페이지 이동 (차후 이용자에 따라서 페이지 이동하도록 변경)
	 * SELECT
	 */
	$('#cmpInfoCancleBtn').click(function(e){
		
		var cmpPageFlag = $('#cmpPageFlag').val();
		
		if("cmpInfoList" == cmpPageFlag){
			$(this).parents('a').attr('href', '/cmp/info/cmpInfoList');
		
		} else if ("cmpApplyInfoList" == cmpPageFlag){
			$(this).parents('a').attr('href', '/cmp/applyInfo/cmpApplyInfoList');
			
		} else if ("cmpOfferInfoList" == cmpPageFlag){
			$(this).parents('a').attr('href', '/cmp/offerInfo/cmpOfferInfoList');
		}
		
		
	});
	
	/*
	 * '한줄평 수정' 버튼 처리 함수
	 * UPDATE
	 */
	$('#cmpCommentBtn').click(function(e){
		var result = confirm("한줄평을 수정하시겠습니까?");

		if(result){
			
			e.preventDefault();
			$('#cmpInfoDetailForm').attr('action', '/cmp/info/cmpInfoUpdateEtc');
			$('#cmpInfoDetailForm').attr('method', 'POST');
			$('#cmpInfoDetailForm').attr('target', '_self')
			$('#cmpInfoDetailForm').submit();
		}
	});
	
	/*
	 * '회사 지원하기' 버튼 처리 함수
	 */
	$('#cmpApplyYnBtn').click(function(e){
		var result = confirm("회사를 지원하시겠습니까?");
		
		if(result){
			
			e.preventDefault();
			$('#cmpInfoDetailForm').attr('action', '/cmp/info/cmpInfoUpdateApplyYn');
			$('#cmpInfoDetailForm').attr('method', 'POST');
			$('#cmpInfoDetailForm').attr('target', '_self')
			$('#cmpInfoDetailForm').submit();
		}
	});
	
	/*
	 * '회사 회신' 버튼 처리 함수
	 */
	$('#cmpReplyYnBtn').click(function(e){
		
		var result = confirm("회사 제안을 회신하였습니까??");
		
		if(result){
			var cmpApplyYn = $('#cmpReplyYn').val('Y');
			
			e.preventDefault();
			$('#cmpInfoDetailForm').attr('action', '/cmp/info/cmpInfoUpdateReplyYn');
			$('#cmpInfoDetailForm').attr('method', 'POST');
			$('#cmpInfoDetailForm').attr('target', '_self')
			$('#cmpInfoDetailForm').submit();
		}
	});
	
});