$(document).on("click", "#store_area_search_list_result .store_area_search_list", function() {
	var sigungu = $(this).data("sigungu");
	$.ajax({
		url: "store.php?sigungu=" + sigungu,
		type: "POST",
		dataType: "json",
		data: {
			"sigungu": sigungu,
		},
		success: function(result) {
			removeMaker();
			removeInfowindow();
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
});
$(document).on("click", ".map_search_tab_wrap .map_search_tab ul li", function() {
	$(".map_search_tab_wrap .map_search_tab ul li").removeClass("check");
	$(this).addClass("check");

	var box_idx = $(this).index();
	$(".map_search_box").addClass("none");
	$(".map_search_box").eq(box_idx).removeClass("none");
});
$(document).on("click", "#store_area_search_list li", function() {
	var store_area_name = $(this).data("store-area-name");
	$.ajax({
		url: "store_area_search.php?store_area_name=" + store_area_name,
		type: "GET",
		success: function(result) {
			$("#store_area_search_list").addClass("none");
			$("#store_area_search_list_result").removeClass("none").html(result);
			$(".map_search_wrap .cont_list").scrollTop(0);
		}
	});
});
$(document).on("click", "#store_area_search_back", function() {
	$("#store_area_search_list").removeClass("none");
	$("#store_area_search_list_result").addClass("none").html("");
	$(".map_search_wrap .cont_list").scrollTop(0);
});