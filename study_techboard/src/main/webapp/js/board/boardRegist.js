/**
 * 게시글 작성  
 */


$(function(){

	
	/**
	 * '등록' 버튼
	 */
	$('#boardRegistBtn').on('click', function(e){
		console.log('formData=============================================');
		console.log($('#registForm').serialize());
		console.log('formData=============================================');
		e.preventDefault(); // 내장된 이벤트를 차단하는 명령
		$('#registForm').attr('action', '/board/boardRegist');
		$('#registForm').attr('method', 'POST');
		$('#registForm').attr('target', '_self')
		$('#registForm').submit();
	});
	
	
	/**
	 * '취소' 버튼
	 */
	$('#boardCancleBtn').click(function(){
		$(this).parents('a').attr('href', '/board/boardList');
	})
	
	

});
