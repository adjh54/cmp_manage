/**
 * 회사_정보 게시글 등록 페이지  
 * 작성 JQuery 문
 */

$(function(){

	/*
	 * '취소' 버튼 처리 함수
	 * SELECT
	 */
	$('#cmpInfoCancleBtn').click(function(){
		$(this).parents('a').attr('href', '/cmp/offerInfo/cmpOfferInfoList');
	})
	
	/*
	 * '등록' 버튼 처리 함수
	 * INSERT
	 */
	$('#cmpInfoOfferInsertBtn').on('click', function(e){
		var result = confirm("회사정보를 등록하시겠습니까?");
		
		if(result){
			
			var cmpTitle = $('#cmpTitle');
			var cmpRecuritKind = $('#cmpRecuritKind');
			var regDttmTodayYn = $('input[name=regDttmTodayYn]');
			var cmpBlockYn = $('input[name=cmpBlockYn]:checked')
			var cmpFoundedYear = $('#cmpFoundedYear');
			var cmpEmpCnt = $('#cmpEmpCnt');
			var cmpTouch = $('#cmpTouch');
			var cmpKind = $('#cmpKind');
			var cmpProgrammerKind = $('#cmpProgrammerKind');
			var cmpIncedenceRate = $('#cmpIncedenceRate');
			var cmpResignationRate = $('#cmpResignationRate');
			var numberRegexp = /^[0-9]*$/;
			
			if( "" == $.trim(cmpTitle.val())){
				validation = false;
				cmpTitle.focus();
				alert("회사명을 입력하십시오.");
				return;
			}
			else if("" == $.trim(cmpRecuritKind.val())){
				validation = false;
				cmpRecuritKind.focus();
				alert("공고유형을 선택하십시오.");
				return;
			}
			
			if ("N" == cmpBlockYn.val()){
				
				if("" == $.trim(cmpFoundedYear.val())){
					validation = false;
					cmpFoundedYear.focus();
					alert("회사 설립년도를 입력하시오");
					
					if(numberRegexp.test($.trim(cmpFoundedYear.val()))){
						alert("숫자만 입력하시오");
						cmpFoundedYear.val(0);
						return;
					}
				}
				else if("" == $.trim(cmpEmpCnt.val())){
					validation = false;
					cmpEmpCnt.focus();
					alert("회사 직원수를 입력하시오");
					
					if(numberRegexp.test($.trim(cmpEmpCnt.val()))){
						alert("숫자만 입력하시오");
						cmpEmpCnt.val(0);
						return;
					}
				}
				else if("" == $.trim(cmpTouch.val())){
					validation = false;
					cmpTouch.focus();
					alert("회사 매출액을 입력하시오");
					
					if(numberRegexp.test($.trim(cmpTouch.val()))){
						alert("숫자만 입력하시오");
						cmpTouch.val(0);
						return;
					}
				}
				else if("" == $.trim(cmpKind.val())){
					validation = false;
					cmpKind.focus()
					alert("회사 종류를 선택하시오");
					return;
				}
				else if("" == $.trim(cmpIncedenceRate.val())){
					validation = false;
					cmpIncedenceRate.focus();
					alert("입사율을 입력 하시오");
					
					if(numberRegexp.test($.trim(cmpIncedenceRate.val()))){
						alert("숫자만 입력하시오");
						cmpIncedenceRate.val(0);
						return;
					}
				}
				else if("" == $.trim(cmpResignationRate.val())){
					validation = false;
					cmpResignationRate.focus();
					alert("퇴사율을 입력 하시오");
					
					if(numberRegexp.test($.trim(cmpResignationRate.val()))){
						alert("숫자만 입력하시오");
						cmpResignationRate.val(0);
						return;
					}
				}
			}
			e.preventDefault();
			
			console.log('formData=============================================');
			console.log($('#insertForm').serialize());
			console.log('formData=============================================');
			e.preventDefault(); // 내장된 이벤트를 차단하는 명령
			$('#insertForm').attr('action', '/cmp/offerInfo/cmpOfferInfoInsert');
			$('#insertForm').attr('method', 'POST');
			$('#insertForm').attr('target', '_self')
			$('#insertForm').submit();
		}
	});
	
	/*
	 *  블록기업이 아닐 경우 input 활성화 기능
	 */
	$('#cmpBlockYes').click(function(e){
		
		$('#cmpFoundedYear').attr("disabled", false);
		$('#cmpEmpCnt').attr("disabled", false);
		$('#cmpTouch').attr("disabled", false);
		$('#cmpKind').attr("disabled", false);
		$('#cmpLocation').attr("disabled", false);
		$('#cmpIncedenceRate').attr("disabled", false);
		$('#cmpResignationRate').attr("disabled", false);
		
	});
	
	/*
	 *  블록기업이 아닐 경우 input 비 활성화 기능
	 */
	$('#cmpBlockYNo').click(function(e){
		
		$('#cmpFoundedYear').attr("disabled", true);
		$('#cmpEmpCnt').attr("disabled", true);
		$('#cmpTouch').attr("disabled", true);
		$('#cmpKind').attr("disabled", true);
		$('#cmpLocation').attr("disabled", true);
		$('#cmpIncedenceRate').attr("disabled", true);
		$('#cmpResignationRate').attr("disabled", true);
		
	});
	
	/*
	 * 등록일자 다른날짜 선택 
	 */
	$('#regDttmOtherDay').click(function(e){
		
		$('#regDttm').attr("disabled", false);
	});
	
	/*
	 * 등록일자 오늘 선택
	 */
	$('#regDttmToday').click(function(e){
		
		$('#regDttm').attr("disabled", true);

	});
	
	
	
});