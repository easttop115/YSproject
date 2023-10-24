package com.care.coffee.user;

import java.util.ArrayList;

import java.util.Map;
import java.util.Random;

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

import edu.emory.mathcs.backport.java.util.Arrays;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	@Autowired
	private HttpSession session;

	@GetMapping("user/login")
	public String login() {
		return "user/login";
	}
	// 읿반 로그인
	@PostMapping("user/loginProc")
	public String loginProc(UserDTO dto, Model model, RedirectAttributes ra) {
		String msg = "";
		if (dto.getId() == "" || dto.getId().trim().isEmpty()) {// 2차 유효성
			msg = "Id를 입력하세요";
			model.addAttribute("msg", msg);
			return "login";
		} else if (dto.getPw() == "" || dto.getPw().trim().isEmpty()) {
			msg = "비밀번호를 입력하세요";
			model.addAttribute("msg", msg);
			return "login";
		}
		int res = service.loginProc(dto);
		if (res > 0) {
			msg = dto.getId() + "님이 로그인 하셨습니다.";
			session.setAttribute("id", dto.getId());
			ra.addFlashAttribute("msg", msg);
			return "redirect:/index";
		}
		msg = "회원정보가 일치하지 않습니다.";
		ra.addFlashAttribute("msg", msg);
		return "redirect:login";
	}

	@GetMapping("user/userSsn")
	public String userSsn() {
		return "user/userSsn";
	}

	@PostMapping("/user/regist")
	public String regist(UserDTO dto, String smsNumber,Model model, RedirectAttributes ra) {
		String msg = "";
		// System.out.println(dto.getUserName()); //System.out.println(dto.getSsn1());
		// System.out.println(dto.getSsn2());
		if (dto.getUserName() == "" || dto.getUserName().trim().isEmpty()) {
			msg = "이름을 입력하세요."; // 화면에 송출 x return "redirect:/index"; }else
			ra.addFlashAttribute("msg",msg);
			return "redirect:index";
		} else if (dto.getMobile() == 0) {
			msg = "전화번호를 입력하세요."; // 화면에 송출 x return
			ra.addFlashAttribute("msg",msg);
			return "redirect:index";
		} else if (smsNumber =="" || smsNumber.trim().isEmpty()) {
			msg ="인증번호를 입력하세요.";
			ra.addFlashAttribute("msg",msg);
			return "redirect:index";
		}

		int res = service.userSsn(dto,smsNumber);

		if (res == 0) {
			msg = "본인 인증에 실패하셨습니다.";
			ra.addFlashAttribute("msg", msg);
			session.invalidate();
			return "redirect:/index";
		}
		msg = "회원가입을 진행합니다.";
		model.addAttribute("dto", dto);
		session.invalidate();
		return "/user/regist";
	}

	
	// 문자 인증 ----------
	@Autowired private SmsService sms;
	@ResponseBody
	@PostMapping(value="smsCheck",produces = "text/plain; charset=utf-8")
	public String regist(@RequestBody String mobile, Model model) {
		String msg = "";
		Random random = new Random();
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String rand = Integer.toString(random.nextInt(10));
			numStr += rand;
		}
		System.out.println("수신자 번호 : " + mobile);
		System.out.println("인증 번호 : " + numStr);
		//int res =sms.smsService(mobile, numStr);
		//if(res>0) {
			System.out.println("문자 전송 성공");
			session.setAttribute("numStr", numStr);
			return "문자 전송 성공";
		//}
		//System.out.println("문자 전송 실패");
		
		//return "문자 전송 실패";
	}

	// 중복 확인----------
	@ResponseBody
	@PostMapping(value = "idCheck", produces = "text/plain; charset=utf-8")
	public String idCheck(@RequestBody String id) {
		// System.out.println("test========");
		// System.out.println(id);

		String msg = "존재하는 ID";

		int res = service.idCheck(id);

		if (res == 0) {
			msg = "존재하지 않는 ID";
			return msg;
		}

		return msg;
	}

	// ---회원가입 
	@PostMapping("user/registProc")
	public String registProc(UserDTO dto, RedirectAttributes ra) {

		String msg = "회원 가입 실패";
		if (dto.getId() == "" || dto.getId().trim().isEmpty()) {
			msg = "아이디를 입력하세요";
			return "redirect:index";
		} else if (dto.getPw() == "" || dto.getPw().trim().isEmpty()) {
			msg = "비밀번호를 입력하세요";
			return "redirect:index";
		}
		int res = service.registProc(dto);

		if (res > 0) {
			msg = dto.getUserName() + "님의 가입이 완료되었습니다.";
			ra.addFlashAttribute("msg", msg);
		}

		return "redirect:/user/login";
	}

	// --------------------------------------------------------------------------------
	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
		String msg = "로그인 상태가 아닙니다.";
		// System.out.println("세션값"+session.getAttribute("id"));
		if (session.getAttribute("id") != null) {
			if (session.getAttribute("loginType") == "kakao") {
				kakao.unlink();
				session.invalidate();
			} else if (session.getAttribute("loginType") == "naver") {
				naver.unlink();
				session.invalidate();
			}
			session.invalidate();
			msg = "로그아웃 되셨습니다.";
		}

		ra.addFlashAttribute("msg", msg);
		return "redirect:index";
	}

	// 카카오 로그인 ----------------------------------
	@Autowired
	private KakaoService kakao;

	@RequestMapping("user/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code) { // Redirect URI로 받은 인가 코드
		System.out.println("code :" + code);
		kakao.getAccessToken(code); // AccessToken 가져오기
		kakao.getUserInfo(); // UserInfo 가져오기

		return "redirect:/index";
	}

	// 네이버 로그인 ----------------------------------
	@Autowired
	private NaverService naver;

	@RequestMapping("user/naverLogin")
	public String naverLogin(@RequestParam("code") String code, RedirectAttributes ra) {
		System.out.println("code :" + code);
		naver.getAccessToken(code);
		naver.getUserInfo(ra);

		return "redirect:/index";
	}

	// 아이디 찾기 ----------------------------------
	@GetMapping("user/findId")
	public String findId() {
		return "user/findId";
	}
	@PostMapping("user/findIdProc")
	public String findIdProc(UserDTO dto,RedirectAttributes ra,String smsNumber,Model model){
		String msg = "";
		if (dto.getUserName() == "" || dto.getUserName().trim().isEmpty()) {
			msg = "이름을 입력하세요."; // 화면에 송출 x return "redirect:/index"; }else
			ra.addFlashAttribute("msg",msg);
			return "redirect:findId";
		} else if (dto.getMobile() == 0) {
			msg = "전화번호를 입력하세요."; // 화면에 송출 x return
			ra.addFlashAttribute("msg",msg);
			return "redirect:findId";
		} else if (smsNumber =="" || smsNumber.trim().isEmpty()) {
			msg ="인증번호를 입력하세요.";
			ra.addFlashAttribute("msg",msg);
			return "redirect:findId";
		}
		
		String id = service.findIdProc(dto,smsNumber);
		if (id == null||id=="" || id.trim().isEmpty()) {
			msg = "아이디 찾기에 실패하셨습니다.";
			ra.addFlashAttribute("msg",msg);
			session.invalidate();
			return "redirect:findId";
		}
		msg = id;
		ra.addFlashAttribute("msg",msg);
		return "redirect:findId";
	}
	// 비밀번호 찾기 ----------------------------------
	@GetMapping("user/findPw")
	public String findPw() {
		return "user/findPw";
	}
	@PostMapping("user/findPwProc")
	public String findPw(UserDTO dto,RedirectAttributes ra,String smsNumber,Model model) {
		String msg = "";
		if (dto.getUserName() == "" || dto.getUserName().trim().isEmpty()) {
			msg = "이름을 입력하세요."; // 화면에 송출 x return "redirect:/index"; }else
			ra.addFlashAttribute("msg",msg);
			return "redirect:findPw";
		}else if (dto.getId() == "" || dto.getId().trim().isEmpty()) {
			msg = "아이디를 입력하세요."; // 화면에 송출 x return
			ra.addFlashAttribute("msg",msg);
			return "redirect:findPw";
		} else if (dto.getMobile() == 0) {
			msg = "전화번호를 입력하세요."; // 화면에 송출 x return
			ra.addFlashAttribute("msg",msg);
			return "redirect:findPw";
		} else if (smsNumber =="" || smsNumber.trim().isEmpty()) {
			msg ="인증번호를 입력하세요.";
			ra.addFlashAttribute("msg",msg);
			return "redirect:findPw";
		}
		
		String pw = service.findPwProc(dto,smsNumber);
		if (pw == null||pw=="" || pw.trim().isEmpty()) {
			msg = "비밀번호 찾기에 실패하셨습니다.";
			ra.addFlashAttribute("msg",msg);
			session.invalidate();
			return "redirect:findPw";
		}
		msg = pw;
		ra.addFlashAttribute("msg",msg);
		return "redirect:findPw";
	}
	// 회원관리(목록) 보기 ---------------------------
	@RequestMapping("/user/userList")
	public String userInfo(String select,String search,Model model,@RequestParam(value="currentPage",defaultValue="1",required=false)String cp) {
		System.out.println(select+" "+search);
		ArrayList<UserDTO> dto = service.userList(select,search,model,cp);
		//MemberService에 select,search 데이터를 보내기 위해 매개변수에 select와 search 추가한다.
		model.addAttribute("dto",dto);
		return "/user/userList";
	}
	
	// 마이페이지 -----------------------------
	@RequestMapping("/user/myPage")
	public String myPage(RedirectAttributes ra,Model model) {
		String msg="";
		String id =(String) session.getAttribute("id");
		System.out.println(id);
		if(id==""||id.trim().isEmpty()) {
			msg="로그인 후 이용하세요.";
			ra.addFlashAttribute("msg",msg);
			return  "redirect:/user/login";
		}
		UserDTO dto = service.myPage(id);
		if(dto==null) {
			msg="회원정보 불러오기를 실패했습니다.";
			ra.addFlashAttribute("msg",msg);
			return "redirect:/index";
		}
		model.addAttribute("dto",dto);
		return "/user/myPage";
	}
	
	@RequestMapping("/user/userUpdate")
	public String userUpdate(UserDTO dto,Model model,RedirectAttributes ra) {
		System.out.println(dto.getNo());
		String msg="";
		if(dto.getNo()==0) {
			msg="회원정보를 불러올 수 없습니다.";
			ra.addFlashAttribute("msg",msg);
			return "redirect:/index";
		}
		int no = dto.getNo();
		dto = service.getMember(no);
		if(dto.getAddress()==""||dto.getAddress().trim().isEmpty()) {
			model.addAttribute("dto",dto);
			return "/user/userUpdate";
		}
		String[] address =dto.getAddress().split("//");
		//System.out.println(Arrays.toString(address));
		//System.out.println(address[1]);
		model.addAttribute("postcode",address[0]);
		model.addAttribute("address",address[1]);
		model.addAttribute("detailAddress",address[2]);
		model.addAttribute("dto",dto);
		return "/user/userUpdate";
	}
	
	@PostMapping("/user/userUpdateProc")
	public String userUpdateProc(UserDTO dto,Model model,RedirectAttributes ra) {
		String msg="";
		System.out.println(dto.getNo());
		System.out.println(dto.getPw());
		if(dto.getPw()==""||dto.getPw().trim().isEmpty()) {
			msg="비밀번호를 입력하세요.";
			model.addAttribute("msg",msg);
			return "/userUpdate";
		}else if(dto.getUserName()==""||dto.getUserName().trim().isEmpty()) {
			msg="이름을 입력하세요.";
			model.addAttribute("msg",msg);
			return "/userUpdate";
		}else if(dto.getEmail()==""||dto.getEmail().trim().isEmpty()) {
			msg="이메일을 입력하세요.";
			model.addAttribute("msg",msg);
			return "/userUpdate";
		}else if(dto.getMobile()==0) {
			msg="전화번호를 입력하세요.";
			model.addAttribute("msg",msg);
			return "/userUpdate";
		}
		int res =service.userUpdateProc(dto);
		if(res>0) {
			msg="회원수정에 성공하셨습니다.";
			ra.addFlashAttribute("msg",msg);
			return "redirect:/index";
		}
		msg="회원수정에 실패하셨습니다.";
		ra.addFlashAttribute("msg",msg);
		return "redirect:/index";
	}
	
	
	
	
	
}
