<%@ page pageEncoding="UTF-8"%>
<div class="navi_wrap">	
	<ul class="nav nav-pills nav-stacked" role="navigation" id="deal-nav">
		<li class="${dealInfo eq 'saleB' ? 'active' : '' }"><a href="deal.do">나의 판매글 목록</a></li>
		<li class="${dealInfo eq 'saleR' ? 'active' : '' }"><a href="saleRequest.do">나의 판매요청 현황</a></li>
		<li class="${dealInfo eq 'saleL' ? 'active' : '' }"><a href="saleList.do">나의 판매내역 보기</a></li>
		<li class="${dealInfo eq 'buyB' ? 'active' : '' }"><a href="buyBoardList.do">나의 구매글 목록</a></li>
		<li class="${dealInfo eq 'buyR' ? 'active' : '' }"><a href="buyRequest.do">나의 구매요청 현황</a></li>
		<li class="${dealInfo eq 'buyL' ? 'active' : '' }"><a href="buyList.do">나의 구매내역 보기</a></li>
	</ul>
</div>