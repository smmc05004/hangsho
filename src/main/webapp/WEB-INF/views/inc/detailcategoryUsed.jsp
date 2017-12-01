<%@ page pageEncoding="UTF-8"%>
<div class="row category_wrap">
	<ul class="categorylist">
		<li><a href="/index.do">홈</a><span>＞</span></li>
		<li><a href="index.do?bc=${used.smallcategory.midCategory.bigCategory.id }">${used.smallcategory.midCategory.bigCategory.name }</a>			
			<div class="triangle_down"></div>			 
			<span>＞</span>			
			<ul id="bclist">
				<li><a href="index.do">전체</a></li>	
				<li><a href="index.do?bc=100">식품</a></li>
				<li><a href="index.do?bc=200">패션</a></li>
				<li><a href="index.do?bc=300">가전</a></li>
			</ul>
		</li>		
		<li>
			<a href="index.do?bc=${used.smallcategory.midCategory.bigCategory.id }&mc=${used.smallcategory.midCategory.id}">${used.smallcategory.midCategory.name}</a>
			<div class="triangle_down"></div>
			<span>＞</span>
			<ul id="mclist">
				<c:forEach var="middleCategory" items="${middleCategories }">
					<li>
						<a href="index.do?bc=${used.smallcategory.midCategory.bigCategory.id }&mc=${middleCategory.id }">${middleCategory.name }</a>
					</li>
				</c:forEach>
			</ul>
		</li>		
		<li>
			<a href="index.do?bc=${used.smallcategory.midCategory.bigCategory.id }&mc=${used.smallcategory.midCategory.id}&sc=${used.smallcategory.id}">${used.smallcategory.name}</a>								
			<div class="triangle_down"></div>
			<ul id="sclist">
				<c:forEach var="smallCategory" items="${smallCategories }">
					<li><a href="index.do?bc=${used.smallcategory.midCategory.bigCategory.id }&mc=${used.smallcategory.midCategory.id}&sc=${smallCategory.id}">${smallCategory.name }</a></li>
				</c:forEach>
			</ul>
		</li>		
	</ul>
</div>