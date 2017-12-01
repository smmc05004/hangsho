<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<script src="js/category.js"></script>
<link rel="stylesheet" href="/resources/css/category.css">
<link rel="stylesheet" href="/resources/css/used.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>      
        
        <div class="container-fluid" id="body-main">
            
        <div class="container">
        <%@ include file="/WEB-INF/views/inc/categoryUsed.jsp" %>
        <div class="text-center">
            <h2>여성의류</h2>
        </div>
        <hr/>
        <div class="row">
                <div>
                    <ul class="categoryd">
                        <c:choose>
                    		<c:when test="${empty middleCategories }">
                    			<li><a href="index.do">전체</a></li>
	                    		<li><a href="index.do?bc=100">식품</a></li>
	                    		<li><a href="index.do?bc=200">패션</a></li>
	                    		<li><a href="index.do?bc=300">가전</a></li>
                    		</c:when>                    		
                    		<c:when test="${not empty middleCategories and empty smallCategories }">
                    				<li><a href="index.do?bc=${param.bc }">전체</a>
                    			<c:forEach var="middleCategory" items="${middleCategories }">
			                        <li><a href="index.do?bc=${param.bc }&mc=${middleCategory.id}">${middleCategory.name }</a></li>
		                    	</c:forEach>
                    		</c:when>
                    		<c:when test="${not empty smallCategories }">
                    				<li><a href="index.do?bc=${param.bc }&mc=${param.mc}">전체</a>
                    			<c:forEach var="smallCategory" items="${smallCategories }">
			                        <li><a href="index.do?bc=${param.bc }&mc=${param.mc}&sc=${smallCategory.id}">${smallCategory.name }</a></li>
		                    	</c:forEach>
                    		</c:when>
                    	</c:choose>                       
                    </ul>
                </div>                          
            </div>
        	<hr/>
            <div id="product-body" class="row">
                <ul class="list">
                <c:forEach var="item" items="${item }">
                    <li>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="${item.product.image.path }" width="100%"/>
                                    <div class="caption">
                                        <div>
                                            <p>${item.product.description }</p>
                                            <h4><strong>${item.product.name }</strong></h4>
                                            <h4 class="text-right"><strong>${item.salePrice }</strong><strong>원</strong></h4>
                                            <hr />
                                            <span class="pull-right"><small>${item.initialQuantity- itemList.saledQuantity }</small><small>개 구매</small></span>            
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
				</c:forEach>
                </ul>
                
            </div>
        </div>
    </div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>