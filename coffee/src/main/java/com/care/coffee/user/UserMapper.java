package com.care.coffee.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	int userSsn(UserDTO dto);

	int registProc(UserDTO dto);

	int loginProc(UserDTO dto);

	int snsLogCheck(String id, String loginType);

	void snsRegist(String id, String loginType);

	void snsRegist(SnsUserDTO dto);

	int idCheck(String id);
		
}
