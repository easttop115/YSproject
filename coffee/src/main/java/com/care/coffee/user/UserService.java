package com.care.coffee.user;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired UserMapper dao;

	public int userSsn(UserDTO dto) {
			System.out.println(dto.getUserName());
			System.out.println(dto.getMobile());
			
			int res =dao.userSsn(dto);
			
			return res;
		
		
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

}
