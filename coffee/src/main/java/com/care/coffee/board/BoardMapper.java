package com.care.coffee.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BoardMapper {
	
	List<BoardDTO> boardForm();
	
	int boardWriteProc(BoardDTO board);
	
	BoardDTO boardContent(int n);

	void incrementHits(int n);

	int boardModifyProc(BoardDTO dto);

	int boardDeleteProc(int n);
	
}
