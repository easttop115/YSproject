<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/login.js"></script>
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
<!-- 우편번호찾기 -->
<div align="center">
	
<style>
	td{text-align:left;}
	th{text-align:left; width:150px;}
</style>	
<div align="center">
    <h1>내 정보 수정</h1>
    <font color="red">${msg }</font>
    <form action="userUpdateProc" method="post" id="f">
    	<input type="hidden" name ="no" id="no" value="${dto.no}">
        <table border="0">
            <tr>
                <th>
                    아이디
                </th>
                <td>
                	<input type="text" name="id" id="id"  value="${dto.id }" readonly >
                    ${dto.id }
                </td>
            </tr>
           
            <tr>
                <th>
                    새 비밀번호
                </th>
                <td>
                    <input type="password" name="pw" id="pw" placeholder="비밀번호" >
                </td>
            </tr>
            <tr>
                <th>
                    새 비밀번호 확인
                </th>
                <td>
                    <input type="password" name="confirm" id="confirm" placeholder="비밀번호 확인 "  onchange="pwCheck()" ><label id="label" ></label>
                </td>
            </tr>
            
            <tr>
                <th>
                    이름
                </th>
                <td>
                    <input type="text" name="userName" id="userName" value="${dto.userName}">
                </td>
            </tr>
            <tr>
                <th>
                    주소
                </th>
                <td>
                    <input type="text" name="postcode" id="postcode" value="${postcode}" placeholder="우편번호" readonly>
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
                </td>
            </tr>
            <tr>
            	<th>
            	</th>
           		<td>
           			<input type="text" name="address" id="address" value="${address}"placeholder="주소" readonly>
           		</td>
            </tr>
            <tr>
            	<th>
            	</th>
            	<td>
            		<input type="text" name="detailAddress" id="detailAddress" value="${detailAddress}"placeholder="상세주소">
            	</td>
            </tr>
            <tr>
                <th>
                    이메일
                </th>
                <td>
                    <input type="email" name="email" id="email" value="${dto.email}">
                </td>
            </tr>
            <tr>
                <th>
                    전화번호
                </th>
                <td>
                    <input type="tel" name="mobile"id="mobile"  value="${dto.mobile}">
                </td>
            </tr>
        </table>  
       	<input type="button" value="회원수정" onclick="allCheck()">
       	<input type="button" value="취소" onclick="location.href='index'">
       	<input type="button" value="회원탈퇴" onclick="location.href='delete'">
    </form>
    
</div>


<c:import url="/footer" />


















