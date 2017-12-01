<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
<script type="text/javascript" src="/resources/js/info.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<%@ include file="/WEB-INF/views/customers/inc.jsp"%>
	<!-- Tab panes -->
	<div role="tabpanel" class="tab-pane" id="private">
		<div class="row" id="pwd-check-form">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="panel panel-default" style="margin: 5%">
					<div class="panel-heading">
						<h3 class="panel-title">비밀번호 재입력</h3>
					</div>
					<div class="panel-body">
						<form>
							<div class="form-group">
								<label>비밀번호 입력</label> <input type="password"
									class="form-control" id="customer-pwd" name="customerpwd">
							</div>
							<div class="form-group text-right">
								<button type="submit" class="btn btn-primary btn-md"
									id="pwdcheck-btn">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div id="info-modify-form">
			<form action="info-update.do" method="post">
				<div class="form-group">
					<label>이름</label> <input type="text" disabled="disabled" 
						class="form-control" value="${ LOGIN_INFO.LOGIN_USER.name}" />
				</div>
				<div class="form-group">
					<label>별칭</label> <input type="text" disabled="disabled" 
						class="form-control" value="${ LOGIN_INFO.LOGIN_USER.nickname}" />
				</div>
				<div class="form-group">
					<label>아이디(이메일)</label> <input type="text" disabled="disabled" class="form-control"
						value="${ LOGIN_INFO.LOGIN_USER.username}" />
				</div>
				<div class="form-group">
					<label>새 비밀번호</label> <input type="password" name="password"
						class="form-control" />
				</div>
				<div class="form-group">
					<label>새 비밀번호 확인</label> <input type="password"
						name="passwordCheck" class="form-control" />
				</div>
				<div class="form-group">
					<label>연락처</label> <input type="text" name="phonenumber"
						class="form-control" value="${ LOGIN_INFO.LOGIN_USER.phonenumber}" />
				</div>
				<div class="form-group">
					<div id="address-package">
						<label>우편번호</label>
						<input type="text" maxlength="5" class="form-control postal-area"
							name="postalcode" id="postal-code" placeholder="우편번호" readonly value="${ LOGIN_INFO.LOGIN_USER.postalcode}"/>
						<a href="" id="address-btn"
							class="form-control  btn btn-default postal-area">주소검색</a>
					</div>
				</div>
				<div class="form-group">
				<label>주소</label>
					<input type="text" name="mainaddress" class="form-control"
						placeholder="주소" id="main-address" readonly value="${ LOGIN_INFO.LOGIN_USER.mainaddress}">
				</div>
				<div class="form-group">
				<label>상세주소</label>
					<input type="text" name="detailaddress" class="form-control" id="address-detail-input"value="${ LOGIN_INFO.LOGIN_USER.detailaddress}">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-md btn-primary">수정</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>