var xhr;

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

function userUpadate(){
	
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


function idCheck() {

	xhr = new XMLHttpRequest();
	var id = document.getElementById('id').value;

	//데이터를 객체로 감싸서 준비
	//JSON 타입이라서 JSON 형식으로 보내야하는 것 같음 아님 말구
	//var data = { id: id };

	//주소를 풀네임으로 정확하게 입력해봄, 200 떨어지는거 확인
	//사실 이 문제일 가능성이 제일 높음
	xhr.open('POST', '/idCheck', true);
	xhr.setRequestHeader('Content-Type', 'text/plain;charset=UTF-8');

	//한 번에 보기 편하게 메서드 실행
	xhr.onreadystatechange = function() {
		//어떻게 들어오는지 확인하기 위해서 콘솔 찍어봄
		//readyState 2, 3, 4 단계 별로 3번 찍힘 (알럿창 3번 찍힌 이유)
		//readyState 값 2: 이 단계에서는 서버와의 연결이 수립
		//readyState 값 3: 이 단계에서는 서버로부터 응답 데이터의 일부가 수신
		//readyState 값 4: 이 단계에서는 요청이 완료
		console.log(xhr);
		console.log(xhr.readyState);
		console.log(xhr.status);

		//요청이 완료되고 응답이 정상인 경우
		if (xhr.readyState === 4 && xhr.status === 200) {
			var response = xhr.responseText;

			//응답값 확인
			console.log(response);
			if (response === '존재하는 ID') {
				// 중복된 아이디인 경우 테두리를 빨간색으로 변경
				document.getElementById('id').style.borderColor = 'red';
				document.getElementById('checkres').innerHTML = '존재하는 ID';
				document.getElementById('checkres').style.color = 'red';
			} else {
				// 중복되지 않은 아이디인 경우 테두리 스타일을 초기화 (예를 들어, 검정색)
				document.getElementById('id').style.borderColor = 'blue';
				document.getElementById('checkres').innerHTML = '사용가능한 ID';
				document.getElementById('checkres').style.color = 'blue';
			}
		}
	}
	xhr.send(id); 
}
function smsReq(){
	xhr = new XMLHttpRequest();
	var mobile = document.getElementById('mobile').value;
	xhr.open('POST', '/smsCheck', true);
	xhr.setRequestHeader('Content-Type', 'text/plain;charset=UTF-8');
	//한 번에 보기 편하게 메서드 실행
	xhr.onreadystatechange = function() {
		//어떻게 들어오는지 확인하기 위해서 콘솔 찍어봄
		//readyState 2, 3, 4 단계 별로 3번 찍힘 (알럿창 3번 찍힌 이유)
		//readyState 값 2: 이 단계에서는 서버와의 연결이 수립
		//readyState 값 3: 이 단계에서는 서버로부터 응답 데이터의 일부가 수신
		//readyState 값 4: 이 단계에서는 요청이 완료
		console.log(xhr);
		console.log(xhr.readyState);
		console.log(xhr.status);

		//요청이 완료되고 응답이 정상인 경우
		if (xhr.readyState === 4 && xhr.status === 200) {
			var response = xhr.responseText;
            console.log(response);
            if (response === '문자 전송 실패') {
                 // 서버로부터 인증 실패 메시지를 받았을 때의 처리
                 alert('인증 번호 전송이 실패되었습니다.');

                 
            } else {
                 // 서버로부터 인증 실패 메시지를 받았을 때의 처리
                 alert('인증 번호가 전송 되었습니다.');
                 // 사용자에게 인증 번호 입력 창을 표시하거나 활성화
                 var smsNumber = document.getElementById('smsNumber');
                smsNumber.style.display = 'block'; // 입력창 표시
            
            }
		}
	}
	xhr.send(mobile); 
}
function ssnCheck() {
	let userName = document.getElementById('userName');
    let mobile = document.getElementById('mobile');
    let smsNumber = document.getElementById('smsNumber');
   

    if (userName.value == "") {
        alert('이름을 입력하세요.');
    } else if (mobile.value == "") {
        alert('전화번호를 입력하세요.');
    } else if (smsNumber.value == "") {
        alert('인증 번호를 입력하세요.');
    } else {
        var f = document.getElementById('f');
        f.submit();
    }
}



