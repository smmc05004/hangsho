<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>등록된 개별상품 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
</style>
<body>
<c:set var="menu" value="item" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
            <div class="container">
    			
                <!--판매중인 상품 리스트-->
                <div class="row">
                    <div class="row" id="sale-product-area">
                       <h1>등록된 개별상품 리스트</h1>
                    </div>
                    <hr/>
                    
                    <!-- 검색창 -->
                    <div class="row text-right">
                        <form action="" class="form-inline" id="search-form">
                        	<input type="hidden" name="pageNo" value="${param.pageNo }" />
	                        <input type="date" class="form-control" name="beginday" value="${param.beginday }" >
	                        <input type="date" class="form-control" name="endday" value="${param.endday }" >
                            <select class="form-control" name="opt">
                                <option>선택</option>
                                <option value="productName" ${param.opt eq 'productName' ? 'selected' : '' }>상품명</option>
                                <option value="options" ${param.opt eq 'options' ? 'selected' : '' }>옵션</option>
                                <option value="category" ${param.opt eq 'category' ? 'selected' : '' }>카테고리</option>
                            </select>
                            <input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
                            <div class="form-group">
                                <button type="submit" class="btn btn-info" id="search-btn">검색</button>
                            </div>
                        </form>
                    </div>
                    <hr />
                    <!-- 상품 리스트 테이블-->
                    <div class="row" id="sale-product-table">
                        <table class="table table-hover" id="sale-item">
                            <colgroup>
                                <col width="10%">
                                <col width="15%">
                                <col width="*%">
                                <col width="15%">
                                <col width="15%">
                                <col width="15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>상품명</th>
                                    <th>옵션</th>
                                    <th>카테고리</th>
                                    <th>등록일</th>
                                    <th>재고량</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                        <div class="text-right" id="add-btn">
                            <a href="form.do" class="btn btn-info">새 아이템 추가</a>
                        </div>
                    </div>
                                       
                    <!-- 페이지네이션-->
                    <div class="text-center">
                    	<ul class="pagination" id="pagination"></ul>
                    </div>
                </div>
                
                <!-- 모달 -->
                <div class="modal fade" id="stock-form-modal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">재고 추가/삭제</h4>
							</div>
							<form action="accuStock.do">
								<input type="hidden" name="itemId" />
								<div class="modal-body">
								
									<div class="form-group">
										<label>변경 수량</label>
										<input type="number" class="form-control" name="quantity"/>
									</div>
									<div class="form-group">
										<label>변경 사유</label>
										<textarea cols="3" class="form-control" name="reasons"></textarea>
									</div>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-sm btn-primary" id="btn-accumulate-stock">추가/삭제</button>
									<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
            </div>  
        </div>
    </div>  
