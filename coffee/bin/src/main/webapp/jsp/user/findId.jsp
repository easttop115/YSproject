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
	<form id="f" action="idProc" method="post">
		<table border="0" class="outline">
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="userName" class="box" id="userName">
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="ssn1" id="ssn1" class="box" maxlength="6"> - 
					<input type="password" name="ssn2" id="ssn2" class="box" maxlength="7">
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
</div>




<c:import url="/footer" />