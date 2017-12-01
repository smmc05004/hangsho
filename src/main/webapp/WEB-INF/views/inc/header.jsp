<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header id="header">		
	<div class="box_util">
		<div>
			<ul class="util_menu1">
				<li><a href="#">즐겨찾기</a></li>
				<li><a href="">입점신청<div class="triangle_down"></div></a>
					<ul><div class="triangle_up"><span></span></div>
						<li><a href="">배송상품</a></li>
						<li><a href="">여행·문화</a></li>
						<li><a href="">로켓배송</a></li>
					</ul>
				</li>					
			</ul>
			<ul class="util_menu2">
			<c:choose>
				<c:when test="${not empty LOGIN_INFO }">
				<c:choose>
					<c:when test="${LOGIN_INFO.USER_TYPE eq 'CUSTOMER'  }">
					<li><p style="color:white;">${LOGIN_INFO.LOGIN_USER.nickname }님 환영합니다.</p></li>
					</c:when>
					<c:otherwise>
					<li><p>${LOGIN_INFO.LOGIN_USER.name }님 환영합니다.</p></li>
					</c:otherwise>
				</c:choose>
					<li><a href="/customers/index.do">마이페이지</a></li>
					<li><a href="/company/index.do">기업회원</a></li>
					<li><a href="/customers/logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/customers/login.do">로그인</a></li>
					<li><a href="/customers/register.do">회원가입</a></li>
				</c:otherwise>
			</c:choose>				
				<li><a href="#">고객센터</a></li>					
			</ul>
		</div>						
	</div>
	<div class="box_nav">
		<div class="tsmc">
			<h1><a href="/index.do"><img src="/resources/images/common/logo.png" alt="행쇼" width="250px"></a></h1>
			<form action="/search.do" method="get" class="combine_sch">					
				<input type="text" name="keyword" id="search" placeholder=""><button type="submit" style="background: transparent;
    border: none; padding : 0;"><input type="image" src="/resources/images/common/searchicon.png" alt="검색"></button>
			</form>
			<figure class="mypage">
				<a href="/customers/index.do">
					<img src="/resources/images/common/mypage.png" alt="마이페이지">
					<figcaption>마이페이지</figcaption>						
				</a>				
			</figure>
			<figure class="cart">
				<a href="/cart/cart.do">
					<img src="/resources/images/common/cart.png" alt="장바구니">
					<em>0</em>
					<figcaption>장바구니</figcaption>						
				</a>
			</figure>
		</div>						
		<nav id="nav">			
			<ul class="gnb">
				<li><a href="/productList.do?bc=100">식품</a>
					<ul><div class="triangle_up"><span></span></div>
						<li><a href="/productList.do?bc=100&mc=110">과일</a></li>							
						<li><a href="/productList.do?bc=100&mc=120">채소</a></li>							
						<li><a href="/productList.do?bc=100&mc=130">고기</a></li>						
					</ul>
				</li>
				<li><a href="/productList.do?bc=200">패션</a>
					<ul><div class="triangle_up"><span></span></div>
						<li><a href="/productList.do?bc=200&mc=210">여성의류</a></li>							
						<li><a href="/productList.do?bc=200&mc=220">남성의류</a></li>						
						<li><a href="/productList.do?bc=200&mc=230">가방</a></li>						
					</ul>
				</li>
				<li><a href="/productList.do?bc=300">가전</a>
					<ul><div class="triangle_up"><span></span></div>
						<li><a href="/productList.do?bc=300&mc=310">주방가전</a></li>							
						<li><a href="/productList.do?bc=300&mc=320">생활가전</a></li>							
						<li><a href="/productList.do?bc=300&mc=330">건강가전</a></li>		
					</ul>
				</li>				
				<li><a href="/merona/index.do">개인거래</a>
					<ul><div class="triangle_up"><span></span></div>
						<li><a href="/merona/index.do">올때 메로나</a></li>							
						<li><a href="/used/index.do">안전 중고나라</a></li>															
					</ul>
				</li>					
			</ul>
		</nav>	
	</div>			
</header>
<%@ include file="chat.jsp" %>