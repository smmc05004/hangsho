<%@ page pageEncoding="UTF-8"%>
<div class="w3-sidebar w3-dark-gray w3-bar-block">
	<div class="sidenav">
		<h3>회원 관리</h3>
		<a href="/admin/membercom.do" class="w3-bar-item w3-button ${sidemenu eq 'company' ? 'w3-light-gray' : ''}">기업회원</a>
		<a href="/admin/membercus.do" class="w3-bar-item w3-button ${sidemenu eq 'customer' ? 'w3-light-gray' : ''}">개인회원</a> 
	</div>
</div>