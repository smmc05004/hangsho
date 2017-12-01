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
				<li><a href="index.do?bc=100">식품</a></li>
				<li><a href="index.do?bc=200">패션</a></li>
				<li><a href="index.do?bc=300">가전</a></li>
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