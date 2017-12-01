<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/register.css">
<script type="text/javascript" src="/resources/js/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<form action="addcustomer.do" method="post">
				<div class="form-group">
					<input type="text" name="username" class="form-control"
						placeholder="아이디(이메일)" id="username-input">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control"
						placeholder="비밀번호 (영문 및 숫자 6~20자)" id="password-input">
				</div>
				<div class="form-group">
					<input type="text" name="nickname" class="form-control"
						placeholder="set a nickname" id="nickname-input">
				</div>
				<div class="form-group">
					<input type="password" name="password-confirm" class="form-control"
						placeholder="비밀번호 확인" id="password-confirm-input">
				</div>
				<div class="form-group">
					<input type="text" name="name" class="form-control"
						placeholder="이름 (한글)" id="name-input">
				</div>
				<div class="form-group">
					<input type="text" name="phonenumber" class="form-control"
						placeholder="휴대폰 번호 000-000(0)-0000" id="phone-number-input">
				</div>

				<div class="form-group">
					<div id="address-package">
						<input type="text" maxlength="5" class="form-control postal-area" name="postalcode" id="postal-code" placeholder="우편번호" readonly/>
						<a href="" id="address-btn"	class="form-control  btn btn-default postal-area">주소검색</a>
					</div>
				</div>
				<div class="form-group">
					<input type="text" name="mainaddress" class="form-control"
						placeholder="주소" id="main-address">
				</div>
				<div class="form-group">
					<input type="text" name="detailaddress" class="form-control"
						placeholder="상세 주소를 입력해 주세요" id="address-detail-input">
				</div>
				<div class="form-group">
					<button class="btn btn-lg btn-primary form-control" id="login-btn">
						동의하고 가입하기</button>
				</div>
			</form>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
