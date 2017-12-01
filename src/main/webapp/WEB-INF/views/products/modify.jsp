<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품 수정 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="menu" value="product" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
    <div id="body-container" class="container-fluid">     
        <div id="body-container-body">
        
			<div class="container">
			
				<h1>상품 수정 페이지</h1>
				<hr />
				
				<div class="alert alert-danger" id="error-message-box">
					<strong>Error!</strong> <span id="error-message"></span>
				</div>
			    
			    <!-- 상품 등록폼 -->
			    <form method="post" action="modify.do?productId=${product.id}" enctype="multipart/form-data" id="product-register-form">
				    <table class="table table-hover table-bordered">
				        <colgroup>
				            <col width="20%">
				            <col width="*%">
				        </colgroup>
			            <tbody>
			               <tr>
			                    <th>상품 패키지명</th>
			                    <td>
			                        <div class="form-group">
			                            <input type="text" class="form-control" name="name" id="product-name-input" value="${product.name }"/>
			                        </div>
			                    </td>
			                </tr>
			                <tr>
			                    <th>분류</th>
			                    <td>
			                        <div class="form-group">
			                            <select name="bigCategory" id="big-category">
			                                <c:choose>
			                                	<c:when test="${product.smallCategory.midCategory.bigCategory.id eq 100}">
			                                		<option>대분류</option>
			                                    	<option value="100" selected>식품</option>
			                                    	<option value="200">패션</option>
			                                    	<option value="300">가전</option>
			                                	</c:when>
			                                	<c:when test="${product.smallCategory.midCategory.bigCategory.id eq 200}">
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
			                                <option value="${product.smallCategory.midCategory.id }">${product.smallCategory.midCategory.name }</option>
			                            </select>
			                            <span>&gt;</span>
			                            <select name="smallCategory" id="small-category">
			                                <option value="${product.smallCategory.id }">${product.smallCategory.name }</option>
			                            </select>
			                        </div>
			                    </td>
			                </tr>
			                <tr>
			                    <th>배송비</th>
			                    <td>
			                        <input type="number" class="form-control" min="0" max="2500" maxlength="4"  name="deliveryFee" id="delivery-input" value="${product.deliveryFee }"/>
			                    </td>
			                </tr>
			                <tr>
			                    <th>상품 설명</th>
			                    <td>
			                        <div class="form-group">
			                            <textarea cols="5" rows="5" class="form-control" name="description" id="desciption-input" >${product.description }</textarea>
			                        </div>
			                    </td>
			                </tr>
			                <tr>
			                    <th>할인률</th>
			                    <td>
			                        <input type="number" class="form-control" min="0" max="99" maxlength="2" name="discountRatio" id="discount-ratio" value="${product.discountRatio }"/>
			                    </td>
			                </tr>
			                <tr>
			                    <th>현재 등록된 이미지</th>
			                    <td>
			                    	<img alt="메인이미지" src="${product.image.path }" style="max-width:320px; max-height: 330px; ">
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
			        	<button type="submit" class="btn btn-success" id="register-btn">수정</button>
			        <a href="list.do" class="btn btn-primary">상품 목록</a>
			    	</div>
			    </form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    $(function() {
    	
    	$("#error-message-box").hide();
    	
    	var productRegex = /^[가-힣0-9a-zA-Z\s]{2,}$/;
    	
    	$("#product-register-form").submit(function() {
    		if (!productRegex.test($("#product-name-input").val())) {
    			$("#error-message").text("상품명은 필수 입력 값입니다.");
    			$("#error-message-box").show();
    			return false;
    		}
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
    		if (!$.trim($("#delivery-input").val())) {
     			$("#error-message").text("배송비를 기입해 주세요.");
     			$("#error-message-box").show();
     			return false;
     		}
    		if (!$.trim($("#desciption-input").val())) {
    			$("#error-message").text("상품 내용을 기입해 주세요");
    			$("#error-message-box").show();
    			return false;
    		}
    		if (!$.trim($("#discount-ratio").val())) {
    			$("#error-message").text("할인률을 기입해 주세요.");
    			$("#error-message-box").show();
    			return false;
    		}
    		/* if (!$.trim($("#imagefile").val())) {
    			$("#error-message").text("그림파일을 업로드해 주세요.");
    			$("#error-message-box").show();
    			return false;
    		} */
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

    				var html = "";
    				html += "<option>소분류</option>"
    				$.each(smaCategories, function(index, smaCategory) {
    					html += "<option value="+smaCategory.id+">"+smaCategory.name+"</option>";
    				});
    					$("#small-category").html(html);
    			}
    		});
    	});

           
    });
    </script>
</html>