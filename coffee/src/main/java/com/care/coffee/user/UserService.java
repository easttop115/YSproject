package com.care.coffee.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.coffee.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
	@Autowired UserMapper dao;
	@Autowired private HttpSession session;
	
	
	public int userSsn(UserDTO dto,String smsNumber) {
			System.out.println(dto.getUserName());
			System.out.println(dto.getMobile());
			String Numstr1 = smsNumber;
			String Numstr2 = (String)session.getAttribute("numStr");
			System.out.println(Numstr1);
			System.out.println(Numstr2);
			
			if(Numstr1.equals(Numstr2)==false) {
				return 0;
			}else if(Numstr1.equals(Numstr2)) {
				int res = dao.userSsn(dto);
				if(res>0) {
					return 0;
				}
				return 1;
			}
			
			return 1;
		
		
	}

	public int registProc(UserDTO dto) {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setReg_Date(sdf.format(date));
		System.out.println(dto.getAddress());
		int res = dao.registProc(dto);	
		
		
		return res;
		
	}

	public int loginProc(UserDTO dto) {
		int res = dao.loginProc(dto);
		
		
		return res;
	}

	public int idCheck(String id) {
		int res = dao.idCheck(id);
		
		return res;
	}

	public String findIdProc(UserDTO dto,String smsNumber) {
		System.out.println(dto.getUserName());
		System.out.println(dto.getMobile());
		String Numstr1 = smsNumber;
		String Numstr2 = (String)session.getAttribute("numStr");
		System.out.println(Numstr1);
		System.out.println(Numstr2);
		
		if(Numstr1.equals(Numstr2)==false) {
			return null;
		}else if(Numstr1.equals(Numstr2)) {
			String id = dao.findIdProc(dto);
			return id;
		}
		return null;
	
	}

	public String findPwProc(UserDTO dto, String smsNumber) {
		System.out.println(dto.getUserName());
		System.out.println(dto.getId());
		System.out.println(dto.getMobile());
		String Numstr1 = smsNumber;
		String Numstr2 = (String)session.getAttribute("numStr");
		System.out.println(Numstr1);
		System.out.println(Numstr2);
		
		if(Numstr1.equals(Numstr2)==false) {
			return null;
		}else if(Numstr1.equals(Numstr2)) {
			String pw = dao.findPwProc(dto);
			return pw;
		}
		return null;
	}

	public ArrayList<UserDTO> userList(String select, String search, Model model, String cp) {
			
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
			
		int pageBlock = 7; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
			
		if(select == null)
			select = "";
		ArrayList<UserDTO> dto = dao.UserList(begin, end, select, search);
		int totalCount = dao.totalCount(select, search);
			
		if(totalCount == 0) {
			return dto;
		}
		model.addAttribute("members", dto);
		String url = "userList?select="+select+"&search="+search+"&currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);
		
		model.addAttribute("result", result);
		model.addAttribute("select", select);
		model.addAttribute("search", search);
		
		return dto;
			
	}
}

