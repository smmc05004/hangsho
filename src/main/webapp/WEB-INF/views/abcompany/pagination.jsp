<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 페이지네이션 -->
	
	<div class="text-center">
        <ul class="pagination">
	        <c:if test="${criteria.totalRows gt 0 }">
	        
	        	<c:choose>
	        		<c:when test="${criteria.pageNo gt 1}">
			            <li><a href="${criteria.pageNo - 1}">&lt;</a></li>
	        		</c:when>
					<c:otherwise>
					    <li><a class="disabled">&lt;</a></li>
					</c:otherwise>	        	
	        	</c:choose>
	        	        
	            <c:forEach var="num" begin="${criteria.beginPage }" end="${criteria.endPage }">
	            	<li class="${criteria.pageNo eq num ? 'active' : '' }"><a href="${num }">${num }</a></li>	
	            </c:forEach>
	            
	            
	            <c:choose>
	        		<c:when test="${criteria.pageNo lt criteria.totalPages}">
			            <li><a href="${criteria.pageNo + 1}">&gt;</a></li>
	        		</c:when>
					<c:otherwise>
					    <li><a class="disabled">&gt;</a></li>
					</c:otherwise>	        	
	        	</c:choose>
	            
	        </c:if>
        </ul>
    </div>
    
</body>
</html>