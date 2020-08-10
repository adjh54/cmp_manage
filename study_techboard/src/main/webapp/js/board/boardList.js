/**
 * boardList 처리에 필요한 jQuery 처리 방식
 */
$(function(){
	
	/*
	 * 게시글 검색 기능
	 */
	$('#searchBtn').on('click', function(e){

		e.preventDefault(); // 내장된 이벤트를 차단하는 명령
		$('#searchForm').attr('action', '/board/boardList');
		$('#searchForm').attr('method', 'POST');
		$('#searchForm').attr('target', '_self')
		$('#searchForm').submit();
		
	});
	
	
	/*
	 * 게시판 글 등록 페이지 이동
	 */
    $('#boardRegistBtn').on('click', function(e){
    	
    	$(this).parents('a').attr('href', '/board/boardRegistItem');
	
    });
    
	/*
	 * 게시판 글 상세 페이지 이동
	 * POST 방식을 사용하기 위해서 동적 form 방식 이용
	 * ==> 해당 기술이 표준인지 아닌지는 모르겠음.. 다른 방식도 있을텐데...
	 */
	$('table tr td a').on('click', function(e){
	
		e.preventDefault();

		var boardId = $(this).data('id')
		
		var formTag = '<form id="boardDetailForm"></form>'
		var inputTag = '<input type ="hidden" name="boardId" value=' + boardId + '>';
		
		$('body').append(formTag);
		$('#boardDetailForm').append(inputTag);

		$('#boardDetailForm').attr('action', '/board/boardDetail');
		$('#boardDetailForm').attr('method', 'POST');
		$('#boardDetailForm').attr('target', '_self')
		$('#boardDetailForm').submit();
		
	});
    
//    /**
//     * 실시간 조회수 업데이트 Function
//     */
//    function updateBoardItemCnt(boardId){
//    	
//    	$.ajax({
//			   type : 'post'
//			 , async : true
//			 , url : '/board/updateBoardItemCnt'
//			 , dataType : 'json'
//			 , data :	{'boardId': boardId}
//			 , success : function(data) {
//			 }
//			 , error : function(data) {
//			 }
//    	});
//    }
//    
});

/**
 * 페이징 처리 
 * @param curPage
 * @returns
 */
function fn_paging(curPage){
	location.href = "/board/boardList?curPage=" + curPage;
}



