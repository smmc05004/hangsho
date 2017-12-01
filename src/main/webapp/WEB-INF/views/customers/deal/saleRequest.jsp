<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/deallist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<c:set var="dealInfo" value="saleR" />
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
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>구분</th>
					<th>제목</th>
					<th>상태</th>
					<th>날짜</th>
					<th>요청</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty sreqs }">
					<tr>
						<td colspan="6" class="text-center">판매신청내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="sreq" items="${sreqs }">
					<tr>
						<td>${sreq.id }</td>
						<td>${sreq.type.name }</td>
						<c:choose>
							<c:when test="${sreq.type.id eq 'M' }">
								<td><a href="/merona/detail.do?no=${sreq.board.id }"><c:out value="${sreq.board.title }" /></a></td>
							</c:when>
							<c:otherwise>
								<td><a href="/used/detail.do?no=${sreq.board.id }"><c:out value="${sreq.board.title }" /></a></td>
							</c:otherwise>
						</c:choose>
						<td>${sreq.status.name }</td>
						<td><fmt:formatDate value="${sreq.createdate }" pattern="yyyy-MM-dd" /></td>
						<td><button class="btn btn-danger btn-xs" id="btn-cancel-request-${sreq.id }">삭제</button></td>
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
<script>
	$(function() {
		$('.pagination a').click(function(event) {
			event.preventDefault();			
			
			location.href = "saleRequest.do?pageNo=" + $(this).attr('href');
		});
		
		$("button[id^=btn-cancel-request]").click(function(event) {
    	  event.preventDefault();	  
    	  
    	  result = confirm("요청을 취소하시겠습니까?");
    	  if (result) {
    		  
	    	  var button = this;
	    	  var rNo = $(button).attr("id").replace("btn-cancel-request-", "");
	    	  
	    	  $.ajax({
	    		type:"POST",
	    		url:"/cancelrequest.do",
	    		data:{requestNo:rNo},
	    		dataType:"json",
	    		success:function(result) {
	    			$(button).closest('tr').remove();
	    		}
	    	  })    		  
    	  } else {
    		  return false;
    	  }   	  
      });
	})
</script>
</html>