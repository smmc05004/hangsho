<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>등록된 개별상품 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
</style>
<body>
<c:set var="menu" value="review" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
            <div class="container">
            
            	<!--리뷰 리스트-->
                <div class="row">
                    <div class="row">
                       <h1>리뷰 리스트</h1>
                    </div>
                    <hr/>
                    
                    <!-- 검색창 -->
                    <div class="row text-right">
                        <form action="reviewList.do" class="form-inline" id="search-form">
                        	<input type="hidden" name="pageNo" value="${param.pageNo }" />
                            <select class="form-control" name="opt">
                                <option>선택</option>
                                <option value="productName" ${param.opt eq 'productName' ? 'selected' : '' }>상품명</option>
                                <option value="comment" ${param.opt eq 'comment' ? 'selected' : '' }>코멘트</option>
                            </select>
                            <input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
                            <div class="form-group">
                                <button type="submit" class="btn btn-info" id="search-btn">검색</button>
                            </div>
                        </form>
                    </div>
                    <hr />
                    
                    <!-- 리뷰 리스트 테이블-->
                    <div class="row" id="review-table">
                        <table class="table table-hover" id="sale-item">
                            <colgroup>
                                <col width="5%">
                                <col width="10%">
                                <col width="*%">
                                <col width="15%">
                                <col width="15%">
                                <col width="15%">
                                <col width="5%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>유저ID</th>
                                    <th>코멘트</th>
                                    <th>별점</th>
                                    <th>상품명</th>
                                    <th>등록일</th>
                                    <th>삭제유무</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="review" items="${reviews}">
	                            	<tr>
	                            		<td>${review.id}</td>
	                            		<td>${review.customer.username}</td>
	                            		<td>${review.comment}</td>
	                            		<td>${review.rates}</td>
	                            		<td>${review.product.name}</td>
	                            		<td><fmt:formatDate value="${review.createDate}"/></td>
	                            		<td>${review.deleted}</td>
	                            	</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                        
                    </div>
                                       
                    <!-- 페이지네이션-->
                    <%@ include file="/WEB-INF/views/abcompany/pagination.jsp" %>
                </div>
            	
            </div>  
        </div>
    </div>  
</body>
<script type="text/javascript">
$(function() {
	
	$('.pagination a').click(function(event) {
		event.preventDefault();
		$(':input[name=pageNo]').val($(this).attr('href')); // $(this) -> 내가 클릭한 것
		$('#search-form').submit();
	});
	
});
</script>
</html>