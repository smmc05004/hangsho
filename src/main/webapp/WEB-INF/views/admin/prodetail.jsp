<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-상품관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/prolist.css">
<style>
.mainthumbnail img {width: 280px;}
.pro th {padding-top: 12px !important;}
.pro td {padding-top: 12px !important;}
.etc {padding-top: 12px !important;}
.mainimage {height: 300px !important; padding: 0px !important;}
.subimage img {width: 770px;}
.subimage div {text-align: center;}
.remot {width: 50px; height: 150px; #ccc; top: 350px; left: 50%; margin-left: 600px; position: fixed;}
#body-container-body>div:first-child {margin-top: 50px;}
.itemtable th {background-color: #e6e6e6;}
.itemtable {overflow-y: scroll !important; height: 150px;}
#table-info th {background-color: #fff; }
</style>
</head>
<body>
<c:set var="menu" value="product"></c:set>
<c:set var="sidemenu" value="prolist"></c:set>
<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
<%@ include file="/WEB-INF/views/admin/sidenav/product.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
                    <div class="remot">
                        <a id="btn-top" class="btn btn-default btn-xm">▲</a>
                        <a id="btn-bottom" class="btn btn-default btn-xm">▼</a>
                    </div>
                    <div>
                        <table class="table">
                            <colgroup>
                                <col width="310px">
                                <col width="100px">
                            </colgroup>
                                <tbody id="table-info">
                                    <tr>
                                        <td class="mainthumbnail" rowspan="7"><img src="${product.image.path}"></td>
                                        <th class="etc">상품번호</th>
                                        <td class="etc">${product.id }</td>
                                        <th>등록날짜</th>
                                        <td colspan="3"><fmt:formatDate value="${product.createDate }" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                    <tr class="pro">
                                        <th>판매자</th>
                                        <td><a href="#">${product.company.name }</a></td>
                                        <th>판매여부</th>
                                        <td colspan="3">${product.show eq 'Y' ? '판매중' : '판매중지' }</td>
                                    </tr>
                                    <tr class="pro">
                                        <th>가격</th>
                                        <td colspan="3"><fmt:formatNumber value="${minPrice }" pattern="###,###,###"></fmt:formatNumber> 원</td>
                                    </tr>
                                    <tr class="pro">
                                        <th>할인율</th>
                                        <td colspan="3">${product.discountRatio }</td>
                                    </tr>
                                    <tr class="pro">
                                        <th>배송비</th>
                                        <td><fmt:formatNumber value="${product.deliveryFee }" pattern="###,###,###"></fmt:formatNumber> 원</td>
                                    </tr>
                                    <tr class="pro">
                                        <th>카테고리</th>
                                        <td colspan="3">${product.smallCategory.midCategory.bigCategory.name } > ${product.smallCategory.midCategory.name } > ${product.smallCategory.name }</td>
                                    </tr>
                                    <tr class="pro">
                                        <th>제목</th>
                                        <td colspan="3">${product.name }</td>
                                    </tr>
                                    <tr><td colspan="7"></td></tr>
                                </tbody>
                        </table>
                    </div>
                    <div class="itemtable">
                        <table class="table">
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
	                                    <td><a href="#">${item.options }</a></td>
	                                    <td><fmt:formatNumber value="${item.salePrice }" pattern="###,###,###"></fmt:formatNumber> 원</td>
	                                    <td>${item.initialQuantity - item.saledQuantity } 개</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="subimage">
                    	<c:forEach var="item" items="${items }">
	                        <div><img src="${item.image.path }"></div>
                    	</c:forEach>
                    </div>
                </div>
		</div>
	</div>

</body>
</html>