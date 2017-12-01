<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>QnA 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
</style>
<body>
<c:set var="menu" value="qna" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
            <div class="container">

				<!--리뷰 리스트-->
                <div class="row">
                    <div class="row">
                       <h1>리뷰 리스트</h1>
                    </div>
                    <hr/>
                    
                    <!-- 검색창 -->
                    <div class="row text-right">
                        <form action="qna.do" class="form-inline" id="search-form">
                        	<input type="hidden" name="pageNo" value="${param.pageNo }" />
                            <select class="form-control" name="opt">
                                <option>선택</option>
                                <option value="title" ${param.opt eq 'title' ? 'selected' : '' }>제목</option>
                                <option value="productName" ${param.opt eq 'productName' ? 'selected' : '' }>상품명</option>
                            </select>
                            <input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
                            <div class="form-group">
                                <button type="submit" class="btn btn-info" id="search-btn">검색</button>
                            </div>
                        </form>
                    </div>
                    <hr />
                    
                    <!-- 리뷰 리스트 테이블-->
                    <div class="row" >
                        <table class="table table-hover" id="question-table">
                            <colgroup>
                                <col width="5%">
                                <col width="10%">
                                <col width="15%">
                                <col width="*%">
                                <col width="15%">
                                <col width="15%">
                                <col width="5%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>글쓴이</th>
                                    <th>제목</th>
                                    <th>상품명</th>
                                    <th>등록일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="productQues" items="${searchMap.productQues }">
	                            	<tr data-productId="${productQues.product.id }" data-questionId="${productQues.id}">
	                            		<td>${productQues.id }</td>
	                            		<td>${productQues.customer.nickname }</td>
	                            		<td id="title-td-${productQues.id }" style="cursor:pointer">${productQues.title }</td>
	                            		<td>${productQues.product.name }</td>
	                            		<td><fmt:formatDate value="${productQues.createDate }"/></td>
	                            		<td id="status">${productQues.status }</td>
	                            	</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
					
					<div class="modal fade" id="answer-form-modal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">답변 등록</h4>
								</div>
								<form method="POST">
									<input type="hidden" id="modal-product-id" name="productId" value=""/>
									<input type="hidden" id="modal-question-id" name="questionId" value=""/>
									<div class="modal-body">
										<div class="form-group">
											<label>질문</label>
											<textarea rows="5" class="form-control" name="question" id="question"></textarea>
										</div>
										<div class="form-group">
											<label>답변</label>
											<textarea rows="5" class="form-control" name="answer" id="answer"></textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-sm btn-primary" id="btn-add">등록</button>
										<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">닫기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					
                    <!-- 페이지네이션-->
                    <%@ include file="/WEB-INF/views/abcompany/pagination.jsp" %>
                </div>

            </div>  
        </div>
    </div>  
</body>
<script type="text/javascript">
$(function() {
	
	$("td[id^=title-td]").click(function() {
		
		$("#modal-product-id").val($(this).closest("tr").attr("data-productId"));
		$("#modal-question-id").val($(this).closest("tr").attr("data-questionId"));
		
		var productId = $("input[name=productId]").val();
		var answer = $("textarea[name=answer]").val();
		var questionId = $("input[name=questionId]").val();
		
		$.ajax({
			type:"GET",
			url:"getAnswer.do",
			data:{
				questionId: questionId
			},
			dataType:"json",
			success:function(result) {
				console.log(result)
				if (result.productAns != null) {
					if (result.productAns.qna.status == 'Y') { 
	 					 
						var answer = result.productAns.answer;
						var question = result.productAns.qna.question;
						
						$("textarea[name=question]").val(question);
						$("textarea[name=answer]").val(answer);
						
						$(".modal-footer").find("button[id=btn-add]").removeClass().addClass("hidden");
						
						var html = "";
						
						html += "<button class='btn btn-sm btn-warning' id='btn-modify-"+questionId+"'>수정</button>"
						html += "<button type='button' class='btn btn-sm btn-default' data-dismiss='modal'>닫기</button>";
						$(".modal-footer").empty().html(html);
						
						$("#answer-form-modal").modal("show");
						
					 }
				} else if(result.productQue != null) {

					var question = result.productQue.question;
					console.log(question);
						 
					$("textarea[name=question]").val(question);
						 
					$("textarea[name=answer]").val("");
					
					$("#answer-form-modal").modal("show");
						 
					$("#btn-add").click(function(event) {
						 event.preventDefault();
						
						var productId = $("input[name=productId]").val();
						console.log(productId);
						var answer = $("textarea[name=answer]").val();
						console.log(answer);
						var questionId = $("input[name=questionId]").val();
						console.log(questionId);
						 
						$.ajax({
						 type:"POST",
						 url:"addAnswer.do",
						 data:{
							 questionId: questionId,
							 productId: productId,
							 answer: answer
						 },
						 dataType:"json",
						 success:function(result) {
						 console.log(result)
							 
							$("textarea[name=answer]").val("");
									
							var status = $("#question-table tbody td[id^=title-td-"+questionId+"]").closest("tr").find("td[id^=status]")
								status.text("Y");
							 
						 }, complete:function() {
							 $("#answer-form-modal").modal("hide");
						 }
						 
					 	}); 
						
					});		
				}
			}
		});
	});
	
	$('.pagination a').click(function(event) {
		event.preventDefault();
		$(':input[name=pageNo]').val($(this).attr('href')); // $(this) -> 내가 클릭한 것
		$('#search-form').submit();
	});
	
});
</script>
</html>