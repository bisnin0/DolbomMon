package com.dolbommon.dbmon.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	//濡쒓렇�씤 �럹�씠吏�濡� �씠�룞
	@RequestMapping("/login")
	public String login() {
		return "login/loginForm";	
	}
	
	//濡쒓렇�씤
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk() {
		
		return null;
	}
	
	//怨꾩젙 李얘린 �럹�씠吏�濡� �씠�룞
	@RequestMapping("/searchId")
	public String searchId() {
		return "login/idSearch";		
	}
	
	//怨꾩젙 李얘린
//	@RequestMapping("/idInfo")
//	public ModelAndView idInfo() {
	
//		return null;	
//	}
	
	//怨꾩젙 李얘린
	@RequestMapping("/idInfo")
	public String idInfo() {
		
		return "login/idInfo";

	}
}
