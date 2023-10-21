package com.care.coffee.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.coffee.board.BoardDTO;

@Mapper
public interface MenuMapper {
	
	
	List<MenuDTO> totalMenu();
	
	void menuForm(MenuDTO menu);

	void menuWriteProc(MenuDTO dto);

	


	
}
