<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-상품관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/prolist.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment@2.19.2/moment.min.js"></script>
<style>
#qna-modal table th {background-color: #f2f2f2;}
</style>
<script type="text/javascript">
$(function() {
	
	$(".click-title").click(function() {
		$("#qna-modal").modal("show");
		var qnaId = $(this).children("input").val();
		$.ajax({
			type:"GET",
			url:"getqna.do",
			data:{qnaId:qnaId},
			dataType:"json",
			success:function(result) {
				var dates = moment(new Date(result.createDate)).format("YYYY-MM-DD");
				$("#qnaid").val(result.id);
				$("#type").text(result.type);
				$("#customer").text(result.customer.name);
				$("#date").text(dates);
				$("#completed").text(result.replyId == 0 ? '답변작성중' : '답변완료');
				$("#title").text(result.title);
				$("#contents").text(result.contents);
				$("#attached").text(result.attachedFile == null ? '-' : '');
				$("#replyId").val(result.replyId);				
				var replyId = $("#replyId").val();
				console.log(replyId);
				$.ajax({
					type:"GET",
					url:"getqna.do",
					data:{qnaId:replyId},
					dataType:"json",
					success:function(reply) {
						console.log(reply);
						$("#reply-contents").text(reply.contents);
					}
				})
			}
		});
	})
});
</script>
</head>
<body>
<c:set var="menu" value="qna"></c:set>
<c:set var="sidemenu" value="qna"></c:set>
<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
<%@ include file="/WEB-INF/views/admin/sidenav/qna.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
				<h3>문의 리스트</h3>
				<hr />
				<div class="searchform text-right">
					<form class="form-inline">
					<!-- 	<div class="form-group pull-left">
							<button class="btn btn-sm btn-default">답변작성</button>
							<button class="btn btn-sm btn-default">답변완료</button>
						</div> -->
						<div class="form-group">
							<input type="date" class="form-control input-sm" name="begindate" />
							<span>~</span> <input type="date" class="form-control input-sm"
								name="enddate" />
						</div>
						<div class="form-group">
							<select class="form-control input-sm">
								<option>유형전체</option>
								<option>반품문의</option>
								<option>상품문의</option>
								<option>취소문의</option>
							</select> <input type="text" class="form-control input-sm" name="keyword" />
							<button class="btn btn-info btn-sm">조회</button>
						</div>
					</form>
				</div>
				<div class="listtable">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>유형</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>답변유무</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="qna" items="${qnas }">
								<c:choose>
									<c:when test="${qna.id eq qna.replyId }">
										<tr class="complete">
											<td></td>
											<td><a href="#" class="click-title">→ 답변입니다.<input class="hidden" value="${qna.id }"/></a></td>
											<td>행복쇼핑</td>
											<td colspan="2">2017-05-13</td>
										</tr>
									</c:when>
									<c:when test="${qna.replyId eq 0}">
										<tr>
											<td>${qna.type }</td>
											<td><a href="#" class="click-title">${qna.title }<input class="hidden" value="${qna.id }"/></a></td>
											<td>${qna.customer.name }</td>
											<td><fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd" /></td>
											<td><label class="btn btn-info btn-xs">답변작성</label></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td>${qna.type }</td>
											<td><a href="#" class="click-title">${qna.title }<input class="hidden" value="${qna.id }"/></a></td>
											<td>${qna.customer.name }</td>
											<td><fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd" /></td>
											<td><label class="btn btn-default btn-xs">답변완료</label></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal fade" id="qna-modal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">문의 관리</h4>
							</div>
							<form action="addreply.do">
								<input type="hidden" name="itemId" />
								<div class="modal-body">
									
									<div class="form-group">
										<table class="table table-bordered">
											<colgroup>
												<col width="15%">
												<col width="35%">
												<col width="15%">
												<col width="35%">
											</colgroup>
											<tbody>
												<tr>
													<th>유형</th><td id="type">배송문의</td>
													<th>작성자</th><td id="customer">김가가</td>
												</tr>
												<tr>
													<th>날짜</th><td id="date">2011-11-11</td>
													<th>답변유무</th><td id="completed">답변완료</td>
												</tr>
												<tr>
													<th>제목</th><td colspan="3" id="title">배송왜케안와</td>
												</tr>
												<tr>
													<td colspan="4" id="contents">배송오라고오오오오오오옥</td>
												</tr>
												<tr>
													<th>첨부파일</th><td id="attached" colspan="3">첨부파일</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="form-group">
										<input class="hidden" name="qnaId" id="qnaid"/>
										<input class="hidden" name="replyId" id="replyId"/>
										<label>답변하기</label>
										<textarea rows="5" id="reply-contents" class="form-control" name="contents"></textarea>
									</div>
										
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-sm btn-primary" id="btn-accumulate-stock">수정/등록</button>
									<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="text-center">
					<ul class="pagination">
						<li><a href="#">&lt;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>