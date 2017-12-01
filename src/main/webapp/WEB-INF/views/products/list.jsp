<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>등록된 상품 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
</style>
<body>
<c:set var="menu" value="product" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
            <div class="container">
    			
                <!--판매중인 상품 리스트-->
                <div class="row">
                    <div class="row" id="sale-product-area">
                       <h1>등록된 상품 리스트</h1>
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
                                <option value="category" ${param.opt eq 'category' ? 'selected' : '' }>카테고리</option>
                                <option value="show" ${param.opt eq 'show' ? 'selected' : '' }>판매여부</option>
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
                        <table class="table table-hover" id="sale-product">
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
                                    <th>분류</th>
                                    <th>상품명</th>
                                    <th>할인율<em><small>(단위: %)</small></em></th>
                                    <th>등록일</th>
                                    <th>판매여부</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                        <div class="text-right" id="add-btn">
                            <a href="form.do" class="btn btn-info">새 상품 추가</a>
                        </div>
                    </div>
                                       
                    <!-- 페이지네이션-->
                    <div class="text-center">
                    	<ul class="pagination" id="pagination"></ul>
                    </div>
                    
                </div>
                
            </div>  
        </div>
    </div>  
</body>
<script type="text/javascript">
$(function() {
	
	var opt = $("select[name=opt] option:selected").val();
	var keyword = $("input[name=keyword]").val();
	var beginday = $("input[name=beginday]").val();
	var endday = $("input[name=endday]").val();
	var pageNo = $("input[name=pageNo]").val();

	function pagination (pageNo) {
		
		var pageNo = $("input[name=pageNo]").val(pageNo);
		
		$.ajax({
			type:"GET",
			url:"getProducts.do",
			dataType:"json",
			data:$("#search-form").serialize(),
			success:function(result) {

				var html = "";
				
				if (result.products.length == 0) {
					
					html += "<tr class='text-center'><td colspan='7'>출력된 결과가 없습니다. <td></tr>"
					
					$("#sale-product tbody").html(html);
				} else {
					
					$.each(result.products, function(index, product) {
						html += "<tr>";
						html += "<td>"+product.id+"</td>";
						html += "<td>"+product.smallCategory.name+"</td>";
						html += "<td><a href='detail.do?productId="+product.id+"'>"+product.name+"</a></td>";
						html += "<td>"+product.discountRatio+"</td>";
						html += "<td>"+new Date(product.createDate).toLocaleDateString()+"</td>";
						html += "<td>"+product.show+"</td>";
						html += "<td>";
						html += "<button class='btn btn-success btn-sm' id='btn-modify-"+product.id+"'>상태변경</button>";
						html += "</td>";
						html += "<td>";
						html += "<button class='btn btn-danger btn-sm' id='btn-del-"+product.id+"'>삭제</button>";
						html += "</td>";
						html += "</tr>";
					});
					$("#sale-product tbody").html(html);
					
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
	 
	$("#sale-product tbody").on('click', 'button[id^=btn-del]', function () {
		
		var $tr = $(this).closest('tr');
		var productId = $(this).attr("id").replace("btn-del-", "");
		
		$.ajax({
			type:"GET",
			url:'delete.do',
			data:{
				productId: productId,
				opt: opt, 
				keyword: keyword,
				beginday: beginday,
				endday: endday,
				pageNo: pageNo
			},
			dataType:'json',
			success: function(result) {
				var html = "";
				$.each(result.products, function(index, product) {
					html += "<tr>";
					html += "<td>"+product.id+"</td>";
					html += "<td>"+product.smallCategory.name+"</td>";
					html += "<td><a href='detail.do?productId="+product.id+"'>"+product.name+"</a></td>";
					html += "<td>"+product.discountRatio+"</td>";
					html += "<td>"+new Date(product.createDate).toLocaleDateString()+"</td>";
					html += "<td>"+product.show+"</td>";
					html += "<td>";
					html += "<button class='btn btn-success btn-sm' id='btn-modify-"+product.id+"'>상태변경</button>";
					html += "</td>";
					html += "<td>";
					html += "<button class='btn btn-danger btn-sm' id='btn-del-"+product.id+"'>삭제</button>";
					html += "</td>";
					html += "</tr>";
				});
				$("#sale-product tbody").html(html);
			}
		});
	});
	
	$("#sale-product tbody").on('click', 'button[id^=btn-modify-]', function() {
		
		var productId = $(this).attr("id").replace("btn-modify-", "");
		
		$.ajax({
			type: 'GET',
			url: 'change.do',
			data: {
				productId: productId,
				opt: opt, 
				keyword: keyword,
				beginday: beginday,
				endday: endday,
				pageNo: pageNo
			},
			dataType: 'json',
			success:function (result) {
				console.log(result)
				var html = "";
				$.each(result.products, function(index, product) {
					html += "<tr>";
					html += "<td>"+product.id+"</td>";
					html += "<td>"+product.smallCategory.name+"</td>";
					html += "<td><a href='detail.do?productId="+product.id+"'>"+product.name+"</a></td>";
					html += "<td>"+product.discountRatio+"</td>";
					html += "<td>"+new Date(product.createDate).toLocaleDateString()+"</td>";
					html += "<td>"+product.show+"</td>";
					html += "<td>";
					html += "<button class='btn btn-success btn-sm' id='btn-modify-"+product.id+"'>상태변경</button>";
					html += "</td>";
					html += "<td>";
					html += "<button class='btn btn-danger btn-sm' id='btn-del-"+product.id+"'>삭제</button>";
					html += "</td>";
					html += "</tr>";
				});
				$("#sale-product tbody").html(html);
			}
		});
	});
	
	
});
</script>
</html>