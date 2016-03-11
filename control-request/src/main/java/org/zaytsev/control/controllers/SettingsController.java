package org.zaytsev.control.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SettingsController {
	
	@RequestMapping(value="/settings", method=RequestMethod.GET)
	public ModelAndView settings(){
		System.err.println("Login");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("list");
		return modelAndView;
	}

}
