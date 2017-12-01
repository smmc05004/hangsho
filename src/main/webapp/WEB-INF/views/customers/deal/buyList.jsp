<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/deallist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<c:set var="dealInfo" value="buyL" />
<%@ include file="/WEB-INF/views/customers/inc.jsp"%>
<%@ include file="/WEB-INF/views/customers/deal/inc/navi.jsp"%>
	<div class="deallist">
		<table class="table table-condensed">
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="*">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>구분</th>
					<th>제목</th>
					<th>날짜</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty boughts }">
					<tr>
						<td colspan="6" class="text-center">구매내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="bought" items="${boughts }">
					<tr>
						<td>${bought.id }</td>
						<td>${bought.type.name }</td>
						<td><a href="/deal/detail.do?no=${bought.id }"><c:out value="${bought.board.title }" /></a></td>
						<td><fmt:formatDate value="${bought.createdate }" pattern="yyyy-MM-dd" /></td>
						<c:choose>
							<c:when test="${bought.cancel eq 'Y' }">
								<td>거래취소</td>
							</c:when>
							<c:otherwise>
								<td>${bought.status.name }</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/inc/paginations.jsp" %>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
<script type="text/javascript">
$(function() {
	$('.pagination a').click(function(event) {
		event.preventDefault();			
		
		location.href = "buyList.do?pageNo=" + $(this).attr('href');
	});
})
</script>
</html>