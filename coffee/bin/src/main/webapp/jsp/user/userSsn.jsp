<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<script src="/js/login.js"></script>
<c:url var="context" value="/"/>
<link rel="stylesheet" type="text/css" href="/css/user.css">
<div align="center">
	<hr color="#fdd000" width="500">
	<h2>본 인 인 증</h2>
	<hr color="#fdd000" width="500">
	<form id="f" action="/user/regist" method="post">
		<table border="0" class="outline">
			<tr>
				<th>성명</th>
				<td><input type="text" name="userName" class="box" id="userName"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="mobile" id="mobile" class="box" maxlength="11" oninput="numCheck(this)" placeholder="'-'제외한 숫자 11자리만 입력">	
					<label id="label" ></label><br>			
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="조회" onclick="ssnCheck()">
					<input type="button" value="취소" onclick="location.href='${context}index'">
				</td>
			</tr>
		</table>
	</form>
	${msg}
</div>
<c:import url="/footer" />