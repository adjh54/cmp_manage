package com.techboard.dao.study;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.techboard.vo.board.BoardVO;

@Mapper
public interface StudyMapper {
	
	public List<BoardVO> selectBoardList(BoardVO boardVo) throws Exception;

}