<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<div align="center">
	<form action="boardWriteProc" method='post'
		enctype="multipart/form-data">
		<table>
			<caption>
				<font size="5"><b>게시글 등록</b></font> <br><br>
				<font color="red">${msg}</font>
			</caption>

			<th width="100px">제목</th>
				<td><input style="width: 100%;" type="text" name="subject" value="${board.subject}" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea style="width: 100%; resize: none" rows="10"
						cols="30" name="content" value="${board.content}"></textarea>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='boardForm'">
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="/footer" />