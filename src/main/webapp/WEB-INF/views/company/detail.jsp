<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <title>Company Detail</title>
</head>
<body>
<div class="contailner">
	<h1>내 정보</h1>
	<div class="col-md-6 col-md-offset-3">
        <form action="">
            <div class="form-group">
                <label>아이디</label>
                <input type="text" class="form-control" name="comname" value="gdHong" readonly />
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" value="zxcv1234" readonly />
            </div>
            <div class="form-group">
                <label>회사명</label>
                <input type="text" class="form-control" name="name" value="sk네트웍스" readonly />
            </div>
            <div class="form-group">
                <div id="address-package">
                    <label>우편번호</label>
                    <input type="text" maxlength="5" class="form-control postal-area" placeholder="우편번호"  name="postalcode" id="postal-code" readonly/>
                    <a href="" id="address-btn"	class="form-control btn btn-default postal-area">주소검색</a>
                </div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="mainaddress" id="main-address" value="">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="detailaddress" id="address-detail-input" value="">
            </div>
            <div class="form-group">
                <label>대표자 번호</label>
                <input type="text" class="form-control" name="phonenumber" id="phone-number-input" value="010-2222-3333">
            </div>
            <div class="form-group">
                <label>사업자번호</label>
                <input type="text" class="form-control" name="businessnumber" id="business-number-input" value="5555-55-5555">
            </div>
            <div class="text-right">
                <button class="btn btn-lg btn-info btn-sm" >수정</button>
                <a href="" class="btn btn-primary btn-sm">메인</a>
            </div>
        </form>
    </div>
	

</div>
</body>
<script type="text/javascript">

</script>
</html>