package com.care.coffee.user;

import java.io.BufferedWriter;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class KakaoService {
	@Autowired UserMapper dao;
	private String accessToken; // OAuth 2.0 인증 코드 획득 프로세스를 통해 얻은 액세스 토큰입니다.(사용자 정보)
	
	/*
	 	카카오 개발자 센터 문서
	 	https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-token
	*/
	public void getAccessToken(String code) {//accessToken 가져오기
		
		String reqUrl ="https://kauth.kakao.com/oauth/token";  					//카카오서버 URL
		String reqParam = "grant_type=authorization_code";						//권한
		reqParam += "&client_id=22b2f2d535478bb557584b0a5d9c6465";				//clientID
		reqParam +=	"&redirect_uri=http://localhost/user/kakaoLogin";	
		reqParam += "&code="+code;
		
		try {
			//URL 객체 생성
			URL url = new URL(reqUrl); //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			
			//url을 연결하기 위한 객체(HttpsURLConnection) 생성 (HTTPS 연결)
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			//url.openConnection()메서드는 URL객체로부터 URLConnection 객체를 반환하게 된다.
			//그러므로 URLConnection객체를 HttpsURLConnection객체로 형변환을 해줘야 한다.(다운캐스팅
			
			conn.setRequestMethod("POST"); //POST요청을 위해 기본값 false에서 setDoOutput을 true로 변경
			conn.setDoOutput(true); // POST 메소드를 이용해서 데이터를 전달하기 위한 설정
			
			//BufferedWriter로 변환해서 사용한다. 속도개선
			//OutPutStream을 통해 문자열로 처리할 수 있는
			//BufferdWriter로 변환해서 사용한다.
			BufferedWriter bw = new BufferedWriter(
					new OutputStreamWriter(conn.getOutputStream())
					);
			bw.write(reqParam); //실제 데이터 를 BufferedWriter에 작성
			bw.flush(); // 전송 후 스트림 종료
			//-------------------------------------------------------------------------------------
			//요청을 통해 얻은 JSON 타입의 Response 메세지 읽어오기
			//받아온 데이터 문자열 데이터로 가공 작업
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			
			
			//https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind
			//dependency 추가 하기(pom.xml)
			ObjectMapper om = new ObjectMapper();
			
			//JSON형식의 응답 데이터를 Map으로 형변환 하는 목적
			Map<String,String> map = om.readValue(isr, new TypeReference<Map<String,String>>() {});
			accessToken= map.get("access_token");
			
			System.out.println("accessToken : "+ map.get("access_token"));  //토큰 값
			System.out.println(map);
			
			/*
			 	{access_token=s0y7orZk879Cl1V9gCVYa7EeVGqP-r5zPvYkwweiCisMqAAAAYsDvRcA, 
			 	token_type=bearer, 
			 	refresh_token=4BeRH6y0nP-0o-9KlPiP141_oNu_AY-JqfVeQ1dvCisMqAAAAYsDvRb-, 
			 	expires_in=21599, 
			 	scope=profile_image profile_nickname, 
			 	refresh_token_expires_in=5183999}
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Autowired private HttpSession session;
	public void getUserInfo() { //사용자 정보 가져오기
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		
		//	Authorization: Bearer ${ACCESS_TOKEN}
		
			try {
				URL url = new URL(reqUrl); 
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer "+accessToken);
				
				int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
				System.out.println("responseCode : " + responseCode);
				
				ObjectMapper om = new ObjectMapper();
				JsonNode jsonNode = om.readTree(conn.getInputStream());
				//System.out.println(jsonNode.get("kakao_account"));
				System.out.println(jsonNode.get("kakao_account").get("profile").get("nickname"));
				String id = jsonNode.get("id").toString();//초기회원가입 ID;
				System.out.println(id);
				String loginType = "kakao";
				int res = dao.snsLogCheck(id,loginType);
				if(res>0) {
					session.setAttribute("id", jsonNode.get("kakao_account").get("profile").get("nickname").asText());
					session.setAttribute("loginType", loginType);
				}else {
					SnsUserDTO dto = new SnsUserDTO();
					dto.setId(id);
					dto.setLoginType(loginType);
				dao.snsRegist(dto);
				session.setAttribute("id", jsonNode.get("kakao_account").get("profile").get("nickname").asText());
				session.setAttribute("loginType", loginType);
				}
				//계층적으로 데이터 get하기 .get().get().get(); 
				/*
			 	{"id":3052555346,
			 	"connected_at":"2023-10-06T06:44:46Z",
			 	"properties":{"nickname":"DAS",
				 				"profile_image":"http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg",
				 				"thumbnail_image":"http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg"
				 },
				 "kakao_account":{"profile_nickname_needs_agreement":false,"profile_image_needs_agreement":false,
				 					"profile":{"nickname":"DAS",
						 			"thumbnail_image_url":"http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg",
						 			"profile_image_url":"http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg",
						 			"is_default_image":true},
						 			"has_email":true,
						 			"email_needs_agreement":true,
						 			"has_age_range":false,
						 			"age_range_needs_agreement":false,
						 			"has_birthday":false,
						 			"birthday_needs_agreement":false,
						 			"has_gender":false,
						 			"gender_needs_agreement":false
					}
			 	}

			*/
		
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}
	public void unlink() {
		String reqUrl = "https://kapi.kakao.com/v1/user/unlink";
		
		try {
			URL url = new URL(reqUrl); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
			 
			//하위 코드는 확인용-------------------------------------------------------
			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);

			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());
			System.out.println(jsonNode.get("id"));
			//-------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
