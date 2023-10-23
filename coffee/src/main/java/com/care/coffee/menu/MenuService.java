package com.care.coffee.menu;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.coffee.board.BoardDTO;

import jakarta.servlet.http.HttpSession;



@Service
public class MenuService {
	@Autowired private MenuMapper mapper;
	private String filePath ="C:\\javas\\boot_workspace\\coffee\\src\\main\\resources\\upload";
	
	public void totalMenu(Model model) {
		List<MenuDTO> menu = mapper.totalMenu();
		model.addAttribute("menus", menu);
		
	}
	

	public String menuWriteProc(MenuDTO menu,MultipartHttpServletRequest multi) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		menu.setMenuDate(sdf.format(new Date()));
		menu.setCategory(multi.getParameter("category"));
		
		menu.setMenuName(multi.getParameter("menuName"));
		int menuPrice = Integer.parseInt(multi.getParameter("menuPrice"));
		menu.setMenuPrice(menuPrice);
		menu.setMenuContent(multi.getParameter("menuContent"));
		menu.setMenuImage("");
		//System.out.println(menu.getCategory());
		//System.out.println(menu.getMenuContent());
		//System.out.println(menu.getMenuPrice());
		//System.out.println(menu.getMenuDate());
		
		MultipartFile file = multi.getFile("upfile");
		if(file.getSize()!=0) {
			String fileName = file.getOriginalFilename();
				System.out.println(fileName);
			String suffix = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
			System.out.println("WriteProc-suffix : "+suffix);
			
			/*	
			if(suffix.equalsIgnoreCase("jpg")==false ||
					suffix.equalsIgnoreCase("jpeg") ==false||
					suffix.equalsIgnoreCase("png") ==false){
				
				return "redirect:/menu/menuWrite";
			}
			*/
			File f = new File(filePath);
			if(f.exists() == false) {
				f.mkdirs();
			}
			String fullPath = filePath + "\\" + fileName;
			menu.setMenuImage(fullPath);
			f = new File(fullPath);
			try {
				file.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
				menu.setMenuImage("");
			}
		}
		mapper.menuWriteProc(menu);
		return "redirect:/menu/totalMenu";
	}

	public void fileUpload(MenuDTO dto) {
		String filePath = (String) dto.getMenuImage();
		System.out.println(filePath);
		
		
	}

	
}

