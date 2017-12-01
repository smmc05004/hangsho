<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
	#body-container {padding: 0;}
    #body-container-body {padding-left: 200px; padding-top: 100px;}
    .sidenav {padding-top: 100px;}
    .sidenav h4 {padding-left: 16px; margin-top: 30px;}
    a {text-decoration: none !important;}
    nav ul li:first-child {width: 200px; text-align: center;}
    .active { background: gray;}
</style>
	<nav class="navbar navbar-default navbar-fixed-top">
		<ul class="nav navbar-nav">
			<li><a href="/index.do" style="padding-top: 11px; padding-bottom: 0px;"><img alt="" src="/resources/images/common/KakaoTalk_20171130_143934572.png" style="width: 150px;"></a></li>
			<li class="${menu eq 'main' ? 'active' : '' }"><a href="/company/index.do">	MAIN</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test="${not empty LOGIN_INFO}">
				<li><strong><a href="/company/detail.do" >${LOGIN_INFO.LOGIN_USER.name }</a></strong>님 환영합니다.</li>
				<li><a href="/customers/logout.do"> <span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/customers/login.do"> <span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
	</nav>
		
	<div class="w3-sidebar w3-dark-gray w3-bar-block" style="width:200px">
		<div class="sidenav">
			
			<h4>Q/A</h4>
			<a href="/product/qna.do" class="w3-bar-item w3-button ${menu eq 'qna' ? 'active' : '' }">문의 접수</a>
			
			<h4>REVIEW</h4>
			<a href="/company/reviewList.do" class="w3-bar-item w3-button ${menu eq 'review' ? 'active' : '' }">리뷰 리스트</a>
			
			<h4>PRODUCT / ITEM</h4>
			<a href="/product/list.do" class="w3-bar-item w3-button ${menu eq 'product' ? 'active' : '' }">상품 리스트</a>
			<a href="/item/list.do" class="w3-bar-item w3-button ${menu eq 'item' ? 'active' : '' }">아이템 리스트</a>
			
			<h4>ANALYSIS</h4>
			<a href="/analysis/profitforday.do" class="w3-bar-item w3-button ${menu eq 'dayprofit' ? 'active' : '' }">일별 수익 분석</a>
			<a href="/analysis/profitformonth.do" class="w3-bar-item w3-button ${menu eq 'monthprofit' ? 'active' : '' }">월별 수익 분석</a>
			<a href="/analysis/salesforday.do" class="w3-bar-item w3-button ${menu eq 'daysales' ? 'active' : '' }">일별 판매 분석</a>
			<a href="/analysis/salesformonth.do" class="w3-bar-item w3-button ${menu eq 'monthsales' ? 'active' : '' }">월별 판매 분석</a>
		</div>
	</div>
