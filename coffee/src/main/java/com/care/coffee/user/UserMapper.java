package com.care.coffee.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

	int userSsn(UserDTO dto);

	int registProc(UserDTO dto);

	int loginProc(UserDTO dto);

	int snsLogCheck(String id, String loginType);

	void snsRegist(String id, String loginType);

	void snsRegist(SnsUserDTO dto);

	int idCheck(String id);

	String findIdProc(UserDTO dto);

	String findPwProc(UserDTO dto);

	int totalCount(String select, String search);

	ArrayList<UserDTO> UserList(@Param("begin")int begin, @Param("end")int end,@Param("select") String select,@Param("search")String search);

	UserDTO myPage(@Param("id")String id);

	UserDTO getMember(@Param("no")int no);

	int userUpdateProc(UserDTO dto);
		
}
