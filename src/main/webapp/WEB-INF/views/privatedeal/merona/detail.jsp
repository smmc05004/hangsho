<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/mdetail.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>	
	 <div class="container-fluid">               
     	<div class="container">
        <%@ include file="/WEB-INF/views/inc/detailcategory.jsp" %> 
        	<h3>올때 메로나</h3>
          	<table class="table table-condensed">
          		<colgroup>
          			<col width="8%">
          			<col width="8%">
       				<col width="8%">
       				<col width="10%">
       				<col width="8%">
       				<col width="8%">
       				<col width="8%">
       				<col width="8%">
       				<col width="8%">
       				<col width="*">
       				<col width="8%">
       				<col width="8%">
       			</colgroup>          			
       			<tbody>
       				<tr>
       					<td colspan="10" class="title"><c:out value="${merona.title }" /></td>
       					<td colspan="2"><fmt:formatDate value="${merona.createdate }" pattern="yyyy-MM-dd HH:mm"/></td>
       				</tr>
       				<tr class="detailinfo">
       					<th>아이디</th>
       					<td><c:out value="${merona.customer.username }" /></td>
       					<th>닉네임</th>
       					<td><c:out value="${merona.customer.nickname }"></c:out></td>
       					<th>구분</th>
       					<td>${merona.division.name }</td>
       					<th>상태</th>
       					<td>${merona.status.name }</td>
       					<th>희망가격</th>
       					<c:choose>
       						<c:when test="${not empty merona.desiredprice }">
       							<td><fmt:formatNumber value="${merona.desiredprice }" pattern="#,###" />원</td>	
       						</c:when>
       						<c:otherwise>
       							<td>없음</td>
       						</c:otherwise>
       					</c:choose>       					
       					<th>조회수</th>
       					<td>${merona.clicked }</td>
       				</tr>
          		</tbody>
          	</table>
       		<div class="row contents well">
       			${merona.contents }
       		</div>
       		<div class="btnlist">
       			<c:if test="${(LOGIN_INFO.LOGIN_USER.id ne merona.customer.id) and merona.status.id ne 'DC'}">       				
      				<div class="text-center">
       					<button class="btn btn-info disabled" id="btn-req-${merona.customer.nickname }">1:1 채팅</button>
       					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">안전거래</button>	          			 		
       				</div>
        		</c:if>
        		<c:if test="${(not empty LOGIN_INFO) && (LOGIN_INFO.LOGIN_USER.id eq merona.customer.id) and merona.status.id ne 'DC'}">
         			<div class="text-center">
         				<a href="dpi.do?no=${merona.id }" class="btn btn-primary">일부거래중</a>          		
          				<a href="di.do?no=${merona.id }" class="btn btn-warning">거래중</a>          		
          				<a class="btn btn-default" id="dc">거래완료</a>	
         			</div>	          		
         			<div class="text-right">
         				<a href="/modify.do?no=${merona.id }" class="btn btn-default">수정</a>
          				<a class="btn btn-danger" id="deleteBoard">삭제</a> 
         			</div>
        		</c:if>	          		
       		</div>		

          	<div class="row comments well" id="comment-list">
          		<span>댓글 </span><em>${commentCount }</em>
          		<div class="commentlist">
          			<c:forEach var="comment" items="${comments }">          			
          				<c:choose>
          					<c:when test="${(comment.id eq comment.repliedId.id) and (comment.deleted eq 'N')}">
			          			<div>
				          			<strong><c:out value="${comment.customer.nickname }" /></strong><small> <fmt:formatDate value="${comment.createdate }" pattern="yyyy-MM-dd HH:mm"/></small>
				          			<button class="btn btn-info btn-xs" id="reply-${comment.id }">답글</button>
				          			<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq comment.customer.id) }">
					          			<div class="pull-right">
					          				<button class="btn btn-default btn-xs" id='btn-modify-comment-${comment.id }'>수정</button> <button class="btn btn-danger btn-xs" id="btn-del-comment-${comment.id }">삭제</button>
					          			</div>
					          		</c:if>				          			          					
			       					<p><c:out value="${comment.comment }" /></p>
			       				</div>
          					</c:when>
          					<c:when test="${(comment.id eq comment.repliedId.id) and (comment.deleted eq 'Y') and (comment.groupIdCount gt 1)}">
          						<div>
	          						<p>삭제된 댓글입니다.</p>          						
          						</div>
          					</c:when>
          					<c:when test="${(comment.id ne comment.repliedId.id) and (comment.deleted eq 'N')}">
          						<div>
				          			<strong>└ <c:out value="${comment.customer.nickname }" /></strong><small> <fmt:formatDate value="${comment.createdate }" pattern="yyyy-MM-dd HH:mm"/></small>
				          			<button class="btn btn-info btn-xs" id="reply-${comment.id }">답글</button>
				          			<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq comment.customer.id) }">
				          				<div class="pull-right">
				          					<button class="btn btn-default btn-xs" id='btn-modify-comment-${comment.id }'>수정</button> <button class="btn btn-danger btn-xs" id="btn-del-reply-${comment.id }">삭제</button>
				          				</div>
				          			</c:if>          					
			       					<p><span><c:out value="${comment.repliedId.customer.nickname }" /> </span><c:out value="${comment.comment }" /></p>
			       				</div>
          					</c:when>
          				</c:choose>	       					       		
       				</c:forEach>          			       				        				
     			</div>  
     			<div class="comment">
 					<form class="form-inline">
 						<div class="form-group">
 							<textarea class="form-control"></textarea>
							<button class="btn btn-info btn-lg" id="btn-add-comment">등록</button>
 						</div>	      						
 					</form>
 				</div>       			
     		</div>
		</div>       
    </div>

    <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">신청내용</h4>
	        </div>
	        <form action="/addRequest.do" method="post" id="request-form">
	        	<input type="hidden" name="boardNo" value="${merona.id }" />
		        <div class="modal-body">
		        	<div class="form-group">
		        		<textarea name="contents" rows="20" class="form-control" id="request-contents"></textarea>		        		
		        	</div>		         	
		         	<div class="form-group">
		         		<label for="">희망가격</label>
		         		<input type="number" name="desiredPrice" > 원
		         	</div>		         	
		        </div>
		        <div class="modal-footer">
		        	<button type="submit" class="btn btn-success" id="request">신청</button>
		         	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        </div>
	        </form>
	      </div>
	      
	    </div>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		
		$("#dc").click(function(event) {
			event.preventDefault();
			var result = confirm("거래완료하시겠습니까?");
			if (result) {
				$(location).attr('href', 'dc.do?no=${merona.id}');				
			} else {
				return false;
			}
		})
		
		$("#deleteBoard").click(function(event) {
			event.preventDefault();
			var result = confirm("정말 삭제하시겠습니까?");
			if (result) {
				$(location).attr('href', 'delete.do?no=${merona.id}');
			} else {
				return false;
			}
		})
		
		function reloading(){
			$.ajax({
				type:"GET",
				url:"/getCommentlist.do",
				data:{boardNo:'${merona.id}'},
				dataType:"json",
				success:function(result) {
					var html = "";
					$.each(result, function(index, comment) {
						if (comment.id == comment.repliedId.id && comment.deleted == 'N') {
							html += "<div> <strong>"+comment.customer.nickname+"</strong> <small>"+comment.createdate+" </small>";
							html += " <button class='btn btn-info btn-xs' id='reply-"+comment.id +"'>답글</button>";							
							if (comment.modified) {
								html += "<div class='pull-right'>";
								html += "<button class='btn btn-default btn-xs' id='btn-modify-comment-"+comment.id+"'>수정</button> <button class='btn btn-danger btn-xs' id='btn-del-comment-"+comment.id+"'>삭제</button> </div>";
							}
							html += "<p>"+comment.comment+"</p> </div>"
						} else if (comment.id == comment.repliedId.id && comment.deleted == 'Y' && comment.groupIdCount > 1) {
							html += "<div> <p>삭제된 댓글입니다.</p> </div>"
						} else if (comment.id != comment.repliedId.id && comment.deleted == 'N') {
							html += "<div> <strong>└ "+comment.customer.nickname+"</strong> <small>"+comment.createdate+" </small>";
							html += " <button class='btn btn-info btn-xs' id='reply-"+comment.id +"''>답글</button>";
							if(comment.modified) {							
								html += "<div class='pull-right'>";
								html += "<button class='btn btn-default btn-xs' id='btn-modify-comment-"+comment.id+"'>수정</button> <button class='btn btn-danger btn-xs' id='btn-del-reply-"+comment.id+"'>삭제</button> </div>";
							}
							html += "<p><span>"+comment.repliedId.customer.nickname+" </span>"+comment.comment+"</p> </div>"
						}						
					});					
					$(".commentlist").html(html);
					
					$.ajax({
						type:"GET",
						url:"/getCommentCount.do",
						data:{boardNo:'${merona.id}'},
						dataType:"json",
						success:function(result) {
							$("em").text(result);							
						}
					})
				}
			})
		}
    	
    	$("#btn-add-comment").click(function(event) {
    		event.preventDefault();
    	
    		$.ajax({
    			type:"POST",
    			url:"/addComment.do",
    			data:{comment:$(this).parent().find("textarea").val(), boardNo:'${merona.id}'},
    			dataType:"json",
    			success:function(result) {
    				if (result.success) {
    					var html = "<div>";
    					html += "<strong>"+result.comment.customer.nickname+"</strong>";
    					html += " <small>"+result.comment.createdate+"</small>";
    					html += " <button class='btn btn-info btn-xs' id='reply-"+result.comment.id +"'>답글</button>";    					
    					html += "<div class='pull-right'>";
    					html += "<button class='btn btn-default btn-xs' id='btn-modify-comment-"+result.comment.id+"'>수정</button> <button class='btn btn-danger btn-xs' id='btn-del-comment-"+result.comment.id+"'>삭제</button> </div>";    					
    					html += "<p>"+result.comment.comment+"</p> </div>";    					
    					
    					$(".commentlist").append(html);
    					
    					$("textarea").val("");
    					
    					$.ajax({
    						type:"GET",
    						url:"/getCommentCount.do",
    						data:{boardNo:'${merona.id}'},
    						dataType:"json",
    						success:function(result) {
    							$("em").text(result);							
    						}
    					})
    			
    				} else {
    					alert("로그인이 필요한 서비스입니다.");
    					$(location).attr('href', '/customers/login.do?error=deny');
    				}
    			}
    		})
    	});
		
		$(".commentlist").on('click', 'button[id^=btn-reply-comment]', function(event) {
			event.preventDefault();
			
			$(".replycomment").css("display", "none");
			
			var button = this;
			var rno = $(button).attr("id").replace("btn-reply-comment-", "");		
			
			$.ajax({
				type:"POST",
				url:"/addReply.do",
				data:{comment:$(this).parent().find("textarea").val(), boardNo:'${merona.id}', rno:rno},
				dataType:"json",
				success:function(result) {					
					if (result.success) {    					
    					
    					$("textarea").val("");
    					
    					reloading();
    			
    				} else {
    					alert("로그인이 필요한 서비스입니다.");
    					$(location).attr('href', '/customers/login.do?error=deny');
    				}			
				}
			})
			
		})
		
		$(".commentlist").on('click', 'button[id^=reply]', function() {     		
     		var button = this;
     		var no = $(button).attr("id").replace("reply-", "");
     		
     		var html = "";
			html += "<div class='replycomment'>";
			html += "<form class='form-inline'> <div class='form-group'>";
			html += "└ <textarea class='form-control'></textarea>";
			html += " <button class='btn btn-info btn-lg' id='btn-reply-comment-"+no+"'>등록</button> </div> </form> </div>";
			
			$(".replycomment").remove();
			$(button).closest('div').after(html);
    	})
    	
    	$(".commentlist").on('click', 'button[id^=btn-del-comment]', function() {
    		
    		var result = confirm("댓글을 삭제하시겠습니까?");
			if (result) {
	    		var button = this;
	    		var cNo = $(button).attr("id").replace("btn-del-comment-", "");
	    		
	    		$.ajax({
	    			type:"GET",
	    			url:"/delComment.do",
	    			data:{commentNo:cNo},
	    			dataType:"json",
	    			success:function(comment) {
	    				$(button).closest('div').parent().remove();
	    				
	    				reloading();
	    			}
	    		})				
			} else {
				return false;
			}
			
    	})
    	
    	$(".commentlist").on('click', 'button[id^=btn-del-reply]', function() {
    		
    		var result = confirm("답글을 삭제하시겠습니까?");
			if (result) {
	    		var button = this;
	    		var cNo = $(button).attr("id").replace("btn-del-reply-", "");
	    		
	    		$.ajax({
	    			type:"GET",
	    			url:"/delReply.do",
	    			data:{commentNo:cNo},
	    			dataType:"json",
	    			success:function(comment) {
	    				$(button).closest('div').parent().remove();
	    				
	    				reloading();
	    			}
	    		})
			} else {
				return false;
			}
    		
    	})
    	
    	$(".commentlist").on('click', 'button[id^=btn-modify-comment]', function() {			
    		
    		$("button[id^=btn-modify-cancel]").trigger("click");    		
    		
    		var button = this;
    		var cNo = $(button).attr("id").replace("btn-modify-comment-", "");
    		
    		$.ajax({
    			type:"GET",
    			url:"/getComment.do",
    			data:{commentNo:cNo},
    			dataType:"json",
    			success:function(comment) {
		    		var html = "";
					html += "<div class='comment'>";
		    		html += "<strong>"+comment.customer.nickname+"</strong>";
					html += " <small>"+comment.createdate+"</small>";
					html += " <button class='btn btn-default btn-xs' id='btn-modify-cancel-"+comment.id+"'>수정취소</button>";
					html += "<form class='form-inline'> <div class='form-group'>";
					html += "<textarea class='form-control'>"+comment.comment+"</textarea>";
					html += " <button class='btn btn-info btn-lg' id='btn-modify-complete-"+comment.id+"'>수정</button> </div> </form> </div>";
					
		    		$(button).closest('div').parent().html(html);
    			}
    		})    		
    		
    	});
		
		$(".commentlist").on('click', 'button[id^=btn-modify-complete]', function(event) {
			event.preventDefault();
			
			var button = this;
			var cNo = $(button).attr("id").replace("btn-modify-complete-", "");
			
			
			
			$.ajax({
				type:"POST",
				url:"/modifyComment.do",
				data:{comment:$(this).parent().find("textarea").val(), id:cNo},
				dataType:"json",
				success:function(comment) {
					reloading();
				}
			})
		})
		
		$(".commentlist").on('click', 'button[id^=btn-modify-cancel]', function(event) {
			
			var button = this;    		
			var cNo = $(button).attr("id").replace("btn-modify-cancel-", "");
			
    		$.ajax({
    			type:"GET",
    			url:"/getComment.do",
    			data:{commentNo:cNo},
    			dataType:"json",
    			success:function(comment) {
		    		var html = "";
		    		if (comment.id == comment.repliedId.id && comment.deleted == 'N') {
						html += "<div> <strong>"+comment.customer.nickname+"</strong> <small>"+comment.createdate+" </small>";
						html += " <button class='btn btn-info btn-xs' id='reply-"+comment.id +"'>답글</button>";				
						html += "<div class='pull-right'>";
						html += "<button class='btn btn-default btn-xs' id='btn-modify-comment-"+comment.id+"'>수정</button> <button class='btn btn-danger btn-xs' id='btn-del-comment-"+comment.id+"'>삭제</button> </div>";
						html += "<p>"+comment.comment+"</p> </div>"
			
					} else if (comment.id != comment.repliedId.id && comment.deleted == 'N') {
						html += "<div> <strong>└ "+comment.customer.nickname+"</strong> <small>"+comment.createdate+" </small>";
						html += " <button class='btn btn-info btn-xs' id='reply-"+comment.id +"''>답글</button>";										
						html += "<div class='pull-right'>";
						html += "<button class='btn btn-default btn-xs' id='btn-modify-comment-"+comment.id+"'>수정</button> <button class='btn btn-danger btn-xs' id='btn-del-reply-"+comment.id+"'>삭제</button> </div>";					
						html += "<p><span>"+comment.repliedId.customer.nickname+" </span>"+comment.comment+"</p> </div>"
					}
					
		    		$(button).closest('div').html(html);
    			}
    		})
			
		});
		
		$("#request").click(function(event) {
			event.preventDefault();
			
			if ($("#request-contents").val() == "") {
				
				alert("신청내용을 입력해주세요!");
				
				return false;
			} else {
				$("#request-form").submit();
			}
		
		})		
    	
	})
</script>
</html>