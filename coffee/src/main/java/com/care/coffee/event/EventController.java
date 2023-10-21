package com.care.coffee.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EventController {
	@Autowired private EventService service;	
	
	@RequestMapping("event/eventForm")
	public String eventForm(Model model) {
		
		service.eventForm(model);
		return "event/eventForm";
	}
	
	@RequestMapping("event/eventWrite")
	public String eventWrite() {
		service.eventWrite();
		return "event/eventWrite";
	}
	
	@PostMapping("event/eventWriteProc")
	public String eventWriteProc(EventDTO dto) {
		service.eventWriteProc(dto);
		return "redirect:eventForm";			
	}
	
	@RequestMapping("event/eventContent")
	public String eventContent(String no, Model model) {
		
		EventDTO board = service.eventContent(no, model);
		if(board == null) {
			
			return "redirect:eventForm";
		}
		
		model.addAttribute("board", board);
		return "event/eventContent";
	}
	
	@RequestMapping("event/eventModify")
	public String eventModify(String no, Model model) {
		String path = service.eventModify(no, model);
		return path;
	}
	
	@PostMapping("event/eventModifyProc")
	public String eventModifyProc(EventDTO dto, RedirectAttributes ra) {
		String msg = service.eventModifyProc(dto);
		ra.addFlashAttribute("msg",msg);
		
		if(msg.equals("게시글 수정 성공"))
			return "redirect:eventContent?no=" + dto.getNo();
		return "redirect:eventModify?no=" + dto.getNo();
	}
	
	@RequestMapping("event/eventDeleteProc")
	public String eventDeleteProc(String no) {
		service.eventDeleteProc(no);
		return "redirect:eventForm";
	}
}
