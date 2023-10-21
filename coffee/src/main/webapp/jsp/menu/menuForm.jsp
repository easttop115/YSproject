<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<div align="center">
	<h1>메뉴 목록</h1>
	<c:choose>
		<c:when test="${empty menu }">
			<h1>등록된 데이터가 존재하지 않습니다</h1>
			<tr>
				<td colspan="4"><button type="button"
						onclick="location.href='menuWrite'">메뉴 추가하기</button></td>
			</tr>
		</c:when>
		<c:otherwise>
			<table border=1>
				<tr>
					<th width="50">No.</th>
					<th width="250">메뉴 이름</th>
					<th width="100">메뉴 가격</th>
					<th width="100">작성 날짜</th>
				</tr>

				<c:forEach var="menu" items="${menu }">
					<tr>
						<td>${menu.no }</td>
						<td>${menu.menuName }</td>
						<td>${menu.menuPrice }</td>
						<td>${menu.menuDate }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><button type="button"
							onclick="location.href='menuWrite'">메뉴 추가하기</button></td>
				</tr>
				<tr>
					<td colspan="4">${result }</td>
				</tr>
				<tr>
					<td colspan="4"><button type="button"
							onclick="location.href='menuWrite'">메뉴 추가하기</button></td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</div>













