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
		<div id="contents">
			<div class="wrap_box">
				<section class="main_product">
					<h4 class="best">
						<a href="#" class="on">검색결과</a>
					</h4>
					<div class="first">
					<c:choose>
						<c:when test="${not empty searchList }">
							<ul class="main_list">
								<c:forEach var="item" items="${searchList }">
									<li>
										<figure>
											<a
												href="/hangshoproducts/detail.do?productId=${item.id }">
												<img src="${item.image.path }">
												<figcaption>${item.name }</figcaption><!--  <del>16900원</del> -->
												<p>
<%-- 													<fmt:formatNumber pattern=",###"
														value="${item.showingPrice }" /> --%>
												</p>
											</a>
										</figure>
									</li>
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<h4>검색결과가 존재하지 않습니다. 다른 검색어로 다시 시도해 주세요.</h4>
						</c:otherwise>
					</c:choose>
					</div>
				</section>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>