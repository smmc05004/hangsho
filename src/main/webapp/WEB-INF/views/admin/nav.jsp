<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<ul class="nav navbar-nav">
		<li><a href="/admin/index.do" style="padding-top: 11px; padding-bottom: 0px;"><img alt="" src="/resources/images/common/hongsho_logo_e_w.png" style="width: 150px;"></a></li>
		<li class="${menu eq 'earning' ? 'active' : '' }"><a href="/admin/earningall.do">판매실적</a></li>
		<li class="${menu eq 'product' ? 'active' : '' }"><a href="/admin/prolist.do">상품관리</a></li>
		<li class="${menu eq 'qna' ? 'active' : '' }"><a href="/admin/qnalist.do">문의접수</a></li>
		<li class="${menu eq 'member' ? 'active' : '' }"><a href="/admin/membercom.do">회원관리</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="/customers/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
	</ul>
</nav>