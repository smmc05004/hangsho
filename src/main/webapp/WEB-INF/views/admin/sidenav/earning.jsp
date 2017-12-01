<%@ page pageEncoding="UTF-8"%>
<div class="w3-sidebar w3-dark-gray w3-bar-block">
	<div class="sidenav">
		<h3>판매 실적</h3>
		<a href="/admin/earningall.do" class="w3-bar-item w3-button ${sidemenu eq 'all' ? 'w3-light-gray' : '' }">전체 판매실적</a>
		<a href="/admin/earningpro.do" class="w3-bar-item w3-button ${sidemenu eq 'product' ? 'w3-light-gray' : '' }">상품별 판매실적</a> 
		<a href="/admin/earningcom.do" class="w3-bar-item w3-button ${sidemenu eq 'company' ? 'w3-light-gray' : '' }">기업별 판매실적</a>
	</div>
</div>