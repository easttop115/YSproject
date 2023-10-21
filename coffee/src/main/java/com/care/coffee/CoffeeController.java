package com.care.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoffeeController {//메인페이지
		
	@RequestMapping("index")
	public String index() {
		return "/index";
	}
	@RequestMapping("header")
	public String header() {
		return "/default/header";
	}
	@RequestMapping("main")
	public String main() {
		return "/default/main";
	}
	@RequestMapping("footer")
	public String footer() {
		return "/default/footer";
	}

}
