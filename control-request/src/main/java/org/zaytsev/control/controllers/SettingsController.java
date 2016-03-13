package org.zaytsev.control.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.zaytsev.control.models.Departaments;
import org.zaytsev.control.models.User;
import org.zaytsev.control.services.SettingsService;


@Controller
public class SettingsController {
	@Autowired
	@Qualifier(value="settingsService")
	SettingsService settingsService;
	
	@RequestMapping(value="/settings", method=RequestMethod.GET)
	public ModelAndView settings(){
		List<Departaments> departaments = settingsService.getAll();
		ModelAndView modelAndView = new ModelAndView();
		User user= (User) org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
		String lfName = user.getlfName();
		modelAndView.addObject("name", lfName);
		modelAndView.addObject("departaments", departaments);
		modelAndView.setViewName("settings");
		
		return modelAndView;
	}

}
