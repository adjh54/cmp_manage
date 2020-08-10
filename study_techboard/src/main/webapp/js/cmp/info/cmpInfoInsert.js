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
		$(this).parents('a').attr('href', '/cmp/info/cmpInfoList');
	})
	
	/*
	 * '등록' 버튼 처리 함수
	 * INSERT
	 */
	$('#cmpInfoInsertBtn').on('click', function(e){
		
		var result = confirm("회사정보를 등록하시겠습니까?");
		
		if(result){
			
			var validation = true;
			var cmpTitle = $('#cmpTitle');
			var cmpRecuritKind = $('#cmpRecuritKind');
			var cmpJobPosition = $('#cmpJobPosition');
			var cmpJobResponse = $('#cmpJobResponse');
			var cmpJobQualification = $('#cmpJobQualification');
			var cmpRecuritProcess = $('#cmpRecuritProcess');
			var cmpDeadlineDttm = $('#cmpDeadlineDttm');
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
			else if("" == $.trim(cmpJobPosition.val())){
				validation = false;
				cmpJobPosition.focus();
				alert("공고제목을 입력하십시오.");
				return;
			}
			else if("" == $.trim(cmpJobResponse.val())){
				validation = false;
				cmpJobResponse.focus();
				alert("회사주요 업무를 입력하십시오.");
				return;
			}
			else if("" == $.trim(cmpJobQualification.val())){
				validation = false;
				cmpJobQualification.focus();
				alert("회사 자격조건을 입력하십시오.");
				return;
			}
			else if("" == $.trim(cmpRecuritProcess.val())){
				validation = false;
				cmpRecuritProcess.focus();
				alert("회사 채용절차를 입력하십시오.");
				return;
			}
			else if("" == $.trim(cmpDeadlineDttm.val())){
				validation = false;
				cmpDeadlineDttm.focus();
				alert("회사 공고 마감일자를 입력하십시오.");
				return;
			}
			else if("" == $.trim(cmpFoundedYear.val())){
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
			else if("" == $.trim(cmpProgrammerKind.val())){
				validation = false;
				cmpProgrammerKind.focus();
				alert("프로그래머 종류를 선택하시오");
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
			
			e.preventDefault();
			
			console.log('formData=============================================');
			console.log($('#insertForm').serialize());
			console.log('formData=============================================');
			e.preventDefault(); // 내장된 이벤트를 차단하는 명령
			$('#insertForm').attr('action', '/cmp/info/cmpInfoInsert');
			$('#insertForm').attr('method', 'POST');
			$('#insertForm').attr('target', '_self')
			$('#insertForm').submit();	
		}
	});
});