</body>
<script type="text/javascript">
$(function() {
	
	$("#stock-form-modal").on("hidden.bs.modal", function() {
		$(":input[name='quantity']").val("");
		$(":input[name='reasons']").val("");
	});
	
	var opt = $("select[name='opt'] option:selected").val();
	var keyword = $(":input[name='keyword']").val();
	var beginday = $(":input[name='beginday']").val();
	var endday = $(":input[name='endday']").val();
	var pageNo = $(":input[name='pageNo']").val();
	
	function pagination (pageNo) {
		var pageNo = $("input[name=pageNo]").val();
	
		$.ajax({
			type:"GET",
			url:"getItems.do",
			data: $("#search-form").serialize(),	
			dataType:"json",
			success:function(result) {
			
				var html="";
			
				if (result.items.length == 0) {
					
					html += "<tr class='text-center'><td colspan='7'>출력된 결과가 없습니다. <td></tr>"
					
					$("#sale-product tbody").html(html);
				} else {
			
					$.each(result.items, function(index, item) {
						html += "<tr>";
						html += "<td>"+item.id+"</td>";
						html += "<td>"+item.product.name+"</td>";
						html += "<td><a href='detail.do?itemId="+item.id+"' >"+item.options+"</a></td>";
						html += "<td>"+item.product.smallCategory.name +"</td>";
						html += "<td>"+new Date(item.createdate).toLocaleDateString()+"</td>";
						html += "<td>"+(item.initialQuantity - item.saledQuantity)+"</td>";
						html += "<td>";
						html += "<button class='btn btn-success btn-sm' id='stock-btn-"+item.id+"'>재고변경</button>";
						html += "</td>";
						html += "</tr>";
					});
					$("#sale-item tbody").html(html);
					
					$(".pagination").empty();
					
					if (result.criteria.pageNo > 0) {
							
						if (result.criteria.pageNo == 1) {
							$(".pagination").append("<li><a href='' disabled> 이전 </a></li>");	
						} else {
							$(".pagination").append("<li><a href='"+(result.criteria.pageNo - 1)+"'> 이전 </a></li>");
						}
						
						for (var i = result.criteria.beginPage; i<=result.criteria.endPage; i++) {
							$(".pagination").append("<li><a href='"+i+"'>"+i+"</a></li>");	
						}
						
						if (result.criteria.pageNo == result.criteria.totalPages) {
							$(".pagination").append("<li><a href='#' disabled> 다음 </a></li>");
						} else {
							$(".pagination").append("<li><a href='"+(result.criteria.pageNo + 1)+"'> 다음 </a></li>");
						}
					}
				}
			}
		});
	}
	pagination();
	
	$('#search-btn').click(function() {
		$(':input[name=pageNo]').val(1);
	});
	
	$(".pagination").on('click', 'a', function(event) {
		event.preventDefault();
		pagination($(this).attr('href'));
	});
	
	$('#sale-item tbody').on('click', 'button[id^=btn-del-]', function() {

		var itemId = $(this).attr("id").replace("btn-del-", "");
		var opt = $("select[name=opt] option:selected").val();
		var keyword = $("input[name=keyword]").val();
		var beginday = $("input[name=beginday]").val();
		var endday = $("input[name=endday]").val();
		var pageNo = $("input[name=pageNo]").val();
		
		$.ajax({
			type:"GET",
			url:"delete.do",
			data:{
				itemId: itemId,
				opt: opt,
				keyword: keyword,
				beginday: beginday,
				endday: endday,
				pageNo: pageNo
			},
			dataType:"json",
			success:function(result) {
				
				var html="";
				$.each(result.items, function(index, item) {
					html += "<tr>";
					html += "<td>"+item.id+"</td>";
					html += "<td>"+item.product.name+"</td>";
					html += "<td><a href='detail.do?no="+item.id+"'>"+item.options+"</a></td>";
					html += "<td>"+item.product.smallCategory.name +"</td>";
					html += "<td>"+new Date(item.createdate).toLocaleDateString()+"</td>";
					html += "<td>"+(item.initialQuantity - item.saledQuantity)+"</td>";
					html += "<td>";
					html += "<button class='btn btn-success btn-sm' id='stock-btn-"+item.id+"'>재고변경</button>";
					html += "</td>";
					html += "</tr>";
				});
				$("#sale-item tbody").html(html);
			}
		});
	});
	
	$('#search-btn').click(function() {
		
		$('input[name=pageNo]').val(1);
	});
	
	var itemId = 0;
	$("#sale-item tbody").on('click', "button[id^=stock-btn-]", function() {
		
		$("#stock-form-modal").modal("show");
		
		itemId = $(this).attr("id").replace("stock-btn-", "");
		var quantity = $("input[name=quantity]").val();
		var reasons = $("textarea[name='reasons']").val();
		
		});
	
	$('#btn-accumulate-stock').click(function() {
		
		var quantity = $("input[name=quantity]").val();
		var reasons = $("textarea[name='reasons']").val();
		
		$.ajax({
			type:"POST",
			url:"accuStock.do",
			data: {
				itemId: itemId,
				quantity: quantity,
				reasons: reasons
			},
			dataType:"json",
			success:function(result) {
				console.log(result)
				
				$("input[name=quantity]").val("");
				$("textarea[name='reasons']").val("");
				
				if (result) {
					var $stock_td = $("#sale-item tbody button[id=stock-btn-"+itemId+"]").closest('tr').find('td:nth-child(6)');
					var stock = $stock_td.text();
					stock = parseInt(stock) + parseInt(quantity);
					$stock_td.text(stock); 
				}
			}
		});
		
		$("#stock-form-modal").modal("hide");
	});
	
});
</script>
</html>