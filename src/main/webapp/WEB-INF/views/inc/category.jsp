<%@ page pageEncoding="UTF-8"%>
<div class="row category_wrap">
	<ul class="categorylist">
		<li><a href="/index.do">홈</a><span>＞</span></li>
		<li>
			<c:choose>
				<c:when test="${not empty param.bc }">
					<a href="index.do?bc=${param.bc }" id="chooseBC"></a>
				</c:when>
				<c:otherwise>
					<a href="index.do">전체</a>
				</c:otherwise>
			</c:choose>
			<div class="triangle_down"></div> <c:if
				test="${not empty middleCategories }">
				<span>＞</span>
			</c:if>
			<ul id="bclist">
				<li><a href="index.do">전체</a></li>
				<li><a href="index.do?bc=400">유럽</a></li>
				<li><a href="index.do?bc=500">아시아</a></li>
				<li><a href="index.do?bc=600">북아메리카</a></li>
				<li><a href="index.do?bc=700">남아메리카</a></li>
				<li><a href="index.do?bc=800">오세아니아</a></li>
				<li><a href="index.do?bc=900">아프리카</a></li>
			</ul>
		</li>
		<c:if test="${not empty middleCategories }">
			<li><c:choose>
					<c:when test="${not empty param.mc }">
						<a href="index.do?bc=${param.bc }&mc=${param.mc}" id="chooseMC"></a>
					</c:when>
					<c:otherwise>
						<a href="index.do?bc=${param.bc }">전체</a>
					</c:otherwise>
				</c:choose>
				<div class="triangle_down"></div> <c:if
					test="${not empty smallCategories }">
					<span>＞</span>
				</c:if>
				<ul id="mclist">
					<c:forEach var="middleCategory" items="${middleCategories }">
						<li><a
							href="index.do?bc=${param.bc }&mc=${middleCategory.id }">${middleCategory.name }</a></li>
					</c:forEach>
				</ul></li>
		</c:if>
		<c:if test="${not empty smallCategories }">
			<li><c:choose>
					<c:when test="${not empty param.sc }">
						<a href="index.do?bc=${param.bc }&mc=${param.mc}&sc=${param.sc}"
							id="chooseSC"></a>
					</c:when>
					<c:otherwise>
						<a href="index.do?bc=${param.bc }&mc=${param.mc}">전체</a>
					</c:otherwise>
				</c:choose>
				<div class="triangle_down"></div>
				<ul id="sclist">
					<c:forEach var="smallCategory" items="${smallCategories }">
						<li><a
							href="index.do?bc=${param.bc }&mc=${param.mc}&sc=${smallCategory.id}">${smallCategory.name }</a></li>
					</c:forEach>
				</ul></li>
		</c:if>
	</ul>
</div>