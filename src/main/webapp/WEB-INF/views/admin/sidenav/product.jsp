<%@ page pageEncoding="UTF-8"%>
<div class="w3-sidebar w3-dark-gray w3-bar-block">
	<div class="sidenav">
		<h3>상품 관리</h3>
		<a href="/admin/prolist.do" class="w3-bar-item w3-button ${sidemenu eq 'prolist' ? 'w3-light-gray' : '' }">상품 리스트</a>
		<a href="/admin/recompro.do" class="w3-bar-item w3-button ${sidemenu eq 'recompro' ? 'w3-light-gray' : '' }">추천상품 리스트</a> 
	</div>
</div>