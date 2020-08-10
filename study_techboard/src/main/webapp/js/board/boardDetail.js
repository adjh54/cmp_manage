/**
 * boardDetail에서 처리하는 jQuery
 */
$(function(){
	
	/**
	 * '취소' 버튼
	 */
	$('#boardCancleBtn').on('click', function(e){
		$(this).parents('a').attr('href', '/board/boardList');
	})
	
	/**
	 * '수정' 버튼
	 */
	
	$('#boardModifyBtn').on('click', function(e){
		
		console.log('formData=============================================');
		console.log($('#modifyForm').serialize());
		console.log('formData=============================================');
		e.preventDefault(); // 내장된 이벤트를 차단하는 명령
		$('#modifyForm').attr('action', '/board/boardModify');
		$('#modifyForm').attr('method', 'POST');
		$('#modifyForm').attr('target', '_self')
		$('#modifyForm').submit();
	
	});
	
	/**
	 * '게시글 삭제' 버튼
	 */
	$('#boardDeleteBtn').on('click', function(e){
		
		var result = confirm("게시글을 삭제하시겠습니까?");
		
		if(result){
			console.log('formData=============================================');
			console.log($('#modifyForm').serialize());
			console.log('formData=============================================');
			e.preventDefault(); // 내장된 이벤트를 차단하는 명령
			$('#modifyForm').attr('action', '/board/boardDelete');
			$('#modifyForm').attr('method', 'POST');
			$('#modifyForm').attr('target', '_self')
			$('#modifyForm').submit();
			alert('게시글이 삭제 되었습니다.')
		} 
	})
	
})