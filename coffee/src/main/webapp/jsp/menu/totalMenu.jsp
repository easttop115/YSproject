<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
</style>

<div style="padding: inherit; padding: 0; margin: 0;">


	<div class="main">
		<div class="box">
			<div class="title">
				<div class="sub1" style="padding: 10px">

					<h5>MEGA MENU</h5>
				</div>
				<div class="sub2" style="padding: 10px">
					<h1>ALL MENU</h1>
				</div>
			</div>
		</div>
		<div class="subbox">
			<div class="subtitle">
				<div class="sub3" style="padding: 10px">
					깊고 부드러운 커피 맛의 비밀<br> 행복을 선사하는 다양한 음료
				</div>
			</div>
		</div>
		<div class="allmenu">
			<div class="subbox2">
				<div class="subtitle_menu">
					<div class="sub4" style="padding: 30px">
						<h5>메가 커피의 엄선된 메뉴</h5>
						<br>
						<div class="sub5" style="padding: 10px"></div>
						<h1>MEGA MENU</h1>
						<c:choose>
							<c:when test="${empty menus }">
								<h1>등록된 메뉴가 없습니다.</h1>
								<button type="button" onclick="location.href='menuWrite'">메뉴작성</button>
							</c:when>

							<c:otherwise>
								<table border=1>
									<tr>
										<!--<th width = "150">작성자</th>-->
										<th width="100">제품명</th>
										<th width="100">가격</th>
										<th width="100">제품설명</th>
									</tr>

									<c:forEach var="menu" items="${menus}">
										<tr>
											<td>${menu.menuName }</td>
											<%--<td onclick="location.href='boardContent?no=${menu.no }'"> --%>
											<td>${menu.menuPrice }</td>
											<td>${menu.menuContent }</td>
											
										</tr>
									</c:forEach>
								</table>
								<button type="button" onclick="location.href='menuWrite'">메뉴작성</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>

<c:import url="/footer" />











