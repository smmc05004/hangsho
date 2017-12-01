<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<script type="text/javascript" src="/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div id="container_wrap">
		<div id="main_visual">
			<div class="visual_wrap">
				<c:choose>
					<c:when test="${not empty mainSliders }">
						<ul class="main_visual_li">
							<c:forEach var="slider" items="${mainSliders }">
								<li>
									<figure>
										<a href="/hangshoproducts/detail.do?productId=${slider.product.id }">
											<img src="${slider.product.image.path }">
											<figcaption>${slider.product.name }</figcaption>											
											<span><strong><fmt:formatNumber pattern=",###" value="${slider.showingPrice }" /></strong>원</span> <!-- <del>원</del> -->
										</a>
									</figure>
								</li>
							</c:forEach>
						</ul>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div id="contents">
			<div class="wrap_box">
				<section class="main_product">
					<h4 class="best">
						<a href="#" class="on">베스트</a>
					</h4>
					<div class="first">
					<c:choose>
						<c:when test="${not empty bestItems }">
							<ul class="main_list">
								<c:forEach var="item" items="${bestItems }">
									<li>
										<figure>
											<a
												href="/hangshoproducts/detail.do?productId=${item.product.id }">
												<img src="${item.product.image.path }">
												<figcaption>${item.product.name }</figcaption> <del>16900원</del>
												<p>
													<fmt:formatNumber pattern=",###"
														value="${item.showingPrice }" />
													<span><strong>${item.saledQty}</strong>개 구매</span>
												</p>
											</a>
										</figure>
									</li>
								</c:forEach>
							</ul>
						</c:when>
					</c:choose>
					</div>
					<h4 class="new">
						<a href="#">신상품</a>
					</h4>
					<div>
						<c:choose>
						<c:when test="${not empty newArrivals }">
							<ul>
								<c:forEach var="item" items="${newArrivals }">
									<li>
										<figure>
											<a
												href="/hangshoproducts/detail.do?productId=${item.product.id }">
												<img src="${item.product.image.path }">
												<figcaption>${item.product.name }</figcaption> <del>16900원</del>
												<p>
													<fmt:formatNumber pattern=",###"
														value="${item.showingPrice }" />
													<span><strong>${item.saledQty}</strong>개 구매</span>
												</p>
											</a>
										</figure>
									</li>
								</c:forEach>
							</ul>
						</c:when>
					</c:choose>
					</div>
					<h4 class="popular">
						<a href="">인기 구매 급상승</a>
					</h4>
					<div>
						<c:choose>
						<c:when test="${not empty populars }">
							<ul>
								<c:forEach var="item" items="${populars }">
									<li>
										<figure>
											<a href="/hangshoproducts/detail.do?productId=${item.product.id }">
												<img src="${item.product.image.path }">
												<figcaption>${item.product.name }</figcaption> <del>16900원</del>
												<p>
													<fmt:formatNumber pattern=",###"
														value="${item.showingPrice }" />
													<span><strong>${item.saledQty}</strong>개 구매</span>
												</p>
											</a>
										</figure>
									</li>
								</c:forEach>
							</ul>
						</c:when>
					</c:choose>
					</div>
				</section>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>