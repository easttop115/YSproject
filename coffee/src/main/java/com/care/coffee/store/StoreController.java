package com.care.coffee.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	
	@GetMapping("spot")
	public String spot() {
		return "store/spot";
	}
}
