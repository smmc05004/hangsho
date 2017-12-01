<%@ page pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/user-common.js"></script>
<div class="container" style="overflow: hidden;">
<c:set var="deal" value="deal"></c:set>
	<div class="text-center">
		<div class="thumnail">
			<img src="/resources/images/tmon.png" width="30%" />
		</div>
		<h2>
			<strong>${LOGIN_INFO.LOGIN_USER.nickname }</strong> 님의 마이페이지
		</h2>
	</div>
	<table class="table table-bordered">
		<tbody>
			<tr class="bg-primary">
				<td colspan="5">
					<div class="col-sm-2" style="margin-bottom: 6px">
						<h3>
							<strong>마이페이지</strong>
						</h3>
					</div>
					<div style="margin-top: 22px">
						<strong>${LOGIN_INFO.LOGIN_USER.nickname }</strong>님의 티몬멤버십 등급은 <strong
							style="color: darkorange"> <c:choose>
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
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						<strong>할인쿠폰</strong>
					</p>
					<p>9</p>
				</td>
				<td>
					<p>
						<strong>티몬캐쉬/적립금</strong>
					</p>
					<p>
						<fmt:formatNumber pattern=",###">${LOGIN_INFO.LOGIN_USER.point}</fmt:formatNumber>
						원
					</p>
				</td>
				<td>
					<p>
						<strong>배송중</strong>
					</p>
					<p>5</p>
				</td>
				<td>
					<p>
						<strong>환불/교환완료</strong>
					</p>
					<p>3</p>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="margin-bottom: 20px;">
		<div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li><a href="/customers/index.do">구매내역</a></li>
				<li><a href="/customers/membership.do">티몬 멤버십</a></li>
				<li><a href="/customers/qnalist.do">문의/답변</a></li>
				<li><a href="/customers/info.do">개인정보</a></li>
				<li class="${deal eq 'deal' ? 'active' : '' }"><a href="/customers/deal.do">개인거래</a></li>
			</ul>
		</div>
	</div>