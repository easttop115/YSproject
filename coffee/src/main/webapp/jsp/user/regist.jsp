<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/login.js"> </script>
<script type="text/javascript">
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
           

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>

<c:import url="/header" />

<div align="center">
	<h1>회원 등록</h1>
	<table >
		<tr>
			<td>
				<form action="registProc" method="post" id="f">
					<input type="text" name="id" id="id" placeholder="아이디" > <font color="red">*</font>
					<input type="button" onClick="idCheck()" value="중복확인"></input> <label id="checkres" ></label><br>
					<input type="password" name="pw" id="pw" placeholder="비밀번호" ><br>
					<input type="password" name="confirm" id="confirm" placeholder="비밀번호 확인 "  onchange="pwCheck()">
					<label id="label" ></label><br>
					<input type="text" name="userName" id="userName" placeholder="이름" value="${dto.userName}" readonly><br>
					<!-- 다음 api 따옴 -->
					<input type="text" name="email" id="email" placeholder="email"><br>
					<input type="text" name="nickName" id="nickName" placeholder="닉네임"><br>
					<input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="address" placeholder="주소" readonly><br>
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"><br>
					
					<input type="hidden" name="mobile" value="${dto.mobile }"> <br>
					
					
					<input type="button" value="회원가입" onclick="allCheck()">
					<input type="button" value="취소" onclick="location.href='index'"><br>
				</form>
			</td>
		</tr>
	</table>
</div>
<c:import url="/footer" />




