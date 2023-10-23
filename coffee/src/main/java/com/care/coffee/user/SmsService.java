package com.care.coffee.user;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SmsService {
	
	public int smsService(String mobile,String numStr) {
    String api_key = "NCSKKYQWMDVMJRNW"; //coolsms - api key 키 발급
    String api_secret = "B5QHL7SJ0BOXICI6JBPPAD3GTHRUFT8O"; //coolsms - api secret  키 발급
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
   
    params.put("to", mobile);    		// 수신전화번호
    params.put("from", "01049976200");   	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
    params.put("type", "SMS");
    params.put("text", "메가커피 휴대폰인증 테스트 메시지 : 인증번호는" + "["+numStr+"]" + "입니다.");
    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        
	        System.out.println(obj.toString());
	        return 1;
	    } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	    }
		return 0;

	}

	
}
	
	
