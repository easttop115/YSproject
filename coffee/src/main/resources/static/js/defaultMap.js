//기본디폴트
var mapContainer = document.getElementById('map'),
	mapOption = {
		center: new kakao.maps.LatLng(37.5594867, 126.9227794),
		level: 5
	};
var map = new kakao.maps.Map(mapContainer, mapOption);
var imageSrc = "https://img.79plus.co.kr/megahp/common/img/map/marker.png";
var imageMySrc = "https://img.79plus.co.kr/megahp/common/img/map/marker_my.png";
//마커와 인포윈도우 배열
var markers = [];
function removeMaker() {
	var cnt = markers.length;
	for (i = 0; i < cnt; i++) {
		markers[i].setMap(null);
	}
};
var infowindows = [];
function removeInfowindow() {
	var cnt = infowindows.length;
	for (i = 0; i < cnt; i++) {
		infowindows[i].close();
	}
};
//지점위치기반
if (navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(function(position) {

		var lat = position.coords.latitude, // 위도
			lng = position.coords.longitude; // 경도

		var locPosition = new kakao.maps.LatLng(lat, lng);
		var marker = new kakao.maps.Marker({
			map: map,
			position: locPosition,
		});
		displayMarker(locPosition, lat, lng);
	});
};
store();
//지점검색
$("#store_search").keypress(function(e) {
	if (e.keyCode == 13) {
		search_map();
	}
});
function search_map() {
	var store_search = $("#store_search").val();
	$.ajax({
		url: "store_search.php",
		type: "GET",
		data: {
			"store_search": store_search
		},
		success: function(result) {
			$("#store_search_list").html(result);
			$(".map_search_wrap .cont_list").scrollTop(0);
		}
	});
}
//지점로드
function displayMarker(locPosition, lat, lng) {
	var imageSize = new kakao.maps.Size(40, 50);
	var markerImage = new kakao.maps.MarkerImage(imageMySrc, imageSize);
	var marker = new kakao.maps.Marker({
		map: map,
		position: locPosition,
		image: markerImage,
	});
	map.setCenter(locPosition);
	var marker_remove = true;
	var infowindow_remove = true;
	store(lat, lng, marker_remove, infowindow_remove);
};
//지점드래그
kakao.maps.event.addListener(map, 'dragend', function() {
	var latlng = map.getCenter();
	var lat = latlng.getLat();
	var lng = latlng.getLng();
	var marker_remove = true;
	var infowindow_remove = true;
	store(lat, lng, marker_remove, infowindow_remove);
});
//마커클릭
function makeOverListener(map, marker, infowindow) {
	return function() {
		removeInfowindow();
		infowindow.open(map, marker);
		infowindows.push(infowindow);
		return infowindow;
	};
}
//포지션이동
function panTo(move) {
	map.setLevel(3);
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch(move, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var lat = result[0].y;
			var lng = result[0].x;
			map.setCenter(coords);
			$.ajax({
				url: "store.php",
				type: "GET",
				dataType: "json",
				data: {
					"click_lat": lat,
					"click_lng": lng,
				},
				success: function(result) {
					var imageSize = new kakao.maps.Size(40, 50);
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					var latlng = map.getCenter();
					var lat = latlng.getLat();
					var lng = latlng.getLng();
					store(lat, lng);
					removeMaker();
					removeInfowindow();
					$.each(result.positions, function(index, value) {
						var marker = new kakao.maps.Marker({
							map: map,
							position: new kakao.maps.LatLng(result.positions[index].store_lat, result.positions[index].store_lng),
							image: markerImage,
						});
						var iwContent = '<div class="map_point_info_wrap">';
						iwContent += '	<div class="cont_text_box map_point_info">';
						iwContent += '		<div class="cont_text map_point_info_title_wrap">';
						iwContent += '			<div class="cont_text_title cont_text_inner"><b>' + result.positions[index].store_name2 + '</b></div>';
						iwContent += '			<div class="cont_text_info cont_text_inner">' + result.positions[index].store_address + '</div>';
						iwContent += '			<div class="cont_text_info cont_text_inner">' + result.positions[index].store_tel + '</div>';
						iwContent += '		</div>';
						iwContent += '		<div class="cont_text">';
						iwContent += '			<div class="map_point_info_list">';
						iwContent += '				<ul>';
						iwContent += '					<li class="' + result.positions[index].store_option1 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon01.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option2 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon02.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option3 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon03.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option4 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon04.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option5 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon05.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option6 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon06.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option7 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon07.gif">';
						iwContent += '					</li>';
						iwContent += '					<li class="' + result.positions[index].store_option8 + '">';
						iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon08.gif">';
						iwContent += '					</li>';
						iwContent += '				</ul>';
						iwContent += '			</div>';
						iwContent += '			<div class="cont_text">';
						iwContent += '				<div class="input_btn_wrap input_wrap1 modal_open modal_open_map" data-store-idx="' + result.positions[index].idx + '">';
						iwContent += '					<input type="button" value="자세히보기" class="btn btn1 btn_ani" id="">';
						iwContent += '				</div>';
						iwContent += '			</div>';
						iwContent += '		</div>';
						iwContent += '	</div>';
						iwContent += '</div>';
						var iwRemoveable = true;
						var infowindow = new kakao.maps.InfoWindow({
							content: iwContent,
							removable: iwRemoveable
						});
						kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

						infowindow.open(map, marker);
						infowindows.push(infowindow);
						markers.push(marker);
						return infowindow;
						return marker;
					});
					infowindowindex();

					if (move == '서울 중구 만리재로 175 (만리동2가)') {
						var moveLatLon = new kakao.maps.LatLng(37.552241, 126.962690);
						map.panTo(moveLatLon);
					}
					if (move == '서울 서대문구 홍은동 464') {
						var moveLatLon = new kakao.maps.LatLng(37.5919904, 126.9413969);
						map.panTo(moveLatLon);
					}
					if (move == '경기 고양시 덕양구 도래울로 16 (도내동, 도래울파크뷰(PARK VIEW))') {
						var moveLatLon = new kakao.maps.LatLng(37.628545, 126.868486);
						map.panTo(moveLatLon);
					}
					if (move == '대구 달성군 구지면 과학마을로3길 14 (응암리, 대구국가산단 반도유보라 아이비파크)') {
						var moveLatLon = new kakao.maps.LatLng(35.656111, 128.419260);
						map.panTo(moveLatLon);
					}
					if (move == '경기 고양시 일산서구 고양대로 666 (일산동, e편한세상 일산 어반스카이)') {
						var moveLatLon = new kakao.maps.LatLng(37.684236, 126.769691);
						map.panTo(moveLatLon);
					}
					if (move == '대전 유성구 엑스포로151번길 19 (도룡동, 도룡 하우스디)') {
						var moveLatLon = new kakao.maps.LatLng(36.3759561852176, 127.39459113718982);
						map.panTo(moveLatLon);
					}
					if (move == '광주 서구 매월2로15번길 16 (매월동, 매월 종합상가)') {
						var moveLatLon = new kakao.maps.LatLng(35.117279849557065, 126.8605604134319);
						map.panTo(moveLatLon);
					}
				}
			});
		}
	});
	var offset = $(".find_wrap .find01 #map").offset();
	$("html, body").animate({ scrollTop: offset.top - 100 }, 400);
}
function panToSigungu(move) {
	map.setLevel(8);
	var latlng = map.getCenter();
	var lat = latlng.getLat();
	var lng = latlng.getLng();
	var marker_remove = true;
	var infowindow_remove = true;
	store(lat, lng, marker_remove, infowindow_remove);

	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch(move, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var lat = result[0].y;
			var lng = result[0].x;
			map.setCenter(coords);
		}
	});
	var offset = $(".find_wrap .find01 #map").offset();
	$("html, body").animate({ scrollTop: offset.top - 100 }, 400);
}
function store(lat, lng, marker_remove, infowindow_remove) {
	$.ajax({
		url: "store.php",
		type: "GET",
		dataType: "json",
		data: {
			"lat": lat,
			"lng": lng,
		},
		success: function(result) {
			if (marker_remove) {
				removeMaker();
			}
			if (infowindow_remove) {
				removeInfowindow();
			}
			$.each(result.positions, function(index, value) {
				var imageSize = new kakao.maps.Size(40, 50);
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
				var marker = new kakao.maps.Marker({
					map: map,
					position: new kakao.maps.LatLng(result.positions[index].store_lat, result.positions[index].store_lng),
					image: markerImage,
				});
				var iwContent = '<div class="map_point_info_wrap">';
				iwContent += '	<div class="cont_text_box map_point_info">';
				iwContent += '		<div class="cont_text map_point_info_title_wrap">';
				iwContent += '			<div class="cont_text_title cont_text_inner"><b>' + result.positions[index].store_name2 + '</b></div>';
				iwContent += '			<div class="cont_text_info cont_text_inner">' + result.positions[index].store_address + '</div>';
				iwContent += '			<div class="cont_text_info cont_text_inner">' + result.positions[index].store_tel + '</div>';
				iwContent += '		</div>';
				iwContent += '		<div class="cont_text">';
				iwContent += '			<div class="map_point_info_list">';
				iwContent += '				<ul>';
				iwContent += '					<li class="' + result.positions[index].store_option1 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon01.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option2 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon02.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option3 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon03.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option4 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon04.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option5 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon05.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option6 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon06.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option7 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon07.gif">';
				iwContent += '					</li>';
				iwContent += '					<li class="' + result.positions[index].store_option8 + '">';
				iwContent += '						<img src="https://img.79plus.co.kr/megahp/common/img/map/map_icon08.gif">';
				iwContent += '					</li>';
				iwContent += '				</ul>';
				iwContent += '			</div>';
				iwContent += '			<div class="cont_text">';
				iwContent += '				<div class="input_btn_wrap input_wrap1 modal_open modal_open_map" data-store-idx="' + result.positions[index].idx + '">';
				iwContent += '					<input type="button" value="자세히보기" class="btn btn1 btn_ani" id="">';
				iwContent += '				</div>';
				iwContent += '			</div>';
				iwContent += '		</div>';
				iwContent += '	</div>';
				iwContent += '</div>';
				var iwRemoveable = true;
				var infowindow = new kakao.maps.InfoWindow({
					content: iwContent,
					removable: iwRemoveable
				});
				kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

				markers.push(marker);
				return marker;
			});
		}
	});
};
function infowindowindex() {
	$(".map_point_info_wrap").parent("div").parent("div").css('z-index', '10');
}