package com.care.coffee.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class MenuController {
	@Autowired private MenuService service;
	
	@RequestMapping("menu/totalMenu")
	public String totalMenu(Model model){
		service.totalMenu(model);
		return "menu/totalMenu";
	}
	
	@RequestMapping("menu/menuForm")
	public String menuForm() {
		return "menu/menuForm";
	}
	
	// 메뉴작성 -------------------------------------
 	@GetMapping("menu/menuWrite")
	public String menuWrite() {
		return "menu/menuWrite";
	}
	
 	// 메뉴작성 실행 ---------------------------------
	@PostMapping("menu/menuWriteProc")
	public String menuWriteProc(MenuDTO dto,MultipartHttpServletRequest multi) {
		
		String mapping = service.menuWriteProc(dto,multi);
		
		return mapping;			
	}
}