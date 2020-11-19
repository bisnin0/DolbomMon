package com.dolbommon.dbmon.message;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@RequestMapping("/message")
	public String message() {
		return "message/messageMain";
	} 
}
