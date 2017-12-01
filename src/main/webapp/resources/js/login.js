$(function() {
	var urlString = window.location.href;
	var url = new URL(urlString);
	var error = url.searchParams.get('error');
	if(error != undefined && error.startsWith('deny')){
		alert('아이디나 비밀번호를 확인하세요.');
	}
	var nameRegex = /^[가-힣]{2,}$/;
    var idPwdRegex = /^[a-zA-Z0-9]{6,20}$/;
    var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
    var loginPossible = false;
    $('input').on('blur', function() {
        if (!$(this).val() && !$(this).attr('value')) {
            $(this).addClass('input-alert');
            loginPossible = false;
        } else {
            if($(this).attr('id') == 'customername-input'){
                if(!emailRegex.test($(this).val()) && !emailRegex.test($(this).attr('value'))){
                    $(this).addClass('input-alert');
                    loginPossible = false;
                    return;
                }
            }
            $(this).removeClass('input-alert');
            loginPossible = false;
        }
        loginPossible = true;
    });
});