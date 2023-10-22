<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<div align="center">

<form action="eventModifyProc" method="post">
	<input type="hidden" name="no" value="${board.no }" />
	<h1>이벤트 수정</h1>
	<table border='1'>
		<tr>
			<th width="100">작성자</th>
			<td width="200">${board.id }</td>
			<th width="100">조회수</th>
			<td width="200">${board.hits }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.reg_date }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input style="width:100%;" type="text" name="subject" value="${board.subject }" />
			</td>
		</tr>
		<tr>
			<th>문서내용 수정</th>
			<td colspan="3">
				<textarea rows="10" cols="30" style="width:100%" name="content">${board.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" onclick="location.href='eventForm'">목록</button>
				<input type="submit" value="수정">
				<button type="button" onclick="history.back()">이전</button> 
			</td>
		</tr>
	</table>
</form>
</div>
<c:import url="/footer" />