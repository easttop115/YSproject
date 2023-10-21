<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49c5e69d7e241bba1bfdd3678d06b7a6&libraries=services"></script>
<script src="/js/defalutMap.js"></script>
<script src="/areaMap.js"></script>
<style>
#map {
	width: 100%;
	height: 400px;
}
</style>


<div class="cont_box find01">
	<div class="map_search_wrap">
		<div class="map_search">
			<div class="cont_text_wrap map_search_tab_wrap">
				<div class="map_search_tab">
					<ul>
						<li class="check">매장찾기</li>
						<li>지역검색</li>
					</ul>
				</div>
			</div>
			<div class="cont_text_wrap map_search_box">
				<div class="cont_text_box map_search_title_wrap">
					<div class="cont_text cont_text_title">
						<b>매장찾기</b>
					</div>
					<div class="cont_text">함께하는 메가MGC커피</div>
					<div class="cont_text">
						<div class="input_text_wrap input_wrap2">
							<label> <input type="text" name="store_search"
								id="store_search" class="" placeholder="지점명 또는 주소를 입력하세요"
								required="required">
							</label>
							<div class="search_icon" id="search_map" onclick="search_map();">
								<div class="bar"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="cont_text_box">
					<div class="cont_list cont_list1 cont_list_small cont_list_small1">
						<ul id="store_search_list">
							<div class="store_search_list_none">검색어가 없습니다.</div>
						</ul>
					</div>
				</div>
			</div>
			<div class="cont_text_wrap map_search_box none">
				<div class="cont_text_box map_search_title_wrap">
					<div class="cont_text cont_text_title">
						<b>지역검색</b>
					</div>
					<div class="cont_text">함께하는 메가MGC커피</div>
				</div>
				<div class="cont_text_box">
					<div class="cont_list cont_list2 cont_list_small cont_list_small2">
						<ul id="store_area_search_list">
							<li data-store-area-name="서울">서울</li>
							<li data-store-area-name="경기">경기</li>
							<li data-store-area-name="인천">인천</li>
							<li data-store-area-name="강원">강원</li>
							<li data-store-area-name="광주">광주</li>
							<li data-store-area-name="대전">대전</li>
							<li data-store-area-name="대구">대구</li>
							<li data-store-area-name="부산">부산</li>
							<li data-store-area-name="울산">울산</li>
							<li data-store-area-name="세종">세종</li>
							<li data-store-area-name="경남">경남</li>
							<li data-store-area-name="경북">경북</li>
							<li data-store-area-name="전남">전남</li>
							<li data-store-area-name="전북">전북</li>
							<li data-store-area-name="충남">충남</li>
							<li data-store-area-name="충북">충북</li>
							<li data-store-area-name="제주">제주</li>
						</ul>
						<ul id="store_area_search_list_result">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="map" class="map"
		style="position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);">
		<div
			style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/closedhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/closedhand.cur.ico&quot;), move;">
			<div style="position: absolute; left: 882px; top: -606px;">
				<div style="position: absolute; z-index: 1; left: 0px; top: 0px;">
					<img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/101.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 635px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/102.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 891px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/100.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 379px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/100.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 379px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/101.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 635px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/102.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 891px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/99.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 123px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/99.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 123px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/98.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -133px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/98.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -133px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/97.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -389px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/97.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -389px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/96.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -645px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/97.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -389px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/98.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -133px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/99.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 123px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/100.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 379px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/101.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 635px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/102.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 891px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/96.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -645px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/96.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -645px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/246/95.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -901px; top: 964px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/247/95.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -901px; top: 708px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/248/95.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -901px; top: 452px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/95.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -901px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/96.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -645px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/97.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -389px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/98.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -133px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/99.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 123px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/100.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 379px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/101.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 635px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
						src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v16_260kk/6/245/102.png"
						alt="" role="presentation" draggable="false"
						style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 891px; top: 1220px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
				</div>
				<div style="position: absolute; z-index: 0; left: 0px; top: 0px;"></div>
				<div style="position: absolute; z-index: 1;"></div>
				<div
					style="position: absolute; z-index: 1; width: 1682px; height: 640px;"></div>
				<div style="position: absolute; z-index: 1;">
					<svg version="1.1"
						style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -3407px; top: -1168px; width: 8410px; height: 3200px;"
						viewBox="0 0 8410 3200">
							<defs></defs></svg>
				</div>
				<div
					style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2664px; top: 309px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2676px; top: 328px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2692px; top: 353px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2655px; top: 357px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2746px; top: 326px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2645px; top: 388px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2697px; top: 400px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2660px; top: 406px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2566px; top: 313px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2767px; top: 209px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2600px; top: 419px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2810px; top: 355px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2681px; top: 456px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2826px; top: 335px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2526px; top: 358px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2750px; top: 453px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2589px; top: 168px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2581px; top: 448px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2858px; top: 354px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
					<div
						style="position: absolute; margin: -49px 0px 0px -19px; z-index: 0; left: 2486px; top: 333px; display: none;">
						<img draggable="false"
							src="https://img.79plus.co.kr/megahp/common/img/map/marker.png"
							alt="" role="presentation" title=""
							style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 50px, 0px); top: 0px; left: 0px; width: 40px; height: 50px;">
					</div>
				</div>
			</div>
		</div>
		<div
			style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
			<div
				style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;">
				<div
					style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px;"></div>
				<div
					style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">500m</div>
			</div>
			<div style="margin: 0px 4px; float: left;">
				<a target="_blank" href="http://map.kakao.com/"
					title="Kakao 지도로 보시려면 클릭하세요."
					style="float: left; width: 32px; height: 10px;"><img
					src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png"
					alt="Kakao 지도로 이동"
					style="float: left; width: 32px; height: 10px; border: none;"></a>
				<div
					style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div>
			</div>
		</div>
		<div
			style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div>
	</div>
</div>

<c:import url="/footer" />
