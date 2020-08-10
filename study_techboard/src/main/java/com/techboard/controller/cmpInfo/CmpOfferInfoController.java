package com.techboard.controller.cmpInfo;

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

import com.techboard.service.itfc.cmpInfo.CmpOfferInfoService;
import com.techboard.vo.cmpInfo.CmpInfoVO;
import com.techboard.vo.common.Pagination;
/**
 * 이종훈 CmpInfoController
 * 회사 정보 처리 관련 Controller
 * @author JONGHOON
 *
 */
@Controller(value= "cmpOfferInfoController")
@RequestMapping(value = "/cmp/offerInfo")
public class CmpOfferInfoController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(CmpOfferInfoController.class);

	@Autowired
	private CmpOfferInfoService cmpOfferInfoService;

	/**
	 * 회사 정보 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpOfferInfoList")
	public ModelAndView cmpOfferInfoList(CmpInfoVO cmpInfoVo, @RequestParam(defaultValue="1") int curPage) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("Jonghoon cmpOfferInfoList Start>>>>>>>>>>>");
		LOGGER.info("limit/offset"+ cmpInfoVo.getLimit() +"//////"+ cmpInfoVo.getOffset());

			// 검색어 처리 
			if(null != cmpInfoVo.getSearchContent() || !("".equals(cmpInfoVo.getSearchContent())) ) {
				cmpInfoVo = this.checkSearchFnc(cmpInfoVo);		// 검색어 처리 Method
			}
		
		try {
			CmpInfoVO cmpOfferInfoListCnt = cmpOfferInfoService.cmpOfferInfoListCnt(cmpInfoVo);
			mv.addObject("cmpInfoOfferListCnt", cmpOfferInfoListCnt);
			
			int cmpOfferInfoCnt = cmpOfferInfoListCnt.getCmpOfferInfoCnt();
			
			Pagination pagination = new Pagination(cmpOfferInfoCnt, curPage);
	        
	        cmpInfoVo.setStartIndex(pagination.getStartIndex());
	        cmpInfoVo.setCntPerPage(pagination.getPageSize());
			
			List<CmpInfoVO> list = cmpOfferInfoService.cmpOfferInfoList(cmpInfoVo);
			mv.addObject("cmpOfferInfoList", list);
			
			mv.addObject("pagination", pagination);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/offerInfo/cmpOfferInfoList");
		return mv;
	}
	
	/**
	 * 회사정보 상세 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpOfferInfoDetail", method = RequestMethod.POST)
	public ModelAndView cmpOfferInfoDetail(CmpInfoVO cmpInfoVo) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("cmpInfoController >> cmpOfferInfoDetail");
		LOGGER.info("Jonghoon cmpOfferInfoDetail Start>>>>>>>>>>>");
		LOGGER.info("cmpInfoVo>>>>>>>>>>>"+cmpInfoVo);
		try {
			mv.addObject("cmpPageFlag", cmpInfoVo.getCmpPageFlag());		// 화면 뒤로가기 일때 각 상황에 따른 처리를 위해 추가
			CmpInfoVO cmpInfoDetail = cmpOfferInfoService.cmpOfferInfoDetail(cmpInfoVo);
			mv.addObject("cmpInfoDetail", cmpInfoDetail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/offerInfo/cmpOfferInfoDetail");
		return mv;
	}
	
	/**
	 * 게시물 등록 화면
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpOfferInfoInsertPage")
	public ModelAndView cmpOfferInfoInsertPage(Model model) {
		LOGGER.info("Jonghoon cmpOfferInfoInsertPage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("cmp/offerInfo/cmpOfferInfoInsert");
		
		return mv;
	}
	
	/**
	 * 게시물 등록 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpOfferInfoInsert", method = RequestMethod.POST)
	public ModelAndView insertCmpOfferInfo(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> insertCmpOfferInfo");
		ModelAndView mv = new ModelAndView();
		
		try {
			cmpOfferInfoService.insertCmpOfferInfo(cmpInfoVo);
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/cmp/offerInfo/cmpOfferInfoList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 회사 일괄 회신 처리 기능 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpOfferInfoUpdateArrReplyYn", method = RequestMethod.POST)
	public ModelAndView cmpOfferInfoUpdateArrReplyYn(HttpServletRequest req, CmpInfoVO cmpInfoVo) {
		LOGGER.info("CmpInfoController >> cmpOfferInfoUpdateArrReplyYn");
		ModelAndView mv = new ModelAndView();
		
		try {
			cmpOfferInfoService.cmpOfferInfoUpdateArrReplyYn(cmpInfoVo);
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.setViewName("redirect:/cmp/offerInfo/cmpOfferInfoList");		// 게시판 메인 페이지로 이동
		return mv;
	}
	
	/**
	 * 검색어 처리 Method
	 * 차후 공용 Method로 변경 예정
	 * @param boardVo
	 * @return
	 */
	public CmpInfoVO checkSearchFnc(CmpInfoVO cmpInfoVo) {
		
		String keyword = cmpInfoVo.getSearchKeyword();		// Keyword
		String content = cmpInfoVo.getSearchContent();		// 내용
		
		switch (keyword) {
		
		// 회사명
		case "cmpTitle":
			cmpInfoVo.setCmpTitle(content);
			break;
		
		// 회사 위치
		case "cmpLocation":
			cmpInfoVo.setCmpLocation(content);
			break;
		
		// 공고 유형
		case "cmpRecuritKind":
			cmpInfoVo.setCmpRecuritKind(content);
			break;	
			
			// 공고 유형
		case "cmpApplyYn":
			cmpInfoVo.setCmpApplyYn(content);
			break;	
			
		// 등록 시작일 or 종료일
		case "regDttm":
			String content2 = cmpInfoVo.getSearchContent2();
			cmpInfoVo.setRegDttm(content);
			cmpInfoVo.setRegDttmEnd(content2);
			break;	
			
		default:
			LOGGER.info("Swtich Error");
		}
		
		return cmpInfoVo;
	}
}