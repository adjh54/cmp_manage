package com.techboard.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.techboard.vo.board.BoardVO;

@Mapper
public interface BoardMapper {

	public List<BoardVO> selectBoardList(BoardVO boardVo) throws Exception;

	public BoardVO selectBoardListCnt(BoardVO boardVo) throws Exception;

	public int insertBoardItem(BoardVO boardVo) throws Exception;

	public BoardVO selectBoardItemDetail(BoardVO boardVo) throws Exception;

	public int updateBoardItemCnt(BoardVO boardVo) throws Exception;
	
	public int updateBoardItem(BoardVO boardVo) throws Exception;
	
	public int deleteBoardItem(BoardVO boardVo) throws Exception;
}