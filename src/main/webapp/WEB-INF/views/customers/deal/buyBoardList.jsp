<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/deallist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<c:set var="dealInfo" value="buyB" />
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
				<c:if test="${empty buys }">
					<tr>
						<td colspan="6" class="text-center">등록한 구매글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="buy" items="${buys }">
					<tr>
						<td>${buy.id }</td>
						<td>${buy.type.name }</td>
						<c:choose>
							<c:when test="${buy.type.id eq 'M' }">
								<td><a href="/merona/detail.do?no=${buy.id }"><c:out value="${buy.title }" /></a></td>
							</c:when>
							<c:otherwise>
								<td><a href="/used/detail.do?no=${buy.id }"><c:out value="${buy.title }" /></a></td>
							</c:otherwise>
						</c:choose>
						<td>${buy.status.name }</td>
						<td><fmt:formatDate value="${buy.createdate }" pattern="yyyy-MM-dd" /></td>
						<td><button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#call" id="btn-request-${buy.id }">${buy.requestCnt }건</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/inc/paginations.jsp" %>
	</div>
	</div>
	</div>
	</div>

	<div class="modal fade" id="call" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">요청 목록</h4>
				</div>
				<form action="/approveRequestB.do" method="post" id="approveRequest">
					<div class="modal-body">
						<ul class="calllist">

						</ul>
						<input type="checkbox" id="allCheck"> 전체선택
					</div>
					<div id="navi">
					
					</div>
					<div class="modal-footer">
						<div class="text-center">
							<button class="btn btn-success" id="approve">승인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
<script>
$(function() {
	$('.pagination a').click(function(event) {
		event.preventDefault();			
		
		location.href = "buyBoardList.do?pageNo=" + $(this).attr('href');
	});
	
	$("#navi").on('click', '.pager a', function(event) {
		event.preventDefault();
		
		var bNo = $(":input[name=boardNo]").val();
		var pNo = $(this).attr('href');
		
		$.ajax({
			type:"GET",
			url:"/getRequests.do",
			data:{boardNo:bNo, pageNo:pNo},
			dataType:"json",
			success:function(result) {
				var html = "";
			    html += "<input type='hidden' name='boardNo' value='"+bNo+"' />";
				$.each(result.requests, function(index, request) {
  				  html += "<li>";
  				  html += "<input type='checkbox' name='requests' value='"+request.id+"'>";
  				  html += "<p>"+request.requestor.nickname+" <span class='pull-right'>"+request.createdate+"</span></p>";
  				  html += "<p>"+request.contents+"</p>";
  				  if (request.desiredPrice != null) {
  				  	html += "<p>희망가격 : "+request.desiredPrice+"원";
  				  } else {    				  	
  				  	html += "<p>희망가격 : 없음";
  				  }
  				  html += "<button class='btn btn-danger btn-xs pull-right' id='btn-request-deny-"+request.id+"'>거절</button></p>";
  				  html += "</li>";
	  			})
	  			$(".calllist").html(html);  
				
				var pageHtml = "";
				if (result.navi.totalRows > 0) {
					pageHtml += "<div class='text-center'>";
					pageHtml += "<ul class='pager'>";
					if (result.navi.pageNo > 1) {
						pageHtml += "<li><a href='"+ (result.navi.pageNo - 1) +"'>이전</a></li>";						
					} else {
						pageHtml += "<li class='disabled'><span>이전</span></li>";
					}
					if (result.navi.pageNo < result.navi.totalPages) {
						pageHtml += " <li><a href='"+ (result.navi.pageNo + 1) +"'>다음</a></li>";
					} else {
						pageHtml += " <li class='disabled'><span>다음</span></li>";
					}
					pageHtml += "</ul>";					
					pageHtml += "</div>";					
				}
				$("#navi").html(pageHtml);
			}
		})
	});	
	
    $("button[id^=btn-request]").click(function() {
  	  var button = this;
  	  var bNo = $(button).attr("id").replace("btn-request-", "");
  	  
  	  $.ajax({
  		  type:"GET",
  		  url:"/getRequests.do",
  		  data:{boardNo:bNo},
  		  dataType:"json",
  		  success:function(result) {
  			  var html = "";    			  
			  html += "<input type='hidden' name='boardNo' value='"+bNo+"' />";
  			  $.each(result.requests, function(index, request) {
  				  html += "<li>";
  				  html += "<input type='checkbox' name='requests' value='"+request.id+"'>";
  				  html += "<p>"+request.requestor.nickname+" <span class='pull-right'>"+request.createdate+"</span></p>";
  				  html += "<p>"+request.contents+"</p>";
  				  if (request.desiredPrice != null) {
  				  	html += "<p>희망가격 : "+request.desiredPrice+"원";
  				  } else {    				  	
  				  	html += "<p>희망가격 : 없음";
  				  }
  				  html += "<button class='btn btn-danger btn-xs pull-right' id='btn-request-deny-"+request.id+"'>거절</button></p>";
  				  html += "</li>";
  			  })
  			  $(".calllist").html(html);
  			  
  			  var pageHtml = "";
			  if (result.navi.totalRows > 0) {
				pageHtml += "<div class='text-center'>";
				pageHtml += "<ul class='pager'>";
				if (result.navi.pageNo > 1) {
					pageHtml += "<li><a href='"+ (result.navi.pageNo - 1) +"'>이전</a></li>";						
				} else {
					pageHtml += "<li class='disabled'><span>이전</span></li>";
				}
				if (result.navi.pageNo < result.navi.totalPages) {
					pageHtml += " <li><a href='"+ (result.navi.pageNo + 1) +"'>다음</a></li>";
				} else {
					pageHtml += " <li class='disabled'><span>다음</span></li>";
				}
				pageHtml += "</ul>";					
				pageHtml += "</div>";					
			  }
			  $("#navi").html(pageHtml);
  		  }
  	  })
    });
    
    $(".calllist").on('click', 'button[id^=btn-request-deny]', function(event) {
  	  event.preventDefault();
  	  
  	  var button = this;
  	  var rNo = $(button).attr("id").replace("btn-request-deny-", "");
  	  
  	  $.ajax({
  		  type:"POST",
  		  url:"/denyRequest.do",
  		  data:{requestNo:rNo},
  		  dataType:"json",
  		  success:function(result) {
  			  $(button).closest('li').remove();
  		  }
  	  })
    })
    
    $("#allCheck").click(function() {
  	  var isallcheck = $(this).is(":checked");
  	  var $checkbox = $(':input[name=requests]');
  	  
  	  if (isallcheck) {
  		  $checkbox.prop("checked", true);
  	  } else {
  		  $checkbox.prop("checked", false);
  	  }
    })
    
    $("#approve").click(function(event) {
  	  
  	  event.preventDefault();
  	  
  	  if (!$(":input[name=requests]").is(":checked")) {
  		  alert("승인하실 요청을 선택해주세요!");
  		  return false;
  	  }
  	  
  	  result = confirm("승인하시면 거래가 시작됩니다. 거래내역을 확인해주세요");
  	  if (result) {
  		  $("#approveRequest").submit();
  	  } else {
  		  return false;
  	  }
    })
})
</script>
</html>