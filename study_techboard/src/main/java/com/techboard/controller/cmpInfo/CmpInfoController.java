package com.techboard.controller.cmpInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techboard.service.itfc.cmpInfo.CmpInfoService;
import com.techboard.vo.board.BoardVO;
import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.cmpInfo.CmpInfoVO;
import com.techboard.vo.common.Pagination;
/**
 * 이종훈 CmpInfoController
 * 회사 정보 처리 관련 Controller
 * @author JONGHOON
 *
 */
@Controller(value= "cmpInfoController")
@RequestMapping(value = "/cmp/info")
public class CmpInfoController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(CmpInfoController.class);

	@Autowired
	private CmpInfoService cmpInfoService;

	/**
	 * 회사 정보 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoList")
	public ModelAndView cmpInfoList(CmpInfoVO cmpInfoVo, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize, 
			@ModelAttribute("searchKeyword") String searchKeyword, 
			@ModelAttribute("searchContent") String searchContent ) {
		
		ModelAndView mv = new ModelAndView();
		LOGGER.info("CmpInfoList Start>>>>>>>>>>>");
		
		// 검색어 처리 
		if(null != searchContent || !("".equals(searchContent)) ) {
			
			cmpInfoVo = this.checkSearchFnc(mv, cmpInfoVo, searchKeyword, searchContent);		// 검색어 처리 Method
			
			// 회사명 || 회사위치 일 경우만 값을 유지
			if ( "cmpTitle".equals(searchKeyword) || "cmpLocation".equals(searchKeyword) ) {
				mv.addObject("searchKeyword", searchKeyword);
			}
		}
		
		try {
			CmpInfoVO cmpInfoListCnt = cmpInfoService.selectCmpInfoListCnt(cmpInfoVo);
			mv.addObject("cmpInfoListCnt", cmpInfoListCnt);
			
			int cmpInfoCnt = cmpInfoListCnt.getCmpInfoCnt();
			
			Pagination pagination = new Pagination(cmpInfoCnt, curPage);
	        
	        cmpInfoVo.setStartIndex(pagination.getStartIndex());
	        cmpInfoVo.setCntPerPage(pageSize);
			
			List<CmpInfoVO> list = cmpInfoService.selectCmpInfoList(cmpInfoVo);
			mv.addObject("cmpInfoList", list);
			
			mv.addObject("pagination", pagination);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/info/cmpInfoList");
		return mv;
	}
	
	/**
	 * 게시물 등록 화면
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoInsertPage")
	public ModelAndView cmpInfoInsertPage(Model model) {
		LOGGER.info("Jonghoon cmpInfoInsertPage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("cmp/info/cmpInfoInsert");
		
		return mv;
	}
	
	/**
	 * 게시물 등록 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoInsert", method = RequestMethod.POST)
	public ModelAndView cmpInfoInsert(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoInsert");
		ModelAndView mv = new ModelAndView();
		
		try {
			cmpInfoService.cmpInfoInsert(cmpInfoVo);
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 회사정보 상세 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoDetail", method = RequestMethod.POST)
	public ModelAndView cmpInfoDetail(CmpInfoVO cmpInfoVo) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("cmpInfoController >> cmpInfoDetail");
		LOGGER.info("Jonghoon cmpInfoDetail Start>>>>>>>>>>>");
		LOGGER.info("cmpInfoVo>>>>>>>>>>>"+cmpInfoVo);
		try {
			mv.addObject("cmpPageFlag", cmpInfoVo.getCmpPageFlag());		// 화면 뒤로가기 일때 각 상황에 따른 처리를 위해 추가
			CmpInfoVO cmpInfoDetail = cmpInfoService.selectCmpInfoDetail(cmpInfoVo);
			mv.addObject("cmpInfoDetail", cmpInfoDetail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/info/cmpInfoDetail");
		return mv;
	}
	
	/**
	 * 회사정보 수정 페이지
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdatePage")
	public ModelAndView cmpInfoUpdatePage(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("Jonghoon cmpInfoUpdatePage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			CmpInfoVO cmpInfoItem = cmpInfoService.selectCmpInfoDetail(cmpInfoVo);
			mv.addObject("cmpInfoItem", cmpInfoItem);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("cmp/info/cmpInfoUpdate");
		
		return mv;
	}
	
	/**
	 * 회사정보 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdate", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdate(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdate");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdate(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 회사정보 삭제
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoDelete", method = RequestMethod.POST)
	public ModelAndView cmpInfoDelete(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("BoardController >> cmpInfoDelete");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		try {
			result = cmpInfoService.cmpInfoDelete(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * 한줄평 입력 기능
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateEtc", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateEtc(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateEtc");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateEtc(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * 회사 지원하기 기능
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateApplyYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateApplyYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateApplyYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateApplyYn(cmpInfoVo);		// 지원 상태 변경
			cmpInfoService.cmpApplyInfoInsert(cmpInfoVo);				// 회사_지원 테이블 데이터 적재
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * '즐겨찾기' 기능 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateFavoritesYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateFavoritesYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateFavoritesYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateFavoritesYn(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		
		return null;
	}
	
	/**
	 * [기타] 회사 정보 수정 기능 - 회사 이메일 회신여부
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateReplyYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateReplyYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateReplyYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateReplyYn(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/info/cmpInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
	
	/**
	 * '즐겨찾기' 기능 수정
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpInfoUpdateGoodYn", method = RequestMethod.POST)
	public ModelAndView cmpInfoUpdateGoodYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpInfoUpdateGoodYn");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = cmpInfoService.cmpInfoUpdateGoodYn(cmpInfoVo);
			
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		
		return null;
	}
	
		
	/**
	 * 검색어 처리 Method
	 * 차후 공용 Method로 변경 예정
	 * @param boardVo
	 * @return
	 */
	public CmpInfoVO checkSearchFnc(ModelAndView mv, CmpInfoVO cmpInfoVo, String keyword, String content) {
		
		switch (keyword) {
		
		// 회사명
		case "cmpTitle":
			cmpInfoVo.setCmpTitle(content);
			mv.addObject("searchContent", content);
			break;
		
		// 회사 위치
		case "cmpLocation":
			cmpInfoVo.setCmpLocation(content);
			mv.addObject("searchContent", content);
			break;
		
		// 공고 유형
		case "cmpRecuritKind":
			cmpInfoVo.setCmpRecuritKind(content);
			break;	
			
		// 지원 여부
		case "cmpApplyYn":
			cmpInfoVo.setCmpApplyYn(content);
			break;	
			
		// 좋아요 여부
		case "cmpGoodYn":
			cmpInfoVo.setCmpGoodYn(content);
			break;
			
		default:
			break;
		}
		
		return cmpInfoVo;
	}
}