package com.care.coffee.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
	@Autowired private UserService service;
	@Autowired private HttpSession session;
	
	@GetMapping("user/login")
	public String login() {
		return "user/login";
	}
	@PostMapping("user/loginProc")
	public String loginProc(UserDTO dto,Model model,RedirectAttributes ra) {
		String msg = "";
		if(dto.getId()==""||dto.getId().trim().isEmpty()) {//2차 유효성
			msg="Id를 입력하세요";
			model.addAttribute("msg",msg);
			return "login";
		}else if(dto.getPw()==""||dto.getPw().trim().isEmpty()) {
			msg="비밀번호를 입력하세요";
			model.addAttribute("msg",msg);
			return "login";
		}
		int res = service.loginProc(dto);
		if(res>0) {
			msg=dto.getId()+"님이 로그인 하셨습니다.";
			session.setAttribute("id", dto.getId());
			ra.addFlashAttribute("msg",msg);
			return "redirect:/index";
		}
		msg="회원정보가 일치하지 않습니다.";
		ra.addFlashAttribute("msg",msg);
		return "redirect:login";
	}
	
	@GetMapping("user/userSsn")
	public String userSsn() {
		return "user/userSsn";
	}
	
	@PostMapping("user/regist")
	public String regist(UserDTO dto,Model model) {
		String msg="";
		//System.out.println(dto.getUserName());
		//System.out.println(dto.getSsn1());
		//System.out.println(dto.getSsn2());
		if(dto.getUserName()==""||dto.getUserName().trim().isEmpty()) {
			msg="아이디를 입력하세요"; //화면에 송출 x
			return "redirect:/index";
		}else if(dto.getMobile()==0) {
			msg="전화번호를 입력하세요"; //화면에 송출 x
			return "redirect:index";
		}
		int res = service.userSsn(dto);
		
		if(res>0) {
			msg="이미 존재하는 회원입니다."; 
			return "redirect:index";
		}
		msg="회원가입 페이지로 넘어갑니다.";
		model.addAttribute("dto",dto);
		return "/user/regist";
	}
	
	@ResponseBody
	@PostMapping(value = "idCheck", produces = "application/json; charset=utf-8")
	public String idCheck(@RequestBody Map<String, String> requestData) {
		System.out.println("test========");
	    String id = requestData.get("id");
	    System.out.println(id);
	    
	    // 중복 아이디 확인 로직을 수행합니다.
	    // 중복된 경우 "존재하는 ID 입니다."를 반환, 중복되지 않은 경우 다른 메시지를 반환하도록 구현해야 합니다.
	    
	    return "존재하는 ID 입니다.";
	}
	//---회원가입 미완성
	@PostMapping("user/registProc")
	public String registProc(UserDTO dto) {
		
		String msg = "회원 가입 실패";
		if(dto.getId()==""||dto.getId().trim().isEmpty()) {
			msg="아이디를 입력하세요";
			return "redirect:index";
		}else if(dto.getPw()==""||dto.getPw().trim().isEmpty()){
			msg="비밀번호를 입력하세요";
			return "redirect:index";
		}
		int res =service.registProc(dto);
		
		if(res>0) {
			msg=dto.getUserName()+"님의 가입이 완료되었습니다.";
		}
		
		return "redirect:/index";
	}
	//--------------------------------------------------------------------------------
	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
		String msg="로그인 상태가 아닙니다.";
		//System.out.println("세션값"+session.getAttribute("id"));
		if(session.getAttribute("id")!=null) {
			if(session.getAttribute("loginType")=="kakao") {
				kakao.unlink();
				session.invalidate();
			}else if(session.getAttribute("loginType")=="naver") {
				naver.unlink();
				session.invalidate();
			}
			session.invalidate();
			msg="로그아웃 되셨습니다.";
		}
		
		ra.addFlashAttribute("msg",msg);
		return "redirect:index";
	}
	//카카오 로그인 ----------------------------------
	@Autowired private KakaoService kakao;
	@RequestMapping("user/kakaoLogin")
	public String kakaoLogin(@RequestParam("code")String code) { //Redirect URI로 받은 인가 코드
		System.out.println("code :" + code);
		kakao.getAccessToken(code); //AccessToken 가져오기
		kakao.getUserInfo();		   //UserInfo 가져오기
	
		return "redirect:/index";
	}
	//네이버 로그인 ----------------------------------
	@Autowired private NaverService naver;
	@RequestMapping("user/naverLogin")
	public String naverLogin(@RequestParam("code")String code,RedirectAttributes ra) {
		System.out.println("code :" + code);
		naver.getAccessToken(code);
		naver.getUserInfo(ra);
		
		return "redirect:/index";
	}
	
	//메가 로그인 ----------------------------------
}
