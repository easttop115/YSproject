package com.care.coffee.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
@Autowired private BoardServcie service;
	
	// 공지사항 목록보기--------------------------------
	@RequestMapping("board/boardForm") //공지사항
	public String boardForm(Model model) {	
		service.boardForm(model);
		return "board/boardForm";
	}
	
	
	// 글작성 ---------------------------------------
	@GetMapping("board/boardWrite")
	public String boardWrite() { 
		//글쓰기 창으로의 이동이므로 메소드가 필요가 없다.
		
		//service.boardWrite(); service메소드 삭제
		return "board/boardWrite";
	}
	
	// 글작성 실행 ------------------------------------
	@PostMapping("board/boardWriteProc")
	public String boardWriteProc(BoardDTO board,Model model) {
		String msg = "";
		if(board.getSubject()==""||board.getSubject().trim().isEmpty()) {
			msg="제목을 입력하세요.";
			model.addAttribute("msg",msg);
			model.addAttribute("board",board);
			return "board/boardWrite";
		}else if(board.getContent()==""||board.getContent().trim().isEmpty()) {
			msg="내용을 입력하세요.";
			model.addAttribute("msg",msg);
			model.addAttribute("board",board);
			return "board/boardWrite";
		} 
		int res = service.boardWriteProc(board);
		return "redirect:boardForm";			
	}
	
	// 글내용 -----------------------------------------
	@RequestMapping("board/boardContent")
	public String boardContent(String no, Model model) {
		BoardDTO board = service.boardContent(no);
		if(board == null) {
			return "redirect:boardForm";
		}
		model.addAttribute("board", board);
		return "board/boardContent";
	}
	
	// 글수정 ------------------------------------------
	@RequestMapping("board/boardModify")
	public String boardModify(String no, Model model) {
		BoardDTO board = service.boardModify(no);
		model.addAttribute("board",board);
		return "board/boardModify";
	}
	// 글수정 실행 ---------------------------------------
	@PostMapping("board/boardModifyProc")
	public String boardModifyProc(BoardDTO board, RedirectAttributes ra) {
		
		String msg = service.boardModifyProc(board);
		ra.addFlashAttribute("msg",msg);

		if(msg.equals("게시글 수정 성공")) {
			return "redirect:boardContent";
		}
		return "redirect:boardModify";
	}
	// 글삭제 실행 ---------------------------------------
	@RequestMapping("board/boardDeleteProc")
	public String boardDeleteProc(String no,Model model) {
		String msg="게시글 삭제가 실패되었습니다.";
		
		int res = service.boardDeleteProc(no);
		
		if(res>0) {
			msg = "게시글이 삭제되었습니다.";
			model.addAttribute(msg);
			return "redirect:boardForm";
		}
		model.addAttribute(msg);
		return "redirect:boardForm";
	}
}