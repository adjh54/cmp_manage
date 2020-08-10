/**
 * 회사 지원 상태 정보 
 * 관련 Function
 */

$(function(){
	
	var applyDocKindCode = $('#cmpApplyDocKindCode').val();
	var apply1stKindCode = $('#cmpApply1stKindCode').val();
	var apply2stKindCode = $('#cmpApply2stKindCode').val();
	
	
	// 대기중(A00) / 합격(A03)/ 불합격(A04)/ 미연락(A05) / 최종합격(A07) 상태는 disabled 처리  
	if ( ("A00" == applyDocKindCode) || ("A03" == applyDocKindCode) || ("A04" == applyDocKindCode) || ("A05" == applyDocKindCode) 
			|| ("A07" == applyDocKindCode) ){
		$('#cmpApplyDocInterviewDttm').attr("disabled", true);
		$('#cmpApplyDocInterviewTime').attr("disabled", true);
		$('#cmpApplyDocInterviewInfo').attr("disabled", true);
		
		// 합격(A03)/ 불합격(A04) / 최종합격(A07) 상태에는 '최종결과 일자' 사용 가능 처리 
		if ( ("A03" == applyDocKindCode) || ("A04" == applyDocKindCode) || ("A07" == applyDocKindCode) ){
			$('#cmpApplyDocResultDttm').attr("disabled", false);
		} else{
			$('#cmpApplyDocResultDttm').attr("disabled", true);
		}
	}
	
	
	// 대기중(A00) / 합격(A03)/ 불합격(A04)/ 미연락(A05) / 최종합격(A07) ) / 미참석(A09) 상태는 disabled 처리
	if ( ("A00" == apply1stKindCode) || ("A03" == apply1stKindCode) || ("A04" == apply1stKindCode) || ("A05" == apply1stKindCode) 
			|| ("A07" == apply1stKindCode) || ("A09" == apply1stKindCode) ){
		$('#cmpApply1stInterviewDttm').attr("disabled", true);
		$('#cmpApply1stInterviewTime').attr("disabled", true);
		$('#cmpApply1stInterviewInfo').attr("disabled", true);
		
		// 합격(A03)/ 불합격(A04) / 최종합격(A07) 상태에는 '최종결과 일자' 사용 가능 처리 
		if ( ("A03" == apply1stKindCode) || ("A04" == apply1stKindCode) || ("A07" == apply1stKindCode) ){
			$('#cmpApply1stResultDttm').attr("disabled", false);
		} else{
			$('#cmpApply1stResultDttm').attr("disabled", true);
		}
	}
	
	// 대기중(A00) / 합격(A03)/ 불합격(A04)/ 미연락(A05) / 최종합격(A07) / 미참석(A09) 상태는 disabled 처리
	if ( ("A00" == apply2stKindCode) || ("A03" == apply2stKindCode) || ("A04" == apply2stKindCode) || ("A05" == apply2stKindCode) 
			|| ("A07" == apply2stKindCode) || ("A09" == apply1stKindCode)){
		$('#cmpApply2stInterviewDttm').attr("disabled", true);
		$('#cmpApply2stInterviewTime').attr("disabled", true);
		$('#cmpApply2stInterviewInfo').attr("disabled", true);
		
		// 합격(A03)/ 불합격(A04) / 최종합격(A07) 상태에는 '최종결과 일자' 사용 가능 처리 
		if ( ("A03" == apply2stKindCode) || ("A04" == apply2stKindCode) || ("A07" == apply2stKindCode) ){
			$('#cmpApply2stResultDttm').attr("disabled", false);
		} else{
			$('#cmpApply2stResultDttm').attr("disabled", true);
		}
	}
	
	/**
	 * 서류전형 코드 선택 후 처리 기능
	 */
	$('select[name=cmpApplyDocKindCode]').change(function(e){

		var kindCode = $(this).val();
		
		// 대기중(A00) / 합격(A03)/ 불합격(A04)/ 미연락(A05) / 최종합격(A07) 상태는 disabled 처리
		if ( ("A00" == kindCode) || ("A03" == kindCode) || ("A04" == kindCode) || ("A05" == kindCode) || ("A07" == kindCode) ){
			$('#cmpApplyDocInterviewDttm').attr("disabled", true);
			$('#cmpApplyDocInterviewTime').attr("disabled", true);
			$('#cmpApplyDocInterviewInfo').attr("disabled", true);
			
			if ( ("A03" == kindCode) || ("A04" == kindCode) || ("A07" == kindCode) ){
				$('#cmpApplyDocResultDttm').attr("disabled", false);
			} else{
				$('#cmpApplyDocResultDttm').attr("disabled", true);
			}
			
		 } else {
			 $('#cmpApplyDocInterviewDttm').attr("disabled", false);
			 $('#cmpApplyDocInterviewTime').attr("disabled", false);
			 $('#cmpApplyDocInterviewInfo').attr("disabled", false);
			 $('#cmpApply1stFinalResultDttm').attr("disabled", true);
		 }
			 
	});
	
	/**
	 * 1차 면접 코드 선택 후 처리 기능
	 */
	$('select[name=cmpApply1stKindCode]').change(function(e){
		
		var kindCode = $(this).val();

		// 대기중(A00) / 합격(A03)/ 불합격(A04)/ 미연락(A05) / 최종합격(A07) 상태는 disabled 처리
		if ( ("A00" == kindCode) || ("A03" == kindCode) || ("A04" == kindCode) || ("A05" == kindCode) || ("A07" == kindCode) || ("A09" == kindCode)){
			$('#cmpApply1stInterviewDttm').attr("disabled", true);
			$('#cmpApply1stInterviewTime').attr("disabled", true);
			$('#cmpApply1stInterviewInfo').attr("disabled", true);
			
			if ( ("A03" == kindCode) || ("A04" == kindCode) || ("A07" == kindCode) ){
				$('#cmpApply1stResultDttm').attr("disabled", false);
			}else {
				$('#cmpApply1stResultDttm').attr("disabled", true);
			}
			
		 } else {
			$('#cmpApply1stInterviewDttm').attr("disabled", false);
			$('#cmpApply1stInterviewTime').attr("disabled", false);
			$('#cmpApply1stInterviewInfo').attr("disabled", false);
			$('#cmpApply1stFinalResultDttm').attr("disabled", true);
		 }
		 
	});
	
	/**
	 * 2차 면접 코드 선택 후 처리 기능
	 */
	$('select[name=cmpApply2stKindCode]').change(function(e){
		
		var kindCode = $(this).val();
		
		// 대기중(A00) / 합격(A03)/ 불합격(A04)/ 미연락(A05) / 최종합격(A07) 상태는 disabled 처리
		if ( ("A00" == kindCode) || ("A03" == kindCode) || ("A04" == kindCode) || ("A05" == kindCode) || ("A07" == kindCode) || ("A09" == kindCode)){
			$('#cmpApply2stInterviewDttm').attr("disabled", true);
			$('#cmpApply2stInterviewTime').attr("disabled", true);
			$('#cmpApply2stInterviewInfo').attr("disabled", true);
			
			if ( ("A03" == kindCode) || ("A04" == kindCode) || ("A07" == kindCode) ){
				$('#cmpApply2stResultDttm').attr("disabled", false);
			}else {
				$('#cmpApply2stResultDttm').attr("disabled", true);
			}
		 } else {
			$('#cmpApply2stInterviewDttm').attr("disabled", false);
			$('#cmpApply2stInterviewTime').attr("disabled", false);
			$('#cmpApply2stInterviewInfo').attr("disabled", false);
			$('#cmpApply2stFinalResultDttm').attr("disabled", true);
		 }
	});
	
	
	/**
	 * '취소' 버튼 
	 */
	$('#cmpApplyInfoCancleBtn').click(function(e){
		$(this).parents('a').attr('href', '/cmp/applyInfo/cmpApplyInfoList');
	});
	
	
	
	/**
	 * '수정' 버튼 처리 Fucntion
	 */
	$('#cmpApplyInfoUpdateBtn').click(function(e){
		
		var result = confirm("면접정보를 수정하시겠습니까?");
		var applyDocKindCode = $('#cmpApplyDocKindCode').val();
		var apply1stKindCode = $('#cmpApply1stKindCode').val();
		var apply2stKindCode = $('#cmpApply2stKindCode').val();
		
		
		if(result){
			var applyDocResultDttm = $('#cmpApplyDocResultDttm');
			var apply1stResultDttm = $('#cmpApply1stResultDttm');
			var apply2stResultDttm = $('#cmpApply2stResultDttm');
			/*
			 * 유효성 검증 
			 */
			// 서류검토 진행중(A01) / 코딩테스트 진행중(A06)
			if ( ("A01" == applyDocKindCode) || ("A06" == applyDocKindCode) ){
				
				var applyDocDttm = $('#cmpApplyDocInterviewDttm');
				var applyDocTime = $('#cmpApplyDocInterviewTime');
				var applyDocInfo = $('#cmpApplyDocInterviewInfo');
				
				if( "" == $.trim(applyDocDttm.val())){
					applyDocDttm.focus();
					alert("서류전형 일자를 입력하십시오.");
					return;
				}
				if( "" == $.trim(applyDocTime.val())){
					applyDocTime.focus();
					alert("서류전형 시간을 입력하십시오.");
					return;
				}
				if( "" == $.trim(applyDocInfo.val())){
					applyDocInfo.focus();
					alert("서류전형 정보를 입력하십시오.");
					return;
				}
			
				
			// 합격(A03)/ 불합격(A04) / 최종합격(A07) 상태에는 '최종결과 일자' 사용 가능 처리 
			} else if( ("A03" == applyDocKindCode) || ("A04" == applyDocKindCode) || ("A07" == applyDocKindCode) ){
				if( "" == $.trim(applyDocResultDttm.val())){
					applyDocResultDttm.focus();
					alert("최종일자 일자를 입력하십시오.");
					return;
				}
			}
			
			// 면접 진행중(A02) / 코딩테스트 진행중(A06) / 면접검토 진행중(A08)
			if ( ("A02" == apply1stKindCode) || ("A06" == apply1stKindCode) || ("A08" == apply1stKindCode) ){
				
				var apply1stDttm = $('#cmpApply1stInterviewDttm');
				var apply1stTime = $('#cmpApply1stInterviewTime');
				var apply1stInfo = $('#cmpApply1stInterviewInfo');
				
				if( "" == $.trim(apply1stDttm.val()) ){
					apply1stDttm.focus();
					alert("1차 면접 일자를 입력하십시오.");
					return;
				}
				if( "" == $.trim(apply1stTime.val()) ){
					apply1stTime.focus();
					alert("1차 면접 시간을 입력하십시오.");
					return;
				}
				if( "" == $.trim(apply1stInfo.val()) ){
					apply1stInfo.focus(); 
					alert("1차 면접 정보를 입력하십시오.");
					return;
				}
			
			// 합격(A03)/ 불합격(A04) / 최종합격(A07) 상태에는 '최종결과 일자' 사용 가능 처리 
			} else if( ("A03" == apply1stKindCode) || ("A04" == apply1stKindCode) || ("A07" == apply1stKindCode) ){
				if( "" == $.trim(apply1stResultDttm.val())){
					apply1stResultDttm.focus();
					alert("최종일자 일자를 입력하십시오.");
					return;
				}
			}
			
			// 면접 진행중(A02) / 코딩테스트 진행중(A06) / 면접검토 진행중(A08)
			if ( ("A02" == apply2stKindCode) || ("A06" == apply2stKindCode) || ("A08" == apply2stKindCode) ){
				
				var apply2stDttm = $('#cmpApply2stInterviewDttm');
				var apply2stTime = $('#cmpApply2stInterviewTime');
				var apply2stInfo = $('#cmpApply2stInterviewInfo');
				
				if( "" == $.trim(apply2stDttm.val())){
					apply2stDttm.focus();
					alert("최종 면접 일자를 입력하십시오.");
					return;
				}
				if( "" == $.trim(apply2stTime.val())){
					apply2stTime.focus();
					alert("최종 면접 시간을 입력하십시오.");
					return;
				}
				if( "" == $.trim(apply2stInfo.val())){
					apply2stInfo.focus();
					alert("최종 면접 정보를 입력하십시오.");
					return;
				}
			
				// 합격(A03)/ 불합격(A04) / 최종합격(A07) 상태에는 '최종결과 일자' 사용 가능 처리 
			} else if( ("A03" == apply2stKindCode) || ("A04" == apply2stKindCode) || ("A07" == apply2stKindCode) ){
				if( "" == $.trim(apply2stResultDttm.val())){
					apply2stResultDttm.focus();
					alert("최종일자 일자를 입력하십시오.");
					return;
				}
			}
			
			e.preventDefault();
			$('#cmpApplyInfoUpdateForm').attr('action', '/cmp/applyInfo/cmpApplyInfoUpdate');
			$('#cmpApplyInfoUpdateForm').attr('method', 'POST');
			$('#cmpApplyInfoUpdateForm').attr('target', '_self')
			$('#cmpApplyInfoUpdateForm').submit();
			alert('면접정보가 수정 되었습니다.')
		}
	});
	
	
});