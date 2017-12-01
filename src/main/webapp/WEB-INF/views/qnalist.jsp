<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/qna.css">	
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
                    <div class="custom-block">
                        <h3 class="panel-title">자주묻는 질문</h3>
                    </div>
                    <div class="custom-block pull-right">
                        <a href="#" class="btn btn-default btn-xs">전체보기</a>
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
            
            <h4><strong>1:1 문의하기</strong></h4>
            <span class="pull-right"><span id="star">*</span>표시정보는 필수 입력 사항입니다.</span>
                <table class="table table-hover table-bordered">
                    <colgroup>
                        <col width="20%">
                        <col width="*%">
                    </colgroup>
                    <form action="" method="post">
                    <tbody>
                        <tr >
                            <th>
                                <small>이름</small>
                            </th>
                            <td>
                                <small>이름</small>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <small>연락처</small>
                            </th>
                            <td>
                                <small>연락처</small>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <small>이메일</small>
                            </th>
                            <td>
                                <small>이메일</small>
                                <input type="checkbox"> <small>나의 정보 동시 변경</small>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="control-label"><span id="star">*</span>
                                <small>문의유형</small></label>
                                
                            </th>
                            <td>
                                <div>
                                   <div>
                                        <select name="">
                                            <option>선택해주세요.</option>
                                            <option>d</option>
                                            <option>d</option>
                                            <option>d</option>
                                            </select>
                                        <select name="">
                                            <option>선택해주세요.</option>
                                            <option>d</option>
                                            <option>d</option>
                                            <option>d</option>
                                        </select>
                                    </div>
                                    <div>
                                        <span id="detail"><small>티몬 보상제도 관련 문의는 <span id="span-span">'회원/보상제도/시타 > 보상제도 문의'</span>를 선택해 주셔야 정상 접수됩니다.</small></span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="control-label"><span id="star">*</span>
                                <small>상품선택</small></label>
                            </th>
                            <td>
                                <div>
                                <select name="" class="form-control">
                                    <option>상품을 선택해주세요.</option>
                                    <option>d</option>
                                    <option>d</option>
                                    <option>d</option>
                                </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th >
                                <label class="control-label"><span id="star">*</span>
                                <small>문의제목</small></label>
                            </th>
                            <td>
                                <input type="text" class="form-control" />
                            </td>
                        </tr>
                         <tr>
                            <th>
                                <label class="control-label"><span id="star">*</span>
                                <small>문의내용</small></label>
                            </th>
                            <td>
                                <textarea cols="123" rows="50" class="form-control"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="control-label"><small>파일첨부</small></label>
                            </th>
                            <td>
                                <input type="file" class="btn-sm" />
                                <span><small>이미지 파일()을 기준으로 최대 10MB 이하, 최대 3개까지 첨부 가능합니다.</small></span>
                            </td>
                        </tr>                   
                    </tbody>
                </form>
            </table>
            <div class="text-center">
                <button class="btn btn-lg" id="question-btn">문의하기</button>
                <a href="" class="btn btn-lg btn-default">취소</a>
            </div>
        </div>
        <div class="col-sm-1" id="right"></div>
    </div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>