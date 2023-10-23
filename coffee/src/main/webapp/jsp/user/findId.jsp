<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<script src="/js/login.js"></script>
<c:url var="context" value="/"/>


<div align="center">
	<hr color="#fdd000" width="500">
	<h2>아 이 디 찾 기</h2>
	<hr color="#fdd000" width="500">
	<form id="f" action="findIdProc" method="post">
		<table border="0" class="outline">
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="userName"  id="userName">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mobile" id="mobile" maxlength="11" oninput="numCheck(this)" placeholder="'-'제외한 숫자 11자리만 입력">
					<label id="label"></label><br></td>
				<td>
					<input type="button" value="인증번호전송" onClick="smsReq()">
				</td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" name="smsNumber" maxlength="6" placeholder="인증번호 6자리"  id="smsNumber" style="display: none;"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="조회" onclick="ssnCheck()">
					<input type="button" value="취소" onclick="location.href='/index'">
				</td>
			</tr>
		</table>
	</form>
	${msg}
</div>




<c:import url="/footer" />