/**
 * 계산기 기능
 * 
 * 
 * [추가해야할 기능]
 * 1. 기호를 여러번 눌렀을때 중복 방지 체크하기 
 * 
 */
$(function(){

	$("#calcuText").focus();

	let selectValArray = [];
	
	/**
	 * 초기화 버튼
	 */
	$("#resetBtn").click(function(){
		
		$("#calcuText").val("");
		$("#preCalcuText").val("");
		selectValArray = [];
	
	});
	
	/**
	 * 단어 지우기 기능
	 */
	$("#backSpace").click(function(){

		if($("#calcuText").val().trim() != ''){
			$("#preCalcuText").val($("#preCalcuText").val().substring(0, $("#preCalcuText").val().length-1));
		}
		
		$("#calcuText").val($("#calcuText").val().substring(0, $("#calcuText").val().length-1));
	});
	
	
	/**
	 * 숫자 입력 기능
	 */
	$(".numberBtn").click(function(){
	
		const selectVal = $(this).val();			// !== 선택된 숫자 ==!
		const calcuText = $("#calcuText").val();	// !== 입력창 값 ==!
		const preCalcuText = $("#preCalcuText").val();
		
		// !== 입력 텍스트 값이 존재하지 않을 경우 ==!
		if(preCalcuText == ""){
			$("#calcuText").val(parseInt(selectVal));
			$("#preCalcuText").val(parseInt(selectVal));
		// !== 입력 텍스트 값이 존재할 경우 ==!
		} else {
			$("#calcuText").val(calcuText + parseInt(selectVal));
			$("#preCalcuText").val(preCalcuText + parseInt(selectVal));
		}
		
	});
	
	
	/**
	 * 기호 계산 기능
	 */
	$('.signBtn').click(function(e){
		
		const selectVal = $(this).val();			// !== 선택된 기호 ==!
		const calcuText = $("#calcuText").val();	// !== 입력창 값 ==!
		const preCalcuText = $("#preCalcuText").val();
		
		selectValArray.push($("#calcuText").val());
		$("#calcuText").val("");
		$("#preCalcuText").val(preCalcuText + selectVal);
		
		selectValArray.push(selectVal);
	});
	
	/**
	 * 계산 기능
	 */
	$("#resultBtn").click(function(){

		selectValArray.push($("#calcuText").val());
		let resultVal = "";
		let aCource = "";
		let bCource = "";
		let cCource = "";
		let dCource = "";
		
		for(let i = 0; i < selectValArray.length ; i++){
			
			if(i <= 3){
				aCource = eval(selectValArray[0] + selectValArray[1] + selectValArray[2]);
				resultVal = aCource;
			}
			
			else if(i <= 5) {
				bCource = aCource + eval(selectValArray[3] + selectValArray[4]);
				resultVal = bCource;
			}
			
			else if(i <= 7){
				cCource = bCource + eval(selectValArray[5] + selectValArray[6]);
				resultVal = cCource;
			}
			
			else if(i <= 9){
				dCource = cCource + eval(selectValArray[7] + selectValArray[8]);
				resultVal = dCource
			}
		}
		
		$("#calcuText").val(resultVal);
		
	});
		
});