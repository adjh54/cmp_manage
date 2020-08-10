package com.techboard.service.itfc.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.techboard.vo.board.BoardVO;

@Service("boardService")
public interface BoardService {

	public List<BoardVO> selectBoardList(BoardVO boardVo) throws Exception;

	public BoardVO selectBoardListCnt(BoardVO boardVo) throws Exception;

	public int insertBoardItem(BoardVO boardVo) throws Exception;

	public BoardVO selectBoardItemDetail(BoardVO boardVo) throws Exception;
	
	public int updateBoardItemCnt(BoardVO boardVo) throws Exception;
	
	public int updateBoardItem(BoardVO boardVo) throws Exception;

	public int deleteBoardItem(BoardVO boardVo) throws Exception;

}
