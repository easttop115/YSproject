<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<title>메가커피 프로젝트</title>

<link rel="stylesheet" type="text/css" href="/css/head.css">
<link rel="stylesheet" type="text/css" href="/css/cont.css">
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@900&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;900&amp;display=swap">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/head.js"> </script>

</head>
<body>
	<c:url var="context" value="/"/>
	<div class="head_wrap">
		<div class="head">
			<div class="head_logo">
				<a href="${context }index"> <img src="${context }img/logo_1.png"
					class="head_logo_img_fixed"></a>
			</div>
		</div>
		<div class="head">
			<div class="head_menu_wrap">
				<div class="head_menu">
					<ul>
						<li>
							<c:choose>
								<c:when test="${empty sessionScope.id}">
									<li>
										<a class="pc" href="${context }user/login">Login</a>
									</li>
								</c:when>
								<c:when test="${sessionScope.id eq 'admin'}">
									<a class="pc" href="${context }user/userList">회원관리</a>
									<div class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
										<ul>
											<li><a href="${context }logout"> Logout </a></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<li><a class="pc" href="${context }logout">Logout</a></li>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<a href="${context }menu/totalMenu" class="pc"> MENU </a>
							<div class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
								<ul>
									<li><a href="${context }menu/newMenu"> NEW </a></li>
									<li><a href="${context }menu/bestMenu"> BEST </a></li>
									<li><a href="${context }menu/coffee"> COFFEE </a></li>
									<li><a href="${context }menu/bakery"> BAKERY </a></li>
									<li><a href="${context }menu/menuWrite"> MENU WRITE</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="${context }store/spot" class="pc"> STORE </a>
							<div class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
								<ul>
									<li><a href="${context }store/spot"> 매장위치 </a></li>
								</ul>
							</div>
						</li>
						<li><a href="${context }board/boardForm" class="pc"> NEWS </a>
							<div class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
								<ul>
									<li><a href="${context }board/boardForm"> 공지사항 </a></li>
									<li><a href="${context }event/eventForm"> 이벤트 </a></li>
									<li><a href="bbs/?bbs_category=4"> FAQ </a></li>
									<li><a href="news/voc/"> 고객의 소리 </a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="head">
			<div class="head_sns_menu">
				<div class="cont_list cont_list_small">
					<ul>
						<li>
							<a href="https://blog.naver.com/ekddusekddus" target="_blank"> 
								<img src="https://img.79plus.co.kr/megahp/common/img/sns/sns_blog.png">
							</a>
						</li>
						<li>
							<a href="https://www.facebook.com/mega.mgc.coffee.official" target="_blank"> 
								<img src="https://img.79plus.co.kr/megahp/common/img/sns/sns_facebook.png">
							</a>
						</li>
						<li>
							<a href="https://www.instagram.com/mega.mgc.coffee_official/" target="_blank">
								<img src="https://img.79plus.co.kr/megahp/common/img/sns/sns_instagram.png">
							</a>
						</li>	
					</ul>
					<ul>					
						<c:choose>		
							<c:when test="${empty sessionScope.id}">
								<li></li>
							</c:when>
							<c:otherwise>
								<li style="text-align: center;border:0;padding-top:5px;">
									<a href="/user/myPage">마이페이지</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
					
				</div>
			</div>
		</div>
	</div>