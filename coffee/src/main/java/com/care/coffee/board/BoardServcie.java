package com.care.coffee.board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.coffee.board.BoardDTO;

@Service
public class BoardServcie {
	@Autowired	private BoardMapper mapper;

	
	public void boardForm(Model model) {
		List<BoardDTO> board = mapper.boardForm();
		model.addAttribute("boards", board);
		
	}
	/*
	
	*/
	
	public int boardWriteProc(BoardDTO dto) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setReg_date(sdf.format(new Date()));
		int res = mapper.boardWriteProc(dto);
		return res;
		
	}

	public BoardDTO boardContent(String no) {
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
			return null;
		}
		
		BoardDTO board = mapper.boardContent(n);
	    if (board != null) {
	        // 조회수 증가
	        mapper.incrementHits(n);
	        board.setHits(board.getHits() + 1);
	        return board;
	    } else {
	        return null;
	    }
	}

	public BoardDTO boardModify(String no) {
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		BoardDTO board = mapper.boardContent(n);
		if(board==null) {
			return null;
		}
		return board;
	}

	public String boardModifyProc(BoardDTO board) {
		//BoardDTO check = mapper.boardContent(board.getNo());
		//이미 jsp 에서 수정될 데이터가 post로 넘어오기에 제거
		if(board == null)
			return "게시글에 문제가 발생했습니다.";
		
		if(board.getSubject() == null || board.getSubject().trim().isEmpty()) {
			return "제목을 입력하세요";
		}
		if(board.getContent() == null || board.getContent().trim().isEmpty()) {
			return "내용을 입력하세요";
		}
			
		int result = mapper.boardModifyProc(board);
		if(result == 0) {
			return "게시글 수정에 실패했습니다";
		}
		return "게시글 수정 성공";
	}
	
	public int boardDeleteProc(String no) {
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return 0;
		}		
		
		int res = mapper.boardDeleteProc(n);
		return  res;
	}
}
