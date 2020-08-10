package com.techboard.service.impl.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.techboard.dao.study.StudyMapper;
import com.techboard.service.itfc.study.StudyService;
import com.techboard.vo.board.BoardVO;

@Repository
public class StudyServiceImpl implements StudyService {

	@Autowired
	StudyMapper studyMapper;

	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVo) throws Exception {
		return studyMapper.selectBoardList(boardVo);
	}
}