<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/dealdetail.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<div class="container">
		<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.seller.id) and deal.cancel eq 'N' }">
			<h4>판매 상세 내역</h4>
		</c:if>
		<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.buyer.id) and deal.cancel eq 'N' }">
			<h4>구매 상세 내역</h4>
		</c:if>
		<c:if test="${deal.cancel eq 'Y' }">
			<h4>취소된 거래입니다.</h4>
		</c:if>	
		<table class="table table-condensed dealInfo">
			<tbody>
				<tr>				
					<th>${deal.type.name }</th>
					<td><a href="/merona/detail.do?no=${deal.board.id }"><c:out value="${deal.board.title }" /></a></td>
					<td><fmt:formatDate value="${deal.createdate }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</tbody>
		</table>
		<div class="text-center btn_list">
			<button class="btn btn-${deal.status.id eq 'PH' ? 'success' : 'default' } btn-lg">결제대기중</button> ···
			<button class="btn btn-${deal.status.id eq 'PC' ? 'success' : 'default' } btn-lg">결제완료</button> ···
			<button class="btn btn-${deal.status.id eq 'PR' ? 'success' : 'default' } btn-lg">상품준비중</button> ···
			<button class="btn btn-${deal.status.id eq 'PRC' ? 'success' : 'default' } btn-lg">상품준비완료</button> ···
			<button class="btn btn-${deal.status.id eq 'SI' ? 'success' : 'default' } btn-lg">배송중</button> ···
			<button class="btn btn-${deal.status.id eq 'SC' ? 'success' : 'default' } btn-lg">배송완료</button> ···
			<button class="btn btn-${deal.status.id eq 'BC' ? 'success' : 'default' } btn-lg">구매확정</button>
		</div>
		<div class="text-center">
			<form method="post">
	          <input type="hidden" class="form-control" id="t_key" name="t_key" value="${deal.apiKey }">
	          <input type="hidden" class="form-control" name="t_code" id="t_code" value="${deal.dscCode }">
	          <input type="hidden" class="form-control" name="t_invoice" id="t_invoice" value="${deal.transportNumber }">
	          <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#delivery" id="btn-delivery-check">배송조회</button>
	     	</form>
			<h4>결제금액: <span><fmt:formatNumber value="${deal.payment }" pattern="#,###" /></span>원</h4>
		</div>
		<table class="table table-condensed dealInfo">
			<tbody>
				<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.seller.id) }">
				<tr>
					<th>구매자</th>
					<td><c:out value="${deal.buyer.nickname }" /></td>
					<th>연락처</th>
					<td><c:out value="${deal.buyer.phonenumber }" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><c:out value="${deal.buyer.mainaddress }" /> <c:out value="${deal.buyer.detailaddress }" /></td>
				</tr>			
				</c:if>
				<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.buyer.id) }">
				<tr>
					<th>판매자</th>
					<td><c:out value="${deal.seller.nickname }" /></td>
					<th>연락처</th>
					<td><c:out value="${deal.seller.phonenumber }" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><c:out value="${deal.seller.mainaddress }" /> <c:out value="${deal.seller.detailaddress }" /></td>
				</tr>			
				</c:if>
			</tbody>			
		</table>
		<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.seller.id) and (deal.status.id eq 'PC' or deal.status.id eq 'PR' or deal.status.id eq 'PRC') and deal.cancel eq 'N' }">
			<div>
				<a href="pr.do?no=${deal.id }" class="btn btn-info">상품준비중</a>
				<a href="prc.do?no=${deal.id }" class="btn btn-primary">상품준비완료</a>
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#sendcomplete">상품발송완료</button>
			</div>
		</c:if>
		<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.seller.id) and (deal.status.id eq 'SI' or deal.status.id eq 'SC') and deal.cancel eq 'N' }">
			<div>
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#sendcomplete">배송정보변경</button>			
			</div>
		</c:if>
		<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.buyer.id) and (deal.status.id eq 'PH') and deal.cancel eq 'N' }">
			<div>
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#pay">결제하기</button>				
			</div>
		</c:if>
		<div class="text-center">
			<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.seller.id) and deal.cancel eq 'N' and deal.status.id ne 'BC' }">	
				<button class="btn btn-danger" id="btn-cancel-deal-${deal.id }">판매취소</button>
			</c:if>
			<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.buyer.id) and (deal.status.id eq 'PH' or deal.status.id eq 'PC' or deal.status.id eq 'PR') and deal.cancel eq 'N' }">
				<button class="btn btn-danger" id="btn-cancel-deal-${deal.id }">구매취소</button>
			</c:if>
			<c:if test="${(not empty LOGIN_INFO) and (LOGIN_INFO.LOGIN_USER.id eq deal.buyer.id) and (deal.status.id eq 'SI' or deal.status.id eq 'SC') and deal.cancel eq 'N' }">
				<button class="btn btn-info" id="btn-buy-confirm">구매확정</button>
			</c:if>
		</div>		
	</div>
	
	<div class="modal fade" id="sendcomplete" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">배송정보 입력</h4>
          </div>          
           <form action="productSend.do" method="post" id="productSendForm">
           		<input type="hidden" name="dealNo" value="${deal.id }">         
	            <div class="modal-body">
	            <div class="form-group">
	            	<label>택배회사</label>
		            <select name="dscCode" class="form-control">
		            	<option value="04">CJ대한통운</option>
		            	<option value="01">우체국택배</option>
		            	<option value="10">KGB택배</option>
		            	<option value="39">KG로지스</option>
		            	<option value="06">로젠택배</option>
		            	<option value="46">CU편의점택배</option>
		            </select>	            
	            </div>
	            <div class="form-group">
	            	<label>운송장 번호</label>           		
            		<input type="number" name="transportNumber" class="form-control" value="611692898255">
	            </div>
	            </div>
	            <div class="modal-footer">
	            	<div class="text-center">     		
	               		<button class="btn btn-primary" id="productSend">확인</button>
	            	</div>	                            
	            </div>	            
            </form>        
        </div>        
      </div>
    </div>
    
    <div class="modal fade" id="pay" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">결제</h4>
          </div>
           <form method="post">          
	            <div class="modal-body">		
            		<input type="number" name="payment" class="form-control">            	          	                          
	            </div>
	            <div class="modal-footer">
	            	<div class="text-center">
	               		<button class="btn btn-primary" id="payment">확인</button>
	            	</div>
	            </div>	            
            </form>        
        </div>        
      </div>
    </div>
    
    <div class="modal fade" id="delivery" role="dialog">
      <div class="modal-dialog">      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">택배 배송조회</h4>
          </div>                  
	      <div class="modal-body" id="deliveryBody">
	      	<table class="table table-condensed" id="deliveryInfo">
	      		<tbody>	      		
	      		</tbody>
	      	</table>			
	        <table class="table table-striped table-bordered" id="deliveryDetail">
	            <thead>
		            <tr>
		                <th>시간</th>
		                <th>현재 위치</th>
		                <th>배송 상태</th>
		            </tr>
	            </thead>
	            <tbody>		            
	            </tbody>
	        </table>
	    </div>            
	  </div>             
     </div>    
   </div>    
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
<script type="text/javascript">
$(function() {
	$("#payment").click(function(event) {
		event.preventDefault();
		
		var result = confirm("결제하시겠습니까?")
		if (!result) {
			return false;
		}
		
		var payment = $(":input[name=payment]").val();
		var buyerId = ${deal.buyer.id};
		var dealId = ${deal.id};
		
		$.ajax({
			type:"POST",
			url:"payment.do",
			data:{payment:payment, buyerId:buyerId, dealId:dealId},
			dataType:"json",
			success:function(result) {
				alert("결제가 완료되었습니다.");
				location.reload();
			},
			error:function() {
				alert("캐시가 부족합니다!");
			}
		})
	});
	
	$("button[id^=btn-cancel-deal]").click(function(event) {
		event.preventDefault();
		
		var result = confirm("거래를 취소하시겠습니까?");
		if (result) {
			location.href="/deal/cancel.do?no=" + ${deal.id} + "&buyerId=" + ${deal.buyer.id};
		} else {
			return false;
		}
		
	});
	
	$("#productSend").click(function(event) {
		event.preventDefault();
		
		var result = confirm("상품발송을 완료하시겠습니까?");
		if (result) {
			$("#productSendForm").submit();
		} else {
			return false;
		}
	});
	
	$("#btn-delivery-check").click(function(event) {
		event.preventDefault();
		
		var t_key = $("#t_key").val();
		var t_code = $("#t_code").val();
		var t_invoice = $("#t_invoice").val();
		
		$.ajax({
			type:"GET",
			url:"http://info.sweettracker.co.kr/api/v1/trackingInfo",
			data:{t_key:t_key, t_code:t_code, t_invoice: t_invoice},
			dataType:"json",
			success:function(result) {
				var html = "";
				html += "<tr>";
				html += "<th>운송장번호</th><td>"+result.invoiceNo+"</td>";				
				html += "</tr>";
				html += "<tr>";
				html += "<th>받는 사람</th><td>"+result.receiverName+"</td>";				
				html += "</tr>";
				html += "<tr>";
				html += "<th>보낸 사람</th><td>"+result.senderName+"</td>";				
				html += "</tr>";
				html += "<tr>";
				html += "<th>수령 주소</th><td>"+result.receiverAddr+"</td>";				
				html += "</tr>";
				
				$("#deliveryInfo tbody").html(html);
				
				var htmlContent = "";
				$.each(result.trackingDetails, function(index, tracking) {
					htmlContent += "<tr>";					
					htmlContent += "<td>"+tracking.timeString+"</td>";					
					htmlContent += "<td>"+tracking.where+"</td>";					
					htmlContent += "<td>"+tracking.kind+"</td>";					
					htmlContent += "</tr>";					
				})
				
				$("#deliveryDetail tbody").html(htmlContent);
			},
			error:function(result) {
				var html = "<p>배송 정보가 없습니다.</p>";
				
				$("#deliveryBody").html(html);
			}
		})
	});
	
	$("#btn-buy-confirm").click(function() {
		result = confirm("구매를 확정하시겠습니까?");
		if (result) {
			location.href = "buyConfirm.do?no=" + ${deal.id};
		} else {
			return false;
		}
	});	
	
})
</script>
</html>