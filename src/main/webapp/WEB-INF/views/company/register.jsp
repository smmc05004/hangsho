<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <title>Company Register</title>
</head>
	<style>
        .big-checkbox {
            width: 30px;
            height: 30px;
            margin: 0;
            padding: 0;
        }

        .form-control {
            height: 50px;
        }

        .login-area {
            margin-top: 4px;
            margin-left: 2px;
            line-height: 30px;
            vertical-align: middle;
            font-size: 12px;
        }

        .input-alert {
            border-color: red;
        }

        a.hovering: hover a+div {
            visibility: visible;
        }

        ) a+div {
            visibility: hidden;
        }
        #address-package {
            display: inline-block;
        }
        
	</style>
<body>
   
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
            <form method="post" action="add.do">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="username" id="id-input">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="password" id="password-input">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호 확인" name="password-confirm" id="password-confirm-input">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="회사명" name="name" id="com-name-input">
                </div>
                <div class="form-group">
					<div id="address-package">
						<input type="text" maxlength="5" class="form-control postal-area" name="postalcode" id="postal-code" placeholder="우편번호" readonly/>
						<a href="" id="address-btn"	class="form-control  btn btn-default postal-area">주소검색</a>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="주소" name="mainaddress" id="main-address">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="상세 주소를 입력해 주세요" name="detailaddress" id="address-detail-input">
				</div>
                <div class="form-group">
					<input type="text" class="form-control" placeholder="대표자번호 000-000(0)-0000" name="phonenumber" id="phone-number-input">
				</div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="사업자 등록 번호(000-00-00000)" name="ceonumber" id="ceo-number-input">
                </div>

                <div class="form-group">
                    <button class="btn btn-lg btn-primary form-control" id="login-btn">동의하고 가입하기</button>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
<script>
$(function() {
    var nameRegex = /^[가-힣]{2,}$/;
    var idPwdRegex = /^[a-zA-Z0-9]{6,20}$/;
    var comNameRegex = /^[가-힣a-zA-Z\s]{2,}$/;
    var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
    var ceoRegex = /^\d{3}-\d{2}-\d{5}$/;
    var registerPossible = false;
    
    $("#address-btn").click(function(event) {
        event.preventDefault();
        new daum.Postcode({
            oncomplete: function(data) {
            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            	
            	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            	var fullAddr = '';
            	var extraAddr = '';
            	
            	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
            	
            	// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				$('#postal-code').val(data.zonecode); //5자리 새우편번호 사용
				$('#main-address').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('#address-detail-input').focus();
            }
        }).open();
    });
    
    
    $('input').on('blur, focusout', function() {
        if (!$(this).val() && !$(this).attr('value')) {
            $(this).addClass('input-alert');
            registerPossible = false;
        } else {
            if ($(this).attr('id') == 'id-input') {
                if (!idPwdRegex.test($(this).val()) && !idPwdRegex.test($(this).attr('value'))) {
                    $(this).addClass('input-alert');
                    registerPossible = false;
                    return;
                }
            }
            if ($(this).attr('id') == ('password-input' ||'password-confirm-input')) {
                var input = $(this).val();
                if (!input || input.length < 6 || input > 20) {
                    $(this).addClass('input-alert');
                    registerPossible = false;
                    return;
                }
            }
            if ($(this).attr('id') == 'password-confirm-input') {
                var input = $(this).val();
                if (!input || input != $('#password-input').val() || input.length < 6 || input > 20) {
                    $(this).addClass('input-alert');
                    registerPossible = false;
                    return;
                }
            }
            if ($(this).attr('id') == 'com-name-input') {
                if (!comNameRegex.test($(this).val()) && !comNameRegex.test($(this).attr('value'))) {
                    $(this).addClass('input-alert');
                    registerPossible = false;
                    return;
                }
            }
            if ($(this).attr('id') == 'phone-number-input') {
                if (!phoneRegex.test($(this).val()) && !phoneRegex.test($(this).attr('value'))) {
                    $(this).addClass('input-alert');
                    registerPossible = false;
                    return;
                }
            }
            if ($(this).attr('id') == 'ceo-number-input') {
                if (!ceoRegex.test($(this).val()) && !ceoRegex.test($(this).attr('value'))) {
                    $(this).addClass('input-alert');
                    registerPossible = false;
                    return;
                }
            }
            $(this).removeClass('input-alert');
            registerPossible = true;
            return;
        }
    });
    
    $('#login-btn').click(function(event) {
    	event.preventDefault();
        if (!registerPossible || !$('#postal-code').val()) {
            alert('입력 형식에 맞지 않는 항목이 있습니다. 확인해주세요.')
            return;
        }
        $(this).closest('form').submit();
    })

});
</script>
</html>
