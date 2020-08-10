package com.techboard.controller.study;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.techboard.service.itfc.study.StudyService;

import lombok.extern.log4j.Log4j2;

/**
 * 강민우 과제 관련 테스트 Controller
 * @author JONGHOON
 *
 */
@Controller("StudyController")
@RequestMapping(value = "/study")
public class StudyController {
	private static Logger LOGGER = LoggerFactory.getLogger(Log4j2.class);

	@Autowired
	private StudyService service;

	/**
	 * 1일차 - HTML 공부
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/html")
	public ModelAndView studyHtml(Model model) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("1일차 HTML 공부 시작!!");

		mv.setViewName("study/study_html");
		return mv;
	}

	/**
	 * 2일차 - Javascript 공부
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/javascript")
	public ModelAndView studyJavascript(Model model) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("2일차 HTML 공부 시작!!");

		mv.setViewName("study/study_javascript");
		return mv;
	}

	/**
	 * 3일차 - JQuery 공부
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/jquery")
	public ModelAndView studyJquery(Model model) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("3일차 JQuery 공부 시작!!");

		mv.setViewName("study/study_jquery");
		return mv;
	}

	/**
	 * 4일차 - JAVA 공부
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/java")
	public ModelAndView studyJava(Model model) {
		ModelAndView mv = new ModelAndView();
		LOGGER.info("3일차 Java 공부 시작!!");

		mv.setViewName("study/study_java");
		return mv;
	}
}