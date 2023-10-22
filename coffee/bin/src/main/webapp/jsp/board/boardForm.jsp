<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />


<div align="center">	
	<h1>공지 사항</h1>		 
		<c:choose>
			<c:when test="${empty boards }">
				<h1>등록된 공지사항이 없습니다.</h1>
				<button type="button" onclick="location.href='boardWrite'">글쓰기</button>
			</c:when>
				
			<c:otherwise>
				<table border = 1>
					<tr>
						<th width = "100">No</th>
						<th width = "300">제목</th>
						<!--<th width = "150">작성자</th>-->
						<th width = "150">작성일</th>
						<th width = "100">조회수</th>
					</tr>
				
					<c:forEach var="board" items="${boards}">
						<tr>
							<td>${board.no }</td>
							<td onclick="location.href='boardContent?no=${board.no }'">
								${board.subject }
							</td>
							<%--  <td>${board.id }</td>  --%>
							<td>${board.reg_date }</td>
							<td>${board.hits }</td>
						</tr>
					</c:forEach>					
				</table>
				<button type="button" onclick="location.href='boardWrite'">글쓰기</button>
			</c:otherwise>
		</c:choose>
		
			<%--<button type="button" onclick="location.href='boardWrite'">글쓰기</button>--%>
			<!-- 세션 아이디에 따라 사용자는 글쓰기 안보여지고 관리자는 글쓰기 버튼 보여지도록 수정 예정-->

</div>
<c:import url="/footer" />