<%@ page pageEncoding="UTF-8"%>
<div class="row category_wrap">
	<ul class="categorylist">
		<li><a href="/index.do">홈</a><span>＞</span></li>
		<li><a href="index.do?bc=${merona.smallcategory.midCategory.bigCategory.id }">${merona.smallcategory.midCategory.bigCategory.name }</a>			
			<div class="triangle_down"></div>			 
			<span>＞</span>			
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
		<li>				
			<a href="index.do?bc=${merona.smallcategory.midCategory.bigCategory.id }&mc=${merona.smallcategory.midCategory.id}">${merona.smallcategory.midCategory.name}</a>
			<div class="triangle_down"></div>
			<span>＞</span>
			<ul id="mclist">
				<c:forEach var="middleCategory" items="${middleCategories }">
					<li>
						<a href="index.do?bc=${merona.smallcategory.midCategory.bigCategory.id }&mc=${middleCategory.id }">${middleCategory.name }</a>
					</li>
				</c:forEach>
			</ul>
		</li>		
		<li>
			<a href="index.do?bc=${merona.smallcategory.midCategory.bigCategory.id }&mc=${merona.smallcategory.midCategory.id}&sc=${merona.smallcategory.id}">${merona.smallcategory.name}</a>								
			<div class="triangle_down"></div>
			<ul id="sclist">
				<c:forEach var="smallCategory" items="${smallCategories }">
					<li><a href="index.do?bc=${merona.smallcategory.midCategory.bigCategory.id }&mc=${merona.smallcategory.midCategory.id}&sc=${smallCategory.id}">${smallCategory.name }</a></li>
				</c:forEach>
			</ul>
		</li>		
	</ul>
</div>