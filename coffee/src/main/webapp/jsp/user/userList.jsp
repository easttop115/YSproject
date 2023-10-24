<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
	<div align="center">
		<font color="red">${msg}</font>
		<h1>회원 목록</h1>

		<c:choose>
			<c:when test="${empty members }">
				<h1> 등록된 회원이 존재하지 않습니다. </h1>
			</c:when>
			<c:otherwise>
				<table border=1>
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>E-Mail</th>
							<th>주소</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${dto }">
							<tr>
								<td>${member.id }</td>
								<td>${member.userName }</td>
								<td>${member.mobile }</td>
								<td>${member.email }</td>
								<td>${member.address }</td>
								<td>${member.reg_Date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div> ${result}	</div>
				
				<form action="userList">
					<select name="select">
						<c:choose>
							<c:when test="${select=='id'}">
								<option value="">전체</option>
								<option value="id" selected="selected">아이디</option>
								<option value="mobile">전화번호</option>
							</c:when>
							<c:when test="${select=='mobile'}">
								<option value="">전체</option>
								<option value="id">아이디</option>
								<option value="mobile" selected="selected">전화번호</option>
							</c:when>
							<c:otherwise>
								<option value="" selected="selected">전체</option>
								<option value="id">아이디</option>
								<option value="mobile">전화번호</option>
							</c:otherwise>
						</c:choose>
					</select>
					
					<input type="text" name="search" />
					<input type="submit" value="검색" />			
				</form>
		</c:otherwise>
	</c:choose>
	</div>
<c:import url="/footer" />