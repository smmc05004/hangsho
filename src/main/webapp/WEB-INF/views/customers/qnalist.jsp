<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<%@ include file="/WEB-INF/views/customers/inc.jsp"%>

	<!-- Tab panes -->
	<div role="tabpanel" class="tab-pane" id="questions">
		<div class="container" id="ques-answer">
		<hr>
			<span><a href="#">상품 문의/답변</a></span>| <span><a href="#">1:1문의
					답변</a></span>
		</div>
		<hr />
<!-- 		<div class="row">
			<div style="margin-top: 20px" class="btn-group col-sm-3 date-btn"
				role="group">
				<button type="button" class="btn btn-warning btn-sm">전체</button>
				<button type="button" class="active btn btn-warning btn-sm">3개월</button>
				<button type="button" class="btn btn-warning btn-sm">6개월</button>
				<button type="button" class="btn btn-warning btn-sm">1년</button>
			</div>
		</div> -->
		<table border="1" class="table table-condensed custom-table4">
			<colgroup>
				<col width="170">
				<col width="500">
				<col width="121">
				<col width="139">
			</colgroup>
			<thead>
				<tr>
					<th scope="colgroup">상품명</th>
					<th scope="col">문의내용</th>
					<th scope="col">등록일</th>
					<th scope="col">답변여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty questionList }">
						<c:forEach var="qna" items="${questionList}">
							<tr>
								<td class="exist-ques-lst1"><a
									href="/hangshoproducts/detail.do?productId=${qna.product.id }">${qna.product.name }</a></td>
								<td class="exist-ques-lst2"> <a href=javascript:showModal(${qna.id})>${qna.question } </a></td>
								<td class="exist-ques-lst3"><fmt:formatDate
										value="${qna.createDate }" pattern="yyyy-MM-dd" /></td>
								<td class="exist-ques-lst4">${qna.status == 'N' ? '답변보류' : '답변완료'}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="none_lst text-center"><strong>답변/문의내용이
									없습니다.</strong><br></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</div>
	<!-- Modal -->
<div id="replyModel" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-header">답변</h4>
      </div>
      <div class="modal-body">
        <p id="modal-body">답변 내용</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- customers/inc 파일에서 div.container태그가 열린상태로 남아있기때문에 닫아주기 위함. -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
<script>
	var showModal = function(queId){
		console.log(queId);
		$.ajax({
			url:"getAnswer.do",
			data : {proqueId : queId},
			dataType : "json",
			type : "GET",
			success : function(result){
				if(result){
					var date = new Date(result.createDate);
					$('#modal-header').text('답변   (답변시간 : '+date.toLocaleString()+')');
					$('#modal-body').text(result.answer);
					$("#replyModel").modal("show");
				}
			}, error : function() {
					alert('아직 답변이 작성되지 않았습니다.');
			} 
		})
	}
</script>
</html>