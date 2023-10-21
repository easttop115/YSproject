$(document).ready(function() {
	// 메뉴 항목에 마우스 호버 이벤트를 추가합니다.
	$(".head_wrap .head .head_menu > ul > li").hover(function() {
		// 현재 메뉴 아이템에 클래스 "check"를 추가합니다.
		$(this).addClass("check");
		// 해당 메뉴 아이템의 하위 드롭다운 메뉴를 보여줍니다.
		$(this).find(".head_menu_down_menu").show();

		// head_wrap의 높이를 조절합니다.
		/*var menuHeight = $(".head_wrap .head .head_menu").height();
		$(".head_wrap").css("height", menuHeight + "px");*/
	}, function() {
		// 마우스가 벗어날 때 클래스 "check"를 제거합니다.
		$(this).removeClass("check");
		// 모든 드롭다운 메뉴를 숨깁니다.
		$(".head_menu_down_menu").hide();

		/*// head_wrap의 높이를 초기 높이로 복원합니다.
		$(".head_wrap").css("height", "100px");*/
	});

	// 헤더 영역에 마우스 호버 이벤트를 추가합니다.
	$(".head_wrap").hover(function() {
		// 헤더에 클래스 "head_over"를 추가합니다.
		$(this).addClass("head_over");
	}, function() {
		// 헤더에서 마우스가 벗어날 때 클래스 "head_over"를 제거하고 드롭다운 메뉴를 숨깁니다.
		$(this).removeClass("head_over");
		$(".head_wrap .head .head_menu > ul > li").removeClass("check");
		$(".head_menu_down_menu").hide();

		// head_wrap의 높이를 초기 높이로 복원합니다.
		$(".head_wrap").css("height", "100px");
	});
});