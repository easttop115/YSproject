<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script src="/js/login.js"></script>
<div align="center">
	
<style>
	td{text-align:center;}
	th{text-align:left; width:100px;}
</style>	
<div align="center">
	
	<h1>내 정보</h1>
	<table border="0">
		<tr>
			<th>
				아이디
			</th>
			<td>
				${dto.id }
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				${dto.pw }
			</td>
		</tr>
		<tr>
			<th>
				이름
			</th>
			<td>
				${dto.userName }
			</td>
		</tr>
		<tr>
			<th>
				주소
			</th>
			<td>
				${dto.address }
			</td>
		</tr>
		<tr>
			<th>
				이메일 
			</th>
			<td text-align="right">
				${dto.email }
			</td>
		</tr>
		<tr>
			<th>
				전화번호 
			</th>
			<td>
				 0${dto.mobile }
			</td>
		</tr>
	</table>
		<button type="button" onclick="location.href='userUpdate?no=${dto.no}'">정보수정</button>
		<button type="button" onclick="location.href='delete'">탈퇴하기</button>
</div>	

<c:import url="/footer" />


















