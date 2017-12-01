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
	.mainthumbnail img {width: 280px;}
	.pro th {padding-top: 12px !important;}
	.pro td {padding-top: 12px !important;}
	.etc {padding-top: 12px !important;}
	.mainimage {height: 300px !important; padding: 0px !important;}
	.subimage img {width: 770px;}
	.subimage div {text-align: center;}
	.remot {width: 50px; height: 150px; #ccc; top: 350px; left: 50%; margin-left: 600px; position: fixed;}
	#table-area th {background-color: #e6f7ff;}
	#table-area {overflow-y: scroll !important; height: 150px;}
</style>
<body>
<c:set var="menu" value="product" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
            <div class="container">
				 <div class="col-sm-offset-1 col-sm-10">
				 
				 	<h1>${product.name }</h1>
				 	
                    <div class="row text-right">
                    	<a href="modifyForm.do?productId=${product.id }" class="btn btn-info btn-sm">수정</a>
                    	<a href="list.do" class="btn btn-primary btn-sm">목록</a>
                    </div>
                    
                    <!-- 상품 상세 내용 -->
					<div>
					    <table class="table">
					        <colgroup>
					            <col width="310px">
					            <col width="100px">
					        </colgroup>
							<tbody>
							    <tr>
							        <td class="mainthumbnail" rowspan="7"><img src="${product.image.path }"></td>
							        <th class="etc">상품번호</th>
							        <td class="etc">No.${product.id }</td>
							        <th>등록날짜</th>
							        <td colspan="3"><fmt:formatDate value="${product.createDate }"/></td>
							    </tr>
							    <tr class="pro">
							        <th>판매여부</th>
							        <td colspan="4">${product.show }</td>
							    </tr>
							    <tr class="pro">
							        <th>할인율</th>
							        <td colspan="3">${product.discountRatio }%</td>
							    </tr>
							    <tr class="pro">
							        <th>배송비</th>
							        <td>${product.deliveryFee }</td>
							    </tr>
							    <tr class="pro">
							        <th>카테고리</th>
							        <td colspan="3"> ${product.smallCategory.midCategory.bigCategory.name } > ${product.smallCategory.midCategory.name } > ${product.smallCategory.name } </td></tr>
							    </tr>
							    <tr><td colspan="7"></td></tr>
							</tbody>
					    </table>
					</div>
                    
                    <!-- 관련 상품 -->
					<div id="table-area">
					    <table class="table table-hover">
					        <thead>
					            <tr>
					                <th>번호</th>
					                <th>상품 옵션 이름</th>
					                <th>판매가</th>
					                <th>재고</th>
					            </tr>
					        </thead>
					        <tbody>
						        <c:forEach var="item" items="${items }">
						            <tr>
						                <td>${item.id }</td>
						                <td><a href="../item/detail.do?itemId=${item.id }">${item.options}</a></td>
						                <td>${item.salePrice} 원</td>
						                <td>${item.initialQuantity - item.saledQuantity} 개</td>
						            </tr>
						        </c:forEach>
					        </tbody>
					    </table>
					</div>
                    <hr />
                    <!-- 상품 설명 -->
                    <div class="subimage">
                        <p>${product.description }</p>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>