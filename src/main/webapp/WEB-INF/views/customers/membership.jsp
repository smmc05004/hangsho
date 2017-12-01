<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<%@ include file="/WEB-INF/views/customers/inc.jsp"%>
	<!-- Tab panes -->
	<div role="tabpanel" class="tab-pane" id="settings">
		<div class="row" width="100%">
			<h4>등급안내</h4>
			<hr />
			<div class="col-sm-3">
				<img src="/resources/images/coupon/${LOGIN_INFO.LOGIN_USER.grade }g.jpg" width="70%" height="60%"/>
			</div>
			<div class="col-sm-9" id="grade-descrip">
				<h4>
					<strong>${ LOGIN_INFO.LOGIN_USER.nickname}</strong>님의 티몬 멤버십 등급은 <strong
						style="color: firebrick"> <c:choose>
							<c:when test="${ LOGIN_INFO.LOGIN_USER.grade == 'S'}">
										Silver										
									</c:when>
							<c:when test="${ LOGIN_INFO.LOGIN_USER.grade == 'G'}">
										Gold										
									</c:when>
							<c:when test="${ LOGIN_INFO.LOGIN_USER.grade == 'V'}">
										VIP										
									</c:when>
							<c:when test="${ LOGIN_INFO.LOGIN_USER.grade == 'VV'}">
										VVIP										
									</c:when>
							<c:when test="${ LOGIN_INFO.LOGIN_USER.grade == 'TF'}">
										The First										
									</c:when>
						</c:choose>

					</strong>입니다
				</h4>
				<p>
					<span>유지기간 |</span> 1개월 / 매월 10일변경
				</p>
				<p>
					<span>산정기간 |</span> 최근 3개월 / <span style="color: deeppink">2017-07-01
						~ 2017-09-30</span>
				</p>
				<button type="button" class="btn btn-default btn-sm"
					style="margin-top: 2%">구매내역 보기</button>
			</div>
		</div>
		<hr />
	</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>