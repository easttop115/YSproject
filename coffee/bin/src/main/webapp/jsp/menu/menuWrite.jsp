<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<div align="center">
	<form action="menuWriteProc" method='post' enctype="multipart/form-data">
		<table>
			<caption>
				<font size="5"><b>메뉴 등록</b></font>
			</caption>
			<tr>
				<th width="100px">카테고리</th>
				<td><select name="category">
						<option value="new">NEW</option>
						<option value="bes">BEST</option>
						<option value="cof">COFFEE</option>
						<option value="bak">BAKERY</option>
				</select></td>
			<tr>
				<th width="100px">메뉴 이름</th>
				<td><input style="width: 100%;" type="text" name="menuName"></td>
			</tr>
			<tr>
				<th width="100px">메뉴 가격</th>
				<td><input style="width: 100%;" type="text" name="menuPrice"></td>
			</tr>
			<tr>
				<th>메뉴 설명</th>
				<td>
				<textarea style="width: 100%; resize: none" rows="10"
						cols="30" name="menuContent"></textarea>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='menuForm'">
					<input type="reset" value="취소" onclick="location.href='totalMenu'">
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="/footer" />