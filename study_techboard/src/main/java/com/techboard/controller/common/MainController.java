package com.techboard.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping("/")
	public ModelAndView Main(Model model) {
		ModelAndView mv = new ModelAndView();
		System.out.println("Main Page Start!!!!");
		mv.setViewName("common/main");
		return mv;
	}
}
