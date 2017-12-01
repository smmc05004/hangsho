<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/cart.css">	
<style>
	
	.minus-btn {
		width:18px;
	}
	.plus-btn {
		width:18px;
	}
</style>
<script type="text/javascript">
	$(function() {
		var totalPrice = 0;
		$("span.saleprice").each(function() {
			totalPrice += parseInt($(this).text());
			
		});
		
		var payPrice = 0;
		$("strong.priceall").each(function() {
			payPrice += parseInt($(this).text());
		});
		$("#payall").text(payPrice);
		
		var deliveryPrice = 0;
		$(".deliverys").each(function() {
			deliveryPrice += parseInt($(this).text());
		});
		$("#deliveryall").text(deliveryPrice);
		
		$("#payprice").text(payPrice + deliveryPrice);
		
		$("#btn-delete").click(function() {
			$(".products").each(function () {
				$(this).parents(".deleteList").remove();
			});
			deliveryPrice = 0;
			$(".deliverys").each(function() {
				deliveryPrice += parseInt($(this).text());
			}); 
			payPrice = 0;
			$("strong.priceall").each(function() {
				payPrice += parseInt($(this).text());
			});
			$("#payall").text(payPrice);
			$("#item-qty").text($("#item-tbody tr.deleteList").length);
			$("#payprice").text(payPrice + deliveryPrice);
		});
		
	
		$("#item-qty").text($("#item-tbody tr.deleteList").length);
	});
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<div class="container">
    <div class="header">
        <h2><strong>카트<p>&#40; <span id="item-qty"></span> &#41;</p></strong></h2>

    </div>
   <table class="table table-hover">
       <colgroup>
           <col width="5%">
           <col width="*%">
           <col width="15%">
           <col width="13%">
       </colgroup>
       <thead>
            <tr>
               <th><input type="checkbox" checked="checked" /></th>
               <th><span><small>상품정보</small></span></th>
               <th><span><small>상품금액</small></span></th>
               <th><span><small>배송비</small></span></th>
            </tr>
        </thead>
        <tbody id="item-tbody">
            <ul class="deleteList">
                <li>
                <form action="/order/orderPage.do" method="post">
                	<input type="hidden" name="productId">
                </form>
                <c:forEach items="${products }" var="product">
                <tr class="deleteList">
                        <td>
                            <div class="form-group">
                                <input type="checkbox" class="products" checked />
                            </div>
                        </td>
                        <td>
                            <div class="col-sm-2">
                                <img src="${product.image.path }" alt="사진" />
                            </div>
                            <div class="col-offset-sm-1 col-sm-10">
                                <div class="row" id="product-title">
                                    <h4><strong><a href="">${product.name }</a></strong></h4>
                                    <input type="hidden" name="productId" value="${product.id }">
                                </div>
                                <ul>
                                	<c:set var="price" value="0"/>
	                                <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
	                                <c:if test="${product.id == cartDetail.item.product.id && cartDetail.productQuantity > 0}">
	                                    <li>
	                                        <div class="row">
	                                            <div class="col-sm-6">
	                                               <span>${cartDetail.item.options }</span>
	                                               <input type="hidden" name="itemId" value="${cartDetail.item.id }">
	                                            </div>
	                                            <div class="col-sm-3">
	                                                <div class="btn-group">
	                                                    <input type="button" value="-" class="minus-btn">
	                                                    <input type="text" name="proqty" id="amount-input" value="${cartDetail.productQuantity}"/>
	                                                    <input type="button" value="+" class="plus-btn">
	                                                </div>
	                                            </div>
	                                            <div class="col-sm-3">
	                                                <div class="text-right">
	                                                    <span class="saleprice">${cartDetail.item.salePrice }</span><span>원</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </li>
	                                                    <c:set var="price" value="${price + cartDetail.productQuantity * cartDetail.item.salePrice }"/>
	                                </c:if>
	                                </c:forEach>
	                                
                                </ul>
                            </div>
                        </td>
                        <td>
                            <div id="product-price">
                                <strong class="priceall">${price }</strong><strong>원</strong>
                            </div>
                        </td>
                        <td><div id="product-price">
                                <strong class="deliverys">${product.deliveryFee }</strong><strong>원</strong>
                            </div></td>
                    </tr>
                </c:forEach>
                
         <%--            <tr class="deleteList">
                        <td>
                            <div class="form-group">
                                <input type="checkbox" class="products" checked />
                            </div>
                        </td>
                        <td>
                            <div class="col-sm-2">
                                <img src="${image.path }" alt="사진" />
                            </div>
                            <div class="col-offset-sm-1 col-sm-10">
                                <div class="row" id="product-title">
                                    <h4><strong><a href="">${product.name }</a></strong></h4>
                                    <input type="hidden" name="productId" value="${product.id }">
                                </div>
                                <ul>
                                
	                                <c:forEach var="items" items="${itemDetail }" varStatus="status">
	                                <c:if test="${quantity[status.index] != 0}">
	                                    <li>
	                                        <div class="row">
	                                            <div class="col-sm-6">
	                                               <span>${items.options }</span>
	                                               <input type="hidden" name="itemId" value="${items.id }">
	                                            </div>
	                                            <div class="col-sm-3">
	                                                <div class="btn-group">
	                                                    <input type="button" value="-" class="minus-btn">
	                                                    <input type="text" name="proqty" id="amount-input" value="${quantity[status.index]}"/>
	                                                    <input type="button" value="+" class="plus-btn">
	                                                </div>
	                                            </div>
	                                            <div class="col-sm-3">
	                                                <div class="text-right">
	                                                    <span class="saleprice">${items.salePrice }</span><span>원</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </li>
	                                </c:if>
	                                </c:forEach>
	                                
                                </ul>
                            </div>
                        </td>
                        <td>
                            <div id="product-price">
                                <strong class="priceall"></strong><strong>원</strong>
                            </div>
                        </td>
                        <td><div id="product-price">
                                <strong class="deliverys">${product.deliveryFee }</strong><strong>원</strong>
                            </div></td>
                    </tr> --%>
                </li>
            </ul>

       </tbody>
    </table>
    <div class="row">
        <div id="bottom-button-group" class="col-sm-3">

            <a href="deleteCart.do" class="btn btn-sm btn-default" id="btn-delete">삭제</a>
        </div>
        <div class="col-sm-offset-3 col-sm-6">
            <span><small>카트에 담긴 상품은 최대 30일까지 보관되며 종료되거나 매진될 경우 자동으로 삭제됩니다.</small></span>
        </div>
    </div>
   
    <table class="table table-hover">
       <colgroup>
           <col width="*%">
           <col width="28%">
       </colgroup>
       <tbody>
            <tr id="total-price">
                <td>
                    <div class="row">
                        <h2><strong>총주문금액</strong></h2>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <div class="col-sm-6"><h5><strong>총상품금액</strong></h5></div>
                        <div class="col-sm-6 text-right"><h5><strong id="payall"></strong><strong>원</strong></h5></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6"><h5><strong>배송비</strong></h5></div>
                        <div class="col-sm-6 text-right"><h5><strong id="deliveryall"></strong><strong>원</strong></h5></div>
                    </div>
               </td>
            </tr>
            <tr style="color: darkorange" id="expected-price">
                <td>
                    <div class="row">
                        <h4><strong>결제 예상금액</strong></h4>
                    </div>
                </td>
               <td class="text-right">
                   <div>
                       <h3><strong id="payprice"></strong><strong>원</strong></h3>
                   </div>
               </td>
           </tr>
       </tbody>
    </table>
    <div class="row" id="btn-area">
        <a href="/index.do" class="btn btn-default" id="keep-shoppig-btn"><p>쇼핑 계속하기</p></a>
        <a href="/order/orderPage.do" class="btn btn-default" id="purchasing"><p>구매하기</p></a>
    </div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>