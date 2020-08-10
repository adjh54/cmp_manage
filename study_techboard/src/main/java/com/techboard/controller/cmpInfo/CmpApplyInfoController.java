package com.techboard.controller.cmpInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techboard.service.itfc.cmpInfo.CmpApplyInfoService;
import com.techboard.vo.cmpInfo.CmpApplyInfoVO;
import com.techboard.vo.common.Pagination;
/**
 * 이종훈 CmpInfoController
 * 회사 정보 처리 관련 Controller
 * @author JONGHOON
 *
 */
@Controller(value= "cmpApplyInfoController")
@RequestMapping(value = "/cmp/applyInfo")
public class CmpApplyInfoController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(CmpApplyInfoController.class);

	@Autowired
	private CmpApplyInfoService service;

	/**
	 * 회사 정보 조회
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpApplyInfoList")
	public ModelAndView cmpApplyInfoList(CmpApplyInfoVO cmpApplyInfoVo, @RequestParam(defaultValue="1") int curPage) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("Jonghoon cmpApplyInfoList Start>>>>>>>>>>>");
		LOGGER.info("limit/offset"+ cmpApplyInfoVo.getLimit() +"//////"+ cmpApplyInfoVo.getOffset());
		
		try {
			CmpApplyInfoVO cmpApplyInfoListCnt = service.cmpApplyInfoListCnt(cmpApplyInfoVo);
			mv.addObject("listCnt", cmpApplyInfoListCnt);
			
			int cmpApllyInfoCnt = cmpApplyInfoListCnt.getCmpApplyInfoCnt();
			
			Pagination pagination = new Pagination(cmpApllyInfoCnt, curPage);
	        
			cmpApplyInfoVo.setStartIndex(pagination.getStartIndex());
			cmpApplyInfoVo.setCntPerPage(pagination.getPageSize());
			
			List<CmpApplyInfoVO> list = service.cmpApplyInfoList(cmpApplyInfoVo);
			mv.addObject("cmpApplyInfoList", list);
			
			mv.addObject("pagination", pagination);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("cmp/applyInfo/cmpApplyInfoList");
		return mv;
	}
	
	/**
	 * 회사 지원정보 상세 페이지 - 정보 등록 페이지 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpApplyInfoUpdatePage")
	public ModelAndView cmpApplyInfoUpdatePage(HttpServletRequest req, CmpApplyInfoVO cmpApplyInfoVo) {
		LOGGER.info("Jonghoon cmpApplyInfoUpdatePage Start>>>>>>>>>>>");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			CmpApplyInfoVO cmpApplyInfoDetail = service.cmpApplyInfoDetail(cmpApplyInfoVo);
			mv.addObject("item", cmpApplyInfoDetail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("cmp/applyInfo/cmpApplyInfoUpdate");
		
		return mv;
	}
	
	/**
	 * [기타] 회사 정보 수정 기능 
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cmpApplyInfoUpdate", method = RequestMethod.POST)
	public ModelAndView cmpApplyInfoUpdate(HttpServletRequest req, CmpApplyInfoVO cmpApplyInfoVo) {
		LOGGER.info("CmpInfoController >> cmpApplyInfoUpdate");
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		try {
			result = service.cmpApplyInfoUpdate(cmpApplyInfoVo);
		} catch (Exception e) {
			LOGGER.info(e.getMessage());
		}
		
		mv.addObject("resultMsg", result);
		mv.setViewName("redirect:/cmp/applyInfo/cmpApplyInfoList");		// 회사 목록 메인 페이지로 이동
		
		return mv;
	}
}