<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script src="/js/login.js"> </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/user.js"> </script>
<c:import url="/header" />

<div align="center">
	<h1>회원 등록</h1>
	<table >
		<tr>
			<td>
				<form action="registProc" method="post" id="f">
					<input type="text" name="id" id="id" placeholder="아이디" > <font color="red">*</font>
					<input type="button" onClick="idCheck()" value="중복확인"></input> <br>
					<input type="password" name="pw" id="pw" placeholder="비밀번호" ><br>
					<input type="password" name="confirm" id="confirm" placeholder="비밀번호 확인 "  onchange="pwCheck()">
					<label id="label" ></label><br>
					<input type="text" name="userName" id="userName" placeholder="이름" value="${dto.userName}" readonly><br>
					<!-- 다음 api 따옴 -->
					<input type="text" name="email" id="email" placeholder="email"><br>
					<input type="text" name="nickName" id="nickName" placeholder="닉네임"><br>
					<input type="text" name="postcode" id="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="address" placeholder="주소"><br>
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"><br>
					
					<input type="hidden" name="mobile" value="${dto.mobile }"> <br>
					
					
					<input type="button" value="회원가입" onclick="allCheck()">
					<input type="button" value="취소" onclick="location.href='index'"><br>
				</form>
			</td>
		</tr>
	</table>
</div>
<c:import url="/footer" />




