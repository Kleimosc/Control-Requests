package org.zaytsev.control.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zaytsev.control.models.Request;
import org.zaytsev.control.models.Status;
import org.zaytsev.control.models.User;
import org.zaytsev.control.services.RequestService;

@Controller
@RequestMapping(value="/request")
public class RequestController {
	
	@Autowired
	@Qualifier("requestService")
	private RequestService requestService; 
	
	public RequestController() {
		
	}
	
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView();
		User user= (User) org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
		String lfName = user.getlfName();
		List<Request> requestCreate = requestService.getListCreate();
		List<Request> requestProcessing = requestService.getListProcessing();
		List<Request> requestClosed = requestService.getListClosed();
		List<Status> status = requestService.getAllStatus();
		modelAndView.addObject("name", lfName);
		modelAndView.addObject("requestCreate", requestCreate);
		modelAndView.addObject("requestProcessing", requestProcessing);
		modelAndView.addObject("requestClosed", requestClosed);
		modelAndView.addObject("status", status);
		modelAndView.setViewName("list");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public String delete(@PathVariable Long id){
		System.err.println(id);
		requestService.deleteId(id);
		return "redirect:/";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public  String add(@RequestBody HashMap<String, String> map) {
		Request request = new Request();
		User user= (User) org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
		String lfName = user.getlfName();
		request.setLfName(lfName);
		request.setDepartament(user.getDepartaments().toString());
		
		for (HashMap.Entry<String, String> entry : map.entrySet()) {
		    System.out.printf("key = %s, value = %s\r\n", entry.getKey(), entry.getValue());
		    if (entry.getKey().equals("description")){
		    	request.setDescription(entry.getValue());
		    }else if (entry.getKey().equals("title")) {
				request.setTitle(entry.getValue());
			}else if (entry.getKey().equals("status")) {
				
				List<Status> status = requestService.getAllStatus();
				for (Status status2 : status) {
					if (status2.toString().equals(entry.getValue())) {
						request.setStatus(status2);
						break;
					}
				}
			}else if (entry.getKey().equals("date")){
				
				String[] d = entry.getValue().split("\\.");
				
				DateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
				try {
					Date date = formatter.parse(d[2]+"."+d[1]+"."+d[0]);
					request.setDate(date);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				
				
			
			}
		}
	    requestService.save(request);
	 
		
		return "OK";
	}
	
	
		
	  @RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
	    @ResponseBody
	    public String ajaxTest() {
	        Set<String> records = new HashSet<String>();
	        records.add("Record #1");
	        records.add("Record #2");
	 
	        return "OK";
	    }
	  
	  
	  @RequestMapping(value="/update", method=RequestMethod.POST, consumes="application/json")
		@ResponseBody
		public  String update(@RequestBody Long id) {
			Request request = requestService.getById(id);
			System.out.println(request);
			return "OK";
		}
	
	
}
