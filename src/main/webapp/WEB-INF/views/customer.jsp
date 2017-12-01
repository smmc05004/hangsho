<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/customer.css">	
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div id="container">
	<div class="col-sm-2" id="left">
        <div class="row" id="customer-center" style="margin-left:5px">
            <h5 class="text-center">고객센터</h5>
        </div>
        <div class="panel panel-default">
           <div class="panel-heading">
               <h3 class="panel-title">자주묻는 질문</h3>
               <div class="text-right">
                    <span><a href="#" class="btn btn-default btn-xs">전체보기</a></span>
                </div>
           </div>
           <ul class="list-group">
                <li class="list-group-item"><a href="#">취소/환불/반품문의</a></li>
                <li class="list-group-item"><a href="#">교환문의</a></li>
                <li class="list-group-item"><a href="#">배송문의</a></li>
                <li class="list-group-item"><a href="#">상품문의</a></li>
                <li class="list-group-item"><a href="#">구매/결제문의</a></li>
                <li class="list-group-item"><a href="#">회원/보상제도/기타</a></li>
           </ul>
           <div class="panel-heading">
               <h3 class="panel-title"><a href="#">1:1문의</a></h3>
           </div>
           <ul class="list-group">
                <li class="list-group-item"><a href="#">1:1문의하기</a></li>
                <li class="list-group-item"><a href="#">1:1문의내역 조회</a></li>
           </ul>
           <div class="panel-heading">
               <h3 class="panel-title"><a href="#">나의 정보 조회</a></h3>
           </div>
           <ul class="list-group">
                <li class="list-group-item"><a href="#">상품 문의내역 조회</a></li>
                <li class="list-group-item"><a href="#">구매내역 조회</a></li>
                <li class="list-group-item"><a href="#">배송현황 조회</a></li>
                <li class="list-group-item"><a href="#">취소/환불내역 조회</a></li>
           </ul>
           <div class="panel-heading">
               <h3 class="panel-title"><a href="#">공지사항</a></h3>
           </div>
       </div>
	</div>

	<div class="col-sm-8" id="body">
        <h4><strong>티몬 고객센터</strong></h4>
        <div class="row" id="question-box">
            <div class="col-sm-8">
                <div class="row" id="search">
                    <h5><strong>자주묻는 질문 검색</strong></h5>
                    <form class="form-horizontal" action="">
                        <div class="form-group">
                            <div class="col-sm-9">
                                <input type="text" class="form-control" placeholder="검색어를 입력하세요." />
                            </div>
                            <button type="submit" class="btn btn-default" id="btn">검색</button>
                        </div>
                    </form>
                    <div class="row">
                        <span id="keyword"><small>키워드 ></small></span>
                        <span id="keyword-word"><small><a href=""> 바로환불제 | </a></small></span>
                        <span id="keyword-word"><small><a href=""> 책임배송제 | </a></small></span>
                        <span id="keyword-word"><small><a href=""> 환불접수 | </a></small></span>
                        <span id="keyword-word"><small><a href=""> 출고일 </a></small></span>
                    </div>
                </div>
            </div>
             <div class="col-sm-4">
                <div class="row">
                    <h5><strong>1:1문의</strong></h5>
                </div>
                <div class="row">
                    <p>궁금하신 사항은 언제든지 문의주세요.</p>
                </div>
                <div class="row">
                    <a href="" class="btn btn-primary">문의하기</a>
                    <a href="" class="btn btn-default">내역조회</a>
                </div>
            </div>
        </div>
		
		<div class="row" style="padding-top: 50px">
            <div class="col-sm-6">
                <h5><strong>자주 묻는 질문 TOP5</strong></h5>
                <table class="table table-hover">
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                    </tbody>
                </table>
            </div>
		
            <div class="col-sm-6">
                <h5><strong>새로 등록된 질문 TOP5</strong></h5>
                <table class="table table-hover">
                    <tbody>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                        <tr>
                            <td><span><small><a href="">john@example.com</a></small></span>	</td>
                        </tr>
                    </tbody>
                </table>
            </div>
		</div>
		
		<div class="row" style="padding-top: 50px">
			<h5><strong>서비스 바로가기</strong></h5>
			<div id="service">
				<div class="col-sm-3">
				    <i class="fa fa-truck" aria-hidden="true"></i>
					<span><small>구매내역 조회</small></span>
				</div>
				<div class="col-sm-3">
					<span><small>배송현황 조회</small></span>
				</div>
				<div class="col-sm-3">
					<span><small>취소/환불내역 조회</small></span>
				</div>
				<div class="col-sm-3">
					<span><small>개인정보 변경</small></span>
				</div>
				<div class="col-sm-3">
					<span><small>VIP 멤버십</small></span>
				</div>
			</div>
		</div>
		
		<div class="row" style="padding-top: 50px">
			<div>
                <h5><strong>공지사항</strong></h5>
            </div>
            <div class="text-right">
                <span><small><a href="#">더보기></a></small></span>
			</div>
			<table class="table table-hover">
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="*%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr class="well">
						<th><span><small>번호</small></span></th>
						<th><span><small>분류</small></span></th>
						<th><span><small>제목</small></span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td><span><small>1542</small></span></td>
					<td><span><small>공지</small></span></td>
					<td><span><small><a href="#">[공지] 쿠팡캐시 사용 한도 제한 안내</a></small></span></td>
					</tr>
					<tr>
					<td><span><small>1542</small></span></td>
					<td><span><small>공지</small></span></td>
					<td><span><small><a href="#">[공지] 쿠팡캐시 사용 한도 제한 안내</a></small></span></td>
					</tr>
                    <tr>
					<td><span><small>1542</small></span></td>
					<td><span><small>공지</small></span></td>
					<td><span><small><a href="#">[공지] 쿠팡캐시 사용 한도 제한 안내</a></small></span></td>
					</tr>
					<tr>
					<td><span><small>1542</small></span></td>
					<td><span><small>공지</small></span></td>
					<td><span><small><a href="#">[공지] 쿠팡캐시 사용 한도 제한 안내</a></small></span></td>
					</tr>
                    <tr>
					<td><span><small>1542</small></span></td>
					<td><span><small>공지</small></span></td>
					<td><span><small><a href="#">[공지] 쿠팡캐시 사용 한도 제한 안내</a></small></span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr/>
	<div class="col-sm-1" id="right"></div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>