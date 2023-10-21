function allCheck() {
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('userName');
	var postcode = document.getElementById('postcode').value;
	var address_tmp = document.getElementById('address').value;
	var detailAddress = document.getElementById('detailAddress').value;


	var address = postcode + '//' + address_tmp + '//' + detailAddress;
	if (id.value == "") {
		alert('아이디는 필수 항목입니다.');
	} else if (pw.value == "") {
		alert('비밀번호는 필수 항목입니다.');
	} else if (confirm.value == "") {
		alert('비밀번호 확인은 필수 항목입니다.');
	} else if (userName.value == "") {
		alert('이름은 필수 항목입니다.');
	} else {
		document.getElementById('address').value = address;
		var f = document.getElementById('f');
		f.submit();
	}
}

function ssnCheck() {
	let userName = document.getElementById('userName');
	let mobile = document.getElementById('mobile');


	if (userName.value == "") {
		alert('이름을 입력 하세요.')
	} else if (mobile.value == 0) {
		alert('전화번호를 입력 하세요.')
	} else {
		alert('회원가입 페이지로 이동합니다.')
		var f = document.getElementById('f');
		f.submit();
	}
}

function pwCheck() {
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	label = document.getElementById('label');
	if (pw.value == confirm.value) {
		label.style.color = "blue";
		label.innerHTML = '일치'
	} else {
		label.style.color = "red"
		label.innerHTML = '불일치'
	}
	// window.alert('pwCheck 호출')
}

let prevValue = "";

function numCheck(input) {
	var label = document.getElementById("label");
	var currentValue = input.value;

	if (!/^\d+$/.test(currentValue)) {
		label.style.color = "red";
		label.innerHTML = "숫자만 입력";
		input.value = prevValue; // 최근 입력값만 유지
	} else {
		label.innerHTML = "";
		prevValue = currentValue; // 유효한 입력값일 경우 이전 값을 업데이트
	}
}


function loginCheck() {
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');

	if (id.value == "") {
		alert('아이디는 필수 항목입니다.');
	} else if (pw.value == "") {
		alert('비밀번호는 필수 항목입니다.');
	} else {
		var f = document.getElementById('f');
		f.submit();
	}
}

var xhr; 
function idCheck() {
	xhr= new XMLHttpRequest();
	var id = document.getElementById('id').value;
	xhr.open('post', 'idCheck');
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.send(id);
	xhr.onreadystatechange = resProc;
}

function resProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		var response = xhr.responseText;

		if (response === '존재하는 ID 입니다.') {
			// 중복된 아이디인 경우 테두리를 빨간색으로 변경
			document.getElementById('id').style.borderColor = 'red';
		} else {
			// 중복되지 않은 아이디인 경우 테두리 스타일을 초기화 (예를 들어, 검정색)
			document.getElementById('id').style.borderColor = 'blue';
		}
	} else {
		// 오류 처리
		alert('요청 중 오류가 발생했습니다.');
	}
}
