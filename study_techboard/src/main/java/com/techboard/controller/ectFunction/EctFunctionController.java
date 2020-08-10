package com.techboard.controller.ectFunction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * 기타 기능과 관련된 EctFunctionController
 * @author JONGHOON
 *
 */
@Controller(value= "ectFunctionController")
@RequestMapping(value = "/ectFunction")
public class EctFunctionController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(EctFunctionController.class);

		@Autowired
//		private BoardService service;
		
		/**
		 * 계산기 화면
		 * 
		 * @param model
		 * @return
		 */
		@RequestMapping(value = "/calculator")
		public ModelAndView calculator() {
			LOGGER.info("ectFuncCalculator page Start>>>>>>>>>>>");
			
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("ectFunction/calculatorList");
			
			return mv;
		}
		
		/**
		 * 주소 목록 화면
		 * 
		 * @param model
		 * @return
		 */
		@RequestMapping(value = "/addressList")
		public ModelAndView addressList() {
			LOGGER.info("addressList page Start>>>>>>>>>>>");
			
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("ectFunction/addressList");
			
			return mv;
		}
		
		/**
		 * 주소 목록 화면
		 * 
		 * @param model
		 * @return
		 */
		@RequestMapping(value = "/jusoPopup")
		public ModelAndView jusoPopup() {
			LOGGER.info("jusoPopup page Start>>>>>>>>>>>");
			
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("ectFunction/jusoPopup");
			
			return mv;
		}
		/**
		 * 맵 연동 화면
		 * 
		 * @param model
		 * @return
		 */
		@RequestMapping(value = "/mapList")
		public ModelAndView mapList() {
			LOGGER.info("mapList page Start>>>>>>>>>>>");
			
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("ectFunction/mapList");
			
			return mv;
		}
}
