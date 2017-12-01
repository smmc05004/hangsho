<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>개별상품 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	.mainthumbnail img { width: 280px; }
	#stock-area { overflow-y: scroll; height: 230px;}
	#stock-area th { background: #e6f7ff; }
	#button-area, #detail-area, #stock-area { margin-bottom: 30px; }
</style>
<body>
<c:set var="menu" value="item" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
            <div class="container">
				 <div class="col-sm-offset-1 col-sm-10">
				 	
				 	<h1>${item.options }</h1>
				 
				 	<div class="row text-right" id="button-area">
                    	<a href="modifyForm.do?itemId=${item.id }" class="btn btn-info btn-sm">수정</a>
                    	<a href="list.do" class="btn btn-primary btn-sm">목록</a>
                    </div>
				 
                    <!-- 상품 상세 내용 -->
					<div class="row" id="detail-area">
					    <table class="table">
					        <colgroup>
					            <col width="310px">
					            <col width="100px">
					        </colgroup>
							<tbody>
							    <tr>
							        <td class="mainthumbnail" rowspan="7"><img src="${item.image.path }"></td>
							        <th class="etc">상품번호</th>
							        <td class="etc">${item.id }</td>
							        <th>등록날짜</th>
							        <td colspan="3"><fmt:formatDate value="${item.createdate }"/></td>
							    </tr>
							    <tr class="pro">
							        <th>입고량</th>
							        <td colspan="3">${item.initialQuantity }개</td>
							    </tr>
							    <tr class="pro">
							        <th>판매량</th>
							        <td colspan="3">${item.saledQuantity }개</td>
							    </tr>
							    <tr class="pro">
							        <th>원가</th>
							        <td>${item.originalPrice }원</td>
							    </tr>
							    <tr class="pro">
							        <th>판매가</th>
							        <td>${item.salePrice }원</td>
							    </tr>
							    <tr><td colspan="7"></td></tr>
							</tbody>
					    </table>
					</div>
					<hr />
					
					<h3> 재고 변화 현황</h3>
					<!-- 재고 영역 -->
					<div class="row" id="stock-area">
	                    <table class="table table-hover">
	                    	<thead>
	                    		<tr>
	                    			<th>번호</th>
	                    			<th>수량</th>
	                    			<th>사유</th>
	                    			<th>등록일</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody>
		                    	<c:forEach var="stock" items="${stocks }" varStatus="status">
		                    		<tr>
		                    			<td>${status.count }</td>
		                    			<td>${stock.quantity }</td>
		                    			<td>${stock.reasons }</td>
		                    			<td><fmt:formatDate value="${stock.historyDate }"/></td>
		                    		</tr>
		                    	</c:forEach>
	                    	</tbody>
	                    </table>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>