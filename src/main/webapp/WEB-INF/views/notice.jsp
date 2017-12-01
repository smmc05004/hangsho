<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/notice.css">	
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div id="container">
	<div class="col-sm-2" id="left">
        <div class="row" id="customer-center" style="margin-left:5px">
            <h5 class="text-center well">고객센터</h5>
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


        <h4><strong>공지사항</strong></h4>


        <div class="row" id="search-box">
            <form class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <span><strong>질문검색</strong></span>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요." />
                    </div>
                    <div class="col-sm-2">
                        <div>
                            <button type="submit" class="form-control" id="search-btn">검색</button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row text-center">
                <span id="keyword"><small>키워드 ></small></span>
                <span id="keyword-word"><small><a href=""> 바로환불제 | </a></small></span>
                <span id="keyword-word"><small><a href=""> 책임배송제 | </a></small></span>
                <span id="keyword-word"><small><a href=""> 환불접수 | </a></small></span>
                <span id="keyword-word"><small><a href=""> 출고일 </a></small></span>
            </div>
        </div>
        <div class="row" id="middle-btn">
            <div class="btn-group btn-group-justified">
                <a href="#" class="btn btn-default active">전체</a>
                <a href="#" class="btn btn-default">일반</a>
                <a href="#" class="btn btn-default">서비스</a>
                <a href="#" class="btn btn-default">당첨자 발표</a>
            </div>
        </div>
        
        <div class="row" id="notice-table">
           <colgroup>
               <col width="10%">
               <col width="10%">
               <col width="*">
               <col width="10%">
           </colgroup>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th><span><small>번호</small></span></th>
                        <th><span><small>분류</small></span></th>
                        <th><span><small>제목</small></span></th>
                        <th><span><small>등록일</small></span></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                    <tr>
                        <td><span><small>4325</small></span></td>
                        <td><span><small>서비스</small></span></td>
                        <td><span><small>[공지]무료반품 서비스 종료 안내</small></span></td>
                        <td><span><small>2017.10.16</small></span></td>
                    </tr>
                </tbody>
            </table>
            <div class="text-center">
                <ul class="pagination">
                    <li><a href="">처음</a></li>
                    <li><a href="">&lt;이전</a></li>
                    <li><a href="" class="active">1</a></li>
                    <li><a href="">다음></a></li>
                    <li><a href="">맨끝</a></li>
                </ul>
                <div>
                    <form class="form-horizontal form-inline" action="">
                        <div class="col-2">
                            <select name="search-select">
                                <option value="all">전체</option>
                                <option value="title">제목</option>
                                <option value="contents">내용</option>
                            </select>
                            <input type="text" />
                            <button type="submit" class="btn btn-sm btn-default">검색</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
	<div class="col-sm-1" id="right"></div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>