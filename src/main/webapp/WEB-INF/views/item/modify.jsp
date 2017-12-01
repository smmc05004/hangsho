<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이템 수정 페이지</title>
</head>
<body>
<c:set var="menu" value="item" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
			<div class="container">
				
				<h1>아이템 수정 페이지</h1>
				<hr />
				
				<div class="alert alert-danger" id="error-message-box">
					<strong>Error!</strong> <span id="error-message"></span>
				</div>
				
				<form method="post" action="modify.do?itemId=${item.id }" enctype="multipart/form-data" id="item-register-form">
					<table class="table table-hover table-bordered">
			            <colgroup>
			                <col width="20%">
			                <col width="*%">
			            </colgroup>
		                <tbody>
							<tr>
		                        <th>분류</th>
		                        <td>
		                            <div class="form-group">
		                                <select name="bigCategory" id="big-category">
		                                	<c:choose>
			                                	<c:when test="${item.product.smallCategory.midCategory.bigCategory.id eq 100}">
			                                		<option>대분류</option>
			                                    	<option value="100" selected>식품</option>
			                                    	<option value="200">패션</option>
			                                    	<option value="300">가전</option>
			                                	</c:when>
			                                	<c:when test="${item.product.smallCategory.midCategory.bigCategory.id eq 200}">
				                                    <option>대분류</option>
			                                    	<option value="100">식품</option>
				                                    <option value="200" selected>패션</option>
			                                    	<option value="300">가전</option>
				                                </c:when>
				                                <c:otherwise>
				                                <option>대분류</option>
			                                    	<option value="100">식품</option>
				                                    <option value="200">패션</option>
				                                    <option value="300" selected>가전</option>
				                                </c:otherwise>
		                                    </c:choose>
		                                </select>
		                                <span>&gt;</span>
		                                <select name="middleCategory" id="middle-category">
		                                    <option value="${item.product.smallCategory.midCategory.id}">${item.product.smallCategory.midCategory.name }</option>
		                                </select>
		                                <span>&gt;</span>
		                                <select name="smallCategory" id="small-category">
		                                    <option value="${item.product.smallCategory.id}">${item.product.smallCategory.name }</option>
		                                </select>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>등록된 상품명</th>
		                        <td>
		                            <div class="form-group">
		                                <select class="form-control" name="product" id="product-name">
		                                	<option value="${item.product.id }">${item.product.name }</option>
		                                </select>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
		                    	<th>옵션</th>
		                        <td>
			                        <div class="form-group">
			                            <input type="text" class="form-control" name="options" id="options-input" value="${item.options }"/>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>원가</th>
		                        <td>
			                        <div class="form-group">
			                            <input type="number" class="form-control" min="0" max="9999999" maxlength="7" name="originalPrice" id="salePrice-input" value="${item.originalPrice }"/>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>판매가</th>
		                        <td>
		                        	<div class="form-group">
		                            	<input type="number" class="form-control" min="0" max="9999999" maxlength="7" name="salePrice" id="originalPrice-input" value="${item.salePrice }"/>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>등록 수량</th>
		                        <td>
		                        	<div class="form-group">
		                            	<input type="number" class="form-control" min="0" max="9999999" maxlength="7" name="initialQuantity" id="iniQuantity-input" value="${item.initialQuantity }"/>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
			                    <th>현재 등록된 이미지</th>
			                    <td>
			                    	<img alt="메인이미지" src="${item.image.path }" style="max-width:320px; max-height: 330px; ">
			                    </td>
			                </tr>
			                <tr>
			                    <th>새 이미지 등록</th>
			                    <td>
			                        <input type="file" class="form-control" name="imagefile" />
			                    </td>
			                </tr>
		                </tbody>
		       		</table>
			        <div class="text-right">
			            <button type="submit" class="btn btn-success">수정</button>
			            <a href="/item/list.do" class="btn btn-primary">목록</a>
			        </div>
		        </form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function () {
	
	$("#error-message-box").hide();
	
	var optionRegex = /^[가-힣a-zA-Z0-9\s]{2,}$/;
	
	$("#item-register-form").submit(function() {

		if($("select[name=bigCategory] option:selected").val() == "대분류") {
			$("#error-message").text("대분류를 선택해 주세요");
			$("#error-message-box").show();
			return false;
		}
		if($("select[name=middleCategory] option:selected").val() == "중분류") {
			$("#error-message").text("중분류를 선택해 주세요");
			$("#error-message-box").show();
			return false;
		}
		if($("select[name=smallCategory] option:selected").val() == "소분류") {
			$("#error-message").text("소분류를 선택해 주세요");
			$("#error-message-box").show();
			return false;
		}
		if($("select[name=product] option:selected").val() == "등록된 상품명") {
			$("#error-message").text("등록할 상품을 선택해 주세요");
			$("#error-message-box").show();
			return false;
		}
		if (!$("input[name=options]").val()) {
 			$("#error-message").text("옵션을 입력해 주세요.");
 			$("#error-message-box").show();
 			return false;
 		} 
		
		if(!optionRegex.test($("input[name=options]").val())) {
    			$("#error-message").text("한글, 영문 2글자 이상 입력해 주세요.");
    			$("#error-message-box").show();
    			return false;
    	}
		if (!$("input[name=originalPrice]").val()) {
 			$("#error-message").text("원가를 입력해 주세요.");
 			$("#error-message-box").show();
 			return false;
 		}
		if (!$("input[name=salePrice]").val()) {
 			$("#error-message").text("판매가를 입력해 주세요.");
 			$("#error-message-box").show();
 			return false;
 		}
		if (!$("input[name=initialQuantity]").val()) {
			$("#error-message").text("입고할 개수를 입력해 주세요");
			$("#error-message-box").show();
			return false;
		}
		/* 
		if (!$.trim($("#imagefile").val())) {
			$("#error-message").text("그림파일을 업로드해 주세요.");
			$("#error-message-box").show();
			return false;
		}
		 */
		return true;
	});
	
	$("#big-category").change(function() {
		
		var bigCateNum = $("select[name=bigCategory] option:selected").val();
		
		$.ajax({
			type:"GET",
			url:"getMidCate.do",
			data:{bigCateNum:bigCateNum},
			dataType:"json",
			success:function(midCategories) {
				//console.log(midCategories);
				var html = "";
				html += "<option>중분류</option>"
				$.each(midCategories, function(index, midCategory) {
					html += "<option value="+midCategory.id+">"+midCategory.name+"</option>";
				});
					$("#middle-category").html(html);
					$("#small-category").html("<option>소분류</option>");
			}
		});
	});
	
	$("#middle-category").change(function() {
		var midCateNum = $("select[name=middleCategory] option:selected").val();
		
		$.ajax ({
			type:"GET",
			url:"getSmaCate.do",
			data:{midCateNum: midCateNum},
			dataType:"json",
			success:function(smaCategories) {
				//console.log(smaCategories);
				var html = "";
				html += "<option>소분류</option>"
				$.each(smaCategories, function(index, smaCategory) {
					html += "<option value="+smaCategory.id+">"+smaCategory.name+"</option>";
				});
					$("#small-category").html(html);
			}
		});
	});
	
	$("#small-category").change(function() {
		var smaCateNum = $("select[name=smallCategory] option:selected").val();
		
		$.ajax({
			type:"GET",
			url:"gettitle.do",
			data:{smaCateNum: smaCateNum},
			dataType:"json",
			success:function(products){
				//console.log(products);
				var html = "";
				html += "<option>등록된 상품명</option>"
				$.each(products, function(index, product) {
					html += "<option value="+product.id+">"+product.name+"</option>";
				});
					$("#product-name").html(html);
			}
		});
	});
	
});

</script>
</html>