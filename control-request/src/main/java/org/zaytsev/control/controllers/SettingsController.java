package org.zaytsev.control.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		User userD = settingsService.getByUser(user.getId());
		modelAndView.addObject("name", lfName);
		modelAndView.addObject("departaments", departaments);
		modelAndView.addObject("id", user.getId());
		modelAndView.addObject("departament", userD.getDepartaments());
		modelAndView.setViewName("settings");
		return modelAndView;
	}
	
	@RequestMapping(value="/settings/change", method=RequestMethod.POST)
	public String changeDep(@RequestParam Long id){
		User user= (User) org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
		
		
		Departaments departaments = settingsService.depGetById(id);
		user.setDepartaments(departaments);
		settingsService.updateUser(user);
		return "redirect:/settings/";
	}
	
	@RequestMapping(value="/settings/add-dep", method=RequestMethod.POST)
	public String addDep(@RequestParam String titleDep){
		Departaments departaments = new Departaments();
		departaments.setTitle(titleDep);
		settingsService.depAdd(departaments);
		return "redirect:/settings/";
	}
	
	@RequestMapping(value="/settings/delete-dep", method=RequestMethod.POST)
	public String deleteDep(@RequestParam Long id){
		Departaments departaments = settingsService.depGetById(id);
		if (departaments.getTitle().equals("None")){
			return "redirect:/settings/";			
		}
		settingsService.updateUserDep(departaments);
		settingsService.depDelete(departaments);
		return "redirect:/settings/";
	}

}
