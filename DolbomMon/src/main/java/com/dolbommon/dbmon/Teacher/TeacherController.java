package com.dolbommon.dbmon.Teacher;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeacherController {

	@RequestMapping("/teacherList")
	public String teacherList() {
		return "/teacher/teacherList";
	}
	
	@RequestMapping("/teacherView")
	public String teacherView() {
		return "/teacher/teacherView";
	}
	
	@RequestMapping("/teacherHeart")
	public String teacherHeart() {
		return "/teacher/teacherHeart";
	}
	
	@RequestMapping("/teacherApplyHistory")
	public String teacherApplyHistory() {
		return "/teacher/teacherApplyHistory";
	}
	
	@RequestMapping("/teacherEdit")
	public String teacherEdit() {
		return "/teacher/teacherEdit";
	}
	
	@RequestMapping("/teacherProof")
	public String teacherProof() {
		return "/teacher/teacherProof";
	}
	
	@RequestMapping("/teacherIntro")
	public String teacherIntro() {
		return "/teacher/teacherIntro";
	}
	
	@RequestMapping("/teacherWage")
	public String teacherWage() {
		return "/teacher/teacherWage";
	}
	
	@RequestMapping("/teacherPicture")
	public String teacherPicture() {
		return "/teacher/teacherPicture";
	}
	
	@RequestMapping("/teacherExp")
	public String teacherExp() {
		return "/teacher/teacherExp";
	}
	
	@RequestMapping("/teacherAge")
	public String teacherAge() {
		return "/teacher/teacherAge";
	}
	
	@RequestMapping("/teacherActivity")
	public String teacherActivity() {
		return "/teacher/teacherActivity";
	}
	
	@RequestMapping("/teacherProofIdenti")
	public String teacherProofIdenti() {
		return "/teacher/teacherProofIdenti";
	}
	
	@RequestMapping("/teacherType")
	public String teacherType() {
		return "/teacher/teacherType";
	}
}
