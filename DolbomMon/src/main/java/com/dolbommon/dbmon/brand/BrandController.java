package com.dolbommon.dbmon.brand;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BrandController {
	@RequestMapping("/brandIntro")
	public String brand() {
		
		return "brand/brandIntro";
	}
}
