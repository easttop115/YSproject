package com.care.coffee.event;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.coffee.board.BoardDTO;

@Mapper
public interface EventMapper {
	
	List<EventDTO> eventForm();
	
	void eventWriteProc(EventDTO board);

	EventDTO eventContent(int n);

	void incrementHits(int n);

	int eventModifyProc(EventDTO dto);

	void eventDeleteProc(int n);
}
