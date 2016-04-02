package org.zaytsev.control.controllers;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zaytsev.control.helpers.PasswordHelper;
import org.zaytsev.control.models.Role;
import org.zaytsev.control.models.User;
import org.zaytsev.control.models.VerificationToken;
import org.zaytsev.control.services.MailService;
import org.zaytsev.control.services.RegistrationService;
import org.zaytsev.control.services.RoleService;


@Controller
public class RegistrationController {
	
	@Autowired
	@Qualifier("registrationtService")
	private RegistrationService registrationtService;
	
	@Autowired
	@Qualifier("mailService")
	private MailService mailService;
	
	@Autowired
	@Qualifier("roleService")
	private RoleService roleService;

	public RegistrationController(){
		
	}
	
	
	@RequestMapping(value="/registration")
	public ModelAndView registration(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("registration");
		return modelAndView;
	}
	
	@RequestMapping(value="/registration-confim", method=RequestMethod.POST)
	public String registrationConfim(RedirectAttributes redirectAttributes, @RequestParam String name, String lfName, String password){
		Role role = roleService.getUserRole();
		Set<Role> roles = new HashSet<Role>();
		roles.add(role);
		
		
		User user = new User();
		user.setActivated(false);
		user.setUsername(name);
		user.setlfName(lfName);
		user.setPassword(PasswordHelper.hash(password));
		user.setRoles(roles);
		try{
			registrationtService.saveUser(user);
			String token = UUID.randomUUID().toString();
			VerificationToken verificationToken = new VerificationToken(token, user);
			registrationtService.saveToken(verificationToken);
			mailService.sendMail(name, "Control-Request", "Click the link below." + "\n" +
					"http://cr-zaytsev.rhcloud.com/control-request/"+"verification/" + token);
			
		}catch(Exception e){
			registrationtService.deleteUser(user);
		}
		
		redirectAttributes.addFlashAttribute("confim", "Confirmation sent to your email!");
		return "redirect:/login";
	}
	
	@RequestMapping(value="/verification/{token}", method=RequestMethod.GET)
	public ModelAndView activation(@PathVariable String token){
		registrationtService.activationUser(token);
		ModelAndView model = new ModelAndView("confim");
		return model;
	}
	
	

}
