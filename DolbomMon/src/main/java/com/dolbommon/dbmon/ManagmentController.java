package com.dolbommon.dbmon;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagmentController {
	@RequestMapping("/management")
	public String management() {
		return "management/management";
	}
	@RequestMapping("/managerLogin") //인터셉터용
	public String login() {
		return "management/managerLogin";
	}

	
	@RequestMapping("/test")
	public String test() {
		return "management/test";
	}
	
	@RequestMapping(value="/memberManage", method=RequestMethod.POST)
	public String memberManage(){
		return "management/memberManage";
	}
	
	@RequestMapping("/managerRegister")
	public String managerRegister(){
		return "management/managerRegister";
	}
	@RequestMapping("/accountManage")
	public String accountManage(){
		return "management/accountManage";
	}
	@RequestMapping("/managerManage")
	public String managerManage(){
		return "management/managerManage";
	}
	
	@RequestMapping("/managerLogout")
	public String managerLogout(HttpSession session) {
		session.setAttribute("managerStatus", "N");
		return "management/managerLogin";
	}
	@RequestMapping("/managerlogin2") //임시로그인
	public String managerlogin(HttpSession session) {
		session.setAttribute("managerStatus", "Y");
		return "management/management";
	}


}
