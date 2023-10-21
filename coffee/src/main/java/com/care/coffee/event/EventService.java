package com.care.coffee.event;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.coffee.event.EventDTO;

@Service
public class EventService {
	@Autowired
	private EventMapper mapper;

	public void eventForm(Model model) {
		List<EventDTO> boards = mapper.eventForm();
		model.addAttribute("boards", boards);
		
	}

	public void eventWrite() {

	}

	public void eventWriteProc(EventDTO dto) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setReg_date(sdf.format(new Date()));
		dto.setId("admin"); // 관리자 세션으로 변경 예정

		mapper.eventWriteProc(dto);
	}

	public EventDTO eventContent(String no, Model model) {

		int n = 1;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return null;
		}

		EventDTO board = mapper.eventContent(n);
		if (board != null) {
			// 조회수 증가
			mapper.incrementHits(n);
			board.setHits(board.getHits() + 1);

			return board;
		} else {

			return null; // 올바른 반환값
		}
	}

	public String eventModify(String no, Model model) {
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return "redirect:eventForm";
		}
		EventDTO board = mapper.eventContent(n);
		model.addAttribute("board", board);
		return null;
	}

	public String eventModifyProc(EventDTO dto) {
		EventDTO check = mapper.eventContent(dto.getNo());
		if (check == null)
			return "게시글 번호에 문제가 발생했습니다.";

		if (dto.getSubject() == null || dto.getSubject().trim().isEmpty()) {
			return "제목을 입력하세요";
		}
		if (dto.getContent() == null || dto.getContent().trim().isEmpty()) {
			return "내용을 입력하세요";
		}
		int result = mapper.eventModifyProc(dto);
		if (result == 0)
			return "게시글 수정에 실패했습니다";

		return "게시글 수정 성공";
	}

	public String eventDeleteProc(String no) {
		int n = 0;		
		try {
			n = Integer.parseInt(no);			
		} catch (Exception e) {
			return "게시글 번호에 문제가 발생했습니다.";
		}		
		EventDTO board = mapper.eventContent(n);		
		if(board == null)
			return "게시글 번호에 문제가 발생했습니다.";

		mapper.eventDeleteProc(n);		
		return "게시글 삭제 완료";
	}
}
