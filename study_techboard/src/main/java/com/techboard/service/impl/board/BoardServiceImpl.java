package com.techboard.service.impl.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.techboard.dao.board.BoardMapper;
import com.techboard.service.itfc.board.BoardService;
import com.techboard.vo.board.BoardVO;

@Repository
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVo) throws Exception {
		return boardMapper.selectBoardList(boardVo);
	}

	@Override
	public BoardVO selectBoardListCnt(BoardVO boardVo) throws Exception {
		return boardMapper.selectBoardListCnt(boardVo);
	}

	@Override
	public int insertBoardItem(BoardVO boardVo) throws Exception {
		return boardMapper.insertBoardItem(boardVo);
	}

	@Override
	public BoardVO selectBoardItemDetail(BoardVO boardVo) throws Exception {
		return boardMapper.selectBoardItemDetail(boardVo);
	}

	@Override
	public int updateBoardItemCnt(BoardVO boardVo) throws Exception {
		return boardMapper.updateBoardItemCnt(boardVo);
	}

	@Override
	public int updateBoardItem(BoardVO boardVo) throws Exception {
		return boardMapper.updateBoardItem(boardVo);
	}

	@Override
	public int deleteBoardItem(BoardVO boardVo) throws Exception {
		return boardMapper.deleteBoardItem(boardVo);
	}

}