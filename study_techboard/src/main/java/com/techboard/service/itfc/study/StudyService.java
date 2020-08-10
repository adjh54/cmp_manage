package com.techboard.service.itfc.study;

import java.util.List;

import org.springframework.stereotype.Service;

import com.techboard.vo.board.BoardVO;

@Service("studyService")
public interface StudyService {

	public List<BoardVO> selectBoardList(BoardVO boardVo) throws Exception;

}
