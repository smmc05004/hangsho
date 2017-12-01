<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>

<!-- 제품 상세 페이지 안 상품문의페이지네이션 -->
<div class="text-center">
	<ul class="pagination">
		<c:if test="${pagination.totalRows gt 0 }">
			<c:choose>
				<c:when test="${pagination.pageNo gt 1 }">
					<li><a href="${pagination.pageNo - 1 }">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><span>&lt;</span></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
				<li class="${pagination.pageNo eq num ? 'active' : '' }"><a href="${num }">${num }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${pagination.pageNo lt pagination.totalPages }">
					<li id="clicked"><a href="${pagination.pageNo + 1 }">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><span>&gt;</span></li>
				</c:otherwise>
			</c:choose>
		</c:if>
	</ul>
</div>