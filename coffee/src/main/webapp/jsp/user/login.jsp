<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/header" />
<script src="/js/login.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script>
doNaverLogin() {
	  const url = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=dlbeL2y9gGM2hM7S0ME7' +
	      process.env.VUE_APP_NAVER_CLIENT_ID +
	      '&redirect_uri=http://localhost/index' +
	      process.env.VUE_APP_NAVER_REDIRECT_URL +
	      '&state=1234';

	  this.showSocialLoginPopup(url)
	},
</script>

<style>
td {
	background-color: white;
}
</style>
<div align="center">
	<h1>로그인</h1>
	<div>
		<font color="red">${msg}</font>
	</div>
	<div>
		<table>
			<tr>
				<td>
					<form action="loginProc" method="post" id="f">
						<input type="text" name="id" placeholder="아이디" id="id"><br>
						<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
						<input type="button" value="로그인" onclick="loginCheck()"> <input
							type="button" value="취소" onclick="location.href='/index'"><br>
					</form>
				</td>
			</tr>
			<!-- 
			카카오 이미지 링크
			https://developers.kakao.com/tool/demo/login/login?method=dynamic
		 -->
			<tr>
				<td>
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
							&client_id=22b2f2d535478bb557584b0a5d9c6465
							&redirect_uri=http://localhost/user/kakaoLogin">
						<img src="/img/bt_kakaoLogin.jpg" />
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code
						&client_id=dlbeL2y9gGM2hM7S0ME7
						&redirect_uri=http://localhost/user/naverLogin">
						<img src="/img/bt_naverLogin.png" style="width: 183px;height :45"/>
					</a>
				</td>
			<tr>
			<tr>
				<td>
					<a href="findId"><img src="/img/bt_search_id.gif"></a>
					<a href="findPw"><img src="/img/bt_search_pw.gif"></a>
					<a href="userSsn"><img src="/img/bt_join.gif"></a>
				</td>
			</tr>
			
		</table>
	</div>
</div>

<c:import url="/footer" />


