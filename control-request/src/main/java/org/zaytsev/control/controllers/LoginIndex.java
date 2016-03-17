package org.zaytsev.control.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginIndex {
	
	public LoginIndex() {
		
	}
/**
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView index(){
		System.err.println("Login");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("list");
		return modelAndView;
	} */
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
		    public ModelAndView method() {
		            return new ModelAndView("redirect:request/list");
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView indexGet(){
		System.err.println("Login");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	
	@RequestMapping(value = "/access_denied", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView accessDenied(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("access_denied");
		return modelAndView;
		
	}


	
}
