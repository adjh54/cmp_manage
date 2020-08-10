package com.techboard.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techboard.service.itfc.board.BoardService;
import com.techboard.vo.board.BoardVO;
import com.techboard.vo.common.Pagination;

/**
 * 이종훈 BoardController
 * @author JONGHOON
 *
 */
@Controller(value= "boardController")
@RequestMapping(value = "/board")
public class BoardController {
	private static Logger LOGGER = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;

	/**
	 * 게시물 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardList")
	public ModelAndView boardList(BoardVO boardVo, @RequestParam(defaultValue="1") int curPage) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("Jonghoon BoardListPage Start>>>>>>>>>>>");
		LOGGER.info("limit/offset"+ boardVo.getLimit() +"//////"+ boardVo.getOffset());

		// 검색어 처리 
		if(null != boardVo.getSearchContent() || !("".equals(boardVo.getSearchContent())) ) {
			boardVo = this.checkSearchFnc(boardVo);		// 검색어 처리 Method
		}
		try {
			
			BoardVO boardListCnt= service.selectBoardListCnt(boardVo);
			mv.addObject("boardListCnt", boardListCnt);
			
			int boardCnt = boardListCnt.getBoardCnt();
			
			Pagination pagination = new Pagination(boardCnt, curPage);
	        
	        boardVo.setStartIndex(pagination.getStartIndex());
	        boardVo.setCntPerPage(pagination.getPageSize());
			
			List<BoardVO> list = service.selectBoardList(boardVo);
			mv.addObject("boardList", list);
			
			mv.addObject("pagination", pagination);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("board/boardList");
		return mv;
	}
	
	/**
	 * 게시물 등록 화면
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardRegistItem")
	public ModelAndView boarRegistItem(Model model) {
		LOGGER.info("Jonghoon BoardRegistPage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/boardRegist");
		
		return mv;
	}
	
	/**
	 * 게시물 등록 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardRegist", method = RequestMethod.POST)
	public ModelAndView boarRegist(HttpServletRequest req, BoardVO boardVo) {
		LOGGER.info("BoardController >> boardRegist");
		ModelAndView mv = new ModelAndView();
		
		try {
			service.insertBoardItem(boardVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/board/boardList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 게시물 상세 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardDetail", method = RequestMethod.POST)
	public ModelAndView boardDetail(BoardVO boardVo) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("BoardController >> boardDetail");
		LOGGER.info("Jonghoon BoardDetailPage Start>>>>>>>>>>>");

		try {
			
			service.updateBoardItemCnt(boardVo);		// 게시물 조회수 업데이트
			
			BoardVO boardDetailItem = service.selectBoardItemDetail(boardVo);
			mv.addObject("boardDetailItem", boardDetailItem);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("board/boardDetail");
		return mv;
	}
	
	/**
	 * 게시물 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardModify", method = RequestMethod.POST)
	public ModelAndView boardModify(HttpServletRequest req, BoardVO boardVo) {
		LOGGER.info("BoardController >> boardModify");
		ModelAndView mv = new ModelAndView();
		
		try {
			service.updateBoardItem(boardVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/board/boardList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 게시물 삭제
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public ModelAndView boardDelete(HttpServletRequest req, BoardVO boardVo) {
		LOGGER.info("BoardController >> boardDelete");
		ModelAndView mv = new ModelAndView();
		
		try {
			service.deleteBoardItem(boardVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/board/boardList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	
	/**
	 * 검색어 처리 Method
	 * 차후 공용 Method로 변경 예정
	 * @param boardVo
	 * @return
	 */
	public BoardVO checkSearchFnc(BoardVO boardVo) {
		
		String keyword = boardVo.getSearchKeyword();		// Keyword
		String content = boardVo.getSearchContent();		// 내용
		
		switch (keyword) {
		case "boardKindName":
			boardVo.setBoardKindName(content);
			break;

		case "boardTitle":
			boardVo.setBoardTitle(content);
			break;
			
		case "boardCn":
			boardVo.setBoardCn(content);
			
		case "regstId":
			boardVo.setRegstId(content);
		
		default:
			LOGGER.info("Swtich Error");
		}
		
		return boardVo;
	}
}