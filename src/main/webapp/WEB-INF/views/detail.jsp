<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<!-- <script src="/resources/js/detail.js"></script>  -->           
<link rel="stylesheet" href="/resources/css/detail.css">	
<style>
	#coreSelectedList {
		margin-top: 20px;
		width: 555px;
		height: 90px;
	}
	
	#countinput {
        width: 25px; 
        height: 25px;
        text-align: center;
    }
    
    #minus-btn {
    	width: 23px;
    	height: 23px;
    	padding: 0;
    }
    
    #plus-btn {
    	width: 23px;
    	height: 23px;
    	padding: 0;
    }
    
    .quespro {
        margin-bottom: 15px;
    }

    .centerman {
        text-align: center;
    }
    
    #search-form {
        width: 847px;
    }
    
    .itemques {
        margin-left: 15px;
    }
    
    .centerman {
        text-align: center;
    }
    
    .mar {
        margin-right: 15px;  
    }
    
    #sc {
        padding-bottom: 0px;
        z-index: 999;
    }
    
    .bgc {
        
    }
    
    .rig {
        margin-left: 300px;
    }
    
    .hei {
        height: 550px;
    }
    
    .nb {
        margin-bottom: 10px;
    }
    
    .nbs {
        margin-bottom: 2px;
    }
    
    .mainbody {
        position: relative;
        
    }
    
    .line {
        position: absolute;
        border: 1px solid darkgrey;
        top: 52px;
        left: 50%;
        margin-left: 290px;
        padding: 30px;
        width: 280px;
        height: 850px;
    }
    
    .bg {
        background-color: white;
    }
    
    p {
        padding: 10px;
    }
    
    p span {
        color: gray;
    }
    
    .fashion {
        padding: 5px;
        color: aliceblue;   
    }
    
    del {
        color: gray;
    }
    
    div strong h3 {
        color: black;
    }
    
    .bor {
        border: solid #000;
        border-color: darkgray;
        background-color:#f2f2f2;
        margin-right: -10px;
    }
    
    .back {
        border-color: orange;
        color: orange;
    }
    
     /* #lin {
        left: -40px;
        list-style: none;
        padding: 10px;
        display: inline-block;
        border: 1px solid darkgray;
        position: relative;
        background-color: #dddd;
        width: 494px;
        height: 49px;
    }
     */
     
     .remain-item-number {
     	height: 49px;
     	width: 494px;
     	margin-bottom: 20px;
     	border: 1px solid #dedede;
     	background-color: #f9f9f9;
     	text-align: center;
     	line-height: 47px; 
     }
     
     #product-selection {
     	height: 32px;
     	width: 494px;
     	display: block;
     	padding: 6px 12px;
     	font-size: 14px;
     }
     
    ul {
        padding-bottom: 50px;
    }
    
    button {
        padding: 200px;
    }
    
    #d {
        color: #ff6600;
    }
    
    .d{
         color: #ff6600;
        
    }
    
    #back {
        background-color: black;
        color: aliceblue;
    }
    
    #itemname {
        width: 380px;
        margin: 3px;
    }
    .left {
    	margin-left: 30px;
    }
    .btn-group {
    	margin-top: 7px;
    }
    .quescaution {
        margin-top: 20px;
        margin-bottom: 5px;
        color: darkorange;
    }
    .quemodal {
    	width: 550px;
    }

</style>
<script>
$(function() {
	
	// 상품옵션 선택 시 총 상품금액 나타내는 변수
	var orderPrice = 0;
	var $payall = $('span.payall');
	var updatePrice = function(value){
		//console.log(value);
		orderPrice += parseInt(value);
		$payall.text(Number(parseInt(orderPrice)).toLocaleString());
	}
	
	// 상품옵션 선택 시 ajax로 나온 well창에 사용자가 -, + 버튼 클릭 시 수량 증가/감소에 따라 변동하는 총 삼품금액 변수 
	var updateInput = function(itemId, value){
		var $target;
		value = parseInt(value);
		$('input[name=itemId]').each(function(index, item) {
			if($(item).val() == itemId) { $target = $(item)}
		});
		var $input = $target.next();
		var original = parseInt($input.val());
		$input.val(parseInt(original + value));
	}
	
	$("#clicked").click(function() {
		$("#productQuestion").click();
	})
    $("#day").mouseenter(function() {
        $("#day").click();
    })
    $("#free").mouseenter(function() {
        $("#free").click();
    })
    
	$("#img2").hide(); 
    $("#img11").mouseenter(function() {
       $("#img1").show(); 
        $("#img11").css("border", "orange solid 2px");
        $("#img2").hide();
        $("#img21").css("border", "");
    });
    $("#img21").mouseenter(function() {
       $("#img2").show(); 
        $("#img21").css("border", "orange solid 2px");
        $("#img1").hide();
        $("#img11").css("border", "");
    });
    // 바로구매 버튼
    $("#btn-buy").click(function(event) {
    	if($(".optionbar-options").val() == 0) {
    		alert("상세옵션을 선택해 주세요.");
    		return false;
    	}
    	event.preventDefault();
    	$('#order-form').submit();
    	     
    });
    // 장바구니 버튼
    $("#btn-cart").click(function(event) {
    	if($(".optionbar-options").val() == 0) {
    		alert("상세옵션을 선택해 주세요.");
    		return false;
    	}
    	event.preventDefault();
    	$('#order-form').attr('action', '/cart/updateCart.do')
    	$('#order-form').submit();
        
    });
 	$(window).scroll(function() {
     var sclTop = $(this).scrollTop();
     if(sclTop > 649) {
             $('#sc').css('position', 'fixed').css('top', '1px'); 
             $('#scr').css('position', 'fixed');
             $("#top").show();
             $("#bottom").show();
        } else {
           $('#sc').css('position', '').css('top', '');
           $('#scr').css('position', '');
           $("#top").hide();
            $("#bottom").hide();
        }
 	})

 	// 상품문의 문의하기 클릭 시 로그인이 안되어있으면 로그인 페이지로 넘어가게 하기  
 	$("#modal-question-btn").click(function() {
 		if ("${LOGIN_INFO.LOGIN_USER }" == "null" || "${LOGIN_INFO.LOGIN_USER }" == null || "${LOGIN_INFO.LOGIN_USER }" == "undefine" 
 				|| "${LOGIN_INFO.LOGIN_USER }" == ""){
 			location.href = "/customers/login.do";
 			return;
 		}
 	});
 	
 	// 상품 옵션 선택 시 내가 선택한 상품의 옵션과 가격창 밑에 나타내기 + 만약 같은 옵션 선택 시 '이미 선택된 옵션입니다' 경고창 띄우기
	$(".optionbar-options").change(function() {
		var itemId = $(this).val();
		//console.log(itemId);
		var $div = $('div[id^=selection-item-options-]').find('div[class^=select-itemoptions-]');
		//console.log($div);
		var flag = false;
		$div.each(function(index, item) {
			console.log($(this).attr("class").replace("select-itemoptions-", ""));
			// itemId + well 이름 사이 well은 지우고 itemId만 나오게 하기 
			if($(this).attr("class").replace("select-itemoptions-", "").substring(0,1) == itemId) {
				flag = true;
			}
		});
		
		if(flag) {
			alert("이미 선택된 옵션입니다.");
			return;
		}
		
		// 상품 옵션 선택 시 내가 선택한 상품의 옵션과 가격창 밑에 나타내기
		if($div.length == 0 || itemId != $div.attr('class').split(' ')[0].replace('select-itemoptions-', '')){
		$.ajax({
			type:"GET",
			url:"getProDetail.do",
			data:{itemId:itemId},
			dataType:"json",
			success: function(result) {
				//console.log(result)
				var html4 = "<div class='select-itemoptions-"+result.id+" well' id='coreSelectedList'>";
					html4 += "<ul>";
					html4 += "<li id='coreSelected-list'>";
					html4 += "<div class='row selected'>";
					html4 += "<div class='row choose-item col-sm-11'>";
					html4 += "<span class='selected-itemtitle'>"+result.options+"</span>";
					html4 += "</div>";
					html4 += "<div class='row col-sm-1 left'>";
					html4 += "<button class='selected-close btn btn-success btn-xs' id='cancel-btn'>X</button>";
					html4 += "</div>";
					html4 += "</div>";
					html4 += "<div class='row col-sm-8'>";
					html4 += "<div class='btn-group sumpay'>";
					html4 += "<input type='button' value='-' id='minus-btn' name='proqty-minus'>";
					html4 += "<input type='text' class='amount-input"+result.id+"' name='proqty' id='countinput' value='1' readonly='readonly'/>";
					html4 += "<input type='button' value='+' id='plus-btn' name='proqty-plus'>";
					html4 += "</div>";
					html4 += "</div>";
					html4 += "<div class='product-price col-sm-4 text-right'>";
					html4 += "<h4><span id='price-"+result.id+"' data-price='"+result.salePrice+"'>"+Number(parseInt(result.salePrice)).toLocaleString()+"원</span></h4>";
					html4 += "</div>";
					html4 += "</li>";
					html4 += "</ul>";
					html4 += "</div>";

				$("#selection-item-options-01").append(html4);
				
					var html5 = "<div class='select-itemoptions-"+result.id+" well'>";
					html5 += "<div id='coreSelected-list'>"
					html5 += "<div class='row selecteds'>"
					html5 += "<div class='row choose-items col-sm-11'>"
					html5 += "<span class='selected-itemtitles'>"+result.options+"</span>"
					html5 += "</div>"
					html5 += "<div class='row col-sm-1 lefts'>"
					html5 += "<button class='selected-closes btn btn-success btn-xs' id='cancel-btn'>X</button>";
					html5 += "</div>";
					html5 += "</div>";
					html5 += "<div class='row col-sm-8'>";
					html5 += "<div class='btn-group sumpay'>";
					html5 += "<input type='button' value='-' id='minus-btn' name='proqty-minus'>";
					html5 += "<input type='text' class='amount-input"+result.id+"' name='proqty' id='countinput' value='1' readonly='readonly'/>";
					html5 += "<input type='button' value='+' id='plus-btn' name='proqty-plus'>";
					html5 += "</div>";
					html5 += "</div>";
					html5 += " <div class='product-price row text-left'>";
					html5 += "<h4><span id='price-"+result.id+"' data-price='"+result.salePrice+"'>"+Number(parseInt(result.salePrice)).toLocaleString()+"원</span></h4>";
					html5 += "</div>";
					html5 += "</div>";
					html5 += "</div>";
				
				$("#selection-item-options-02").append(html5);
				// 상품옵션 선택 시 총 상품금액 나오게 하기
				updatePrice(result.salePrice);
				updateInput(result.id, 1);
			} 
		});
		}

	});
 	
  	// 메인옵션 or서브옵션 x버튼 클릭 시 동시에 취소하기
	$("#selection-item-options-01, #selection-item-options-02").on('click', '#cancel-btn', function(event) {
		event.preventDefault();
		var $div = $(this).closest('div[class^=select-itemoptions-]');
		var className = $div.attr("class").split(" ")[0];
		//console.log(className);
		var $deletediv = $("."+className);
		
		$deletediv.remove();
	
	});
 	// 메인옵션 or서브옵션의 마이너스 버튼 클릭 시 동시에 숫자 차감
	$("#selection-item-options-01, #selection-item-options-02").on('click', '#minus-btn', function(event) {
		event.preventDefault();
		var $input = $(this).siblings('input[class^=amount-input]');
		var className = $input.attr('class');
		//console.log(className);
		var $inputs = $("."+className);
		var inputval = parseInt($inputs.val());
		var itemId = className.replace('amount-input', '');
		if (inputval <= 1) {
			alert("최소구매수량은 1개 이상 입니다");
		} else {
		// -버튼 클릭 시 수량 감소될 때마다 총 상품금액 가격도 내리게 하기
		var updateVal = -$(this).parent().parent().parent().find('[id^=price]').attr('data-price');
		updatePrice(updateVal);		
		updateInput(itemId, -1);
		$inputs.val(inputval - 1);
		}
	});
	
	// 메인옵션 or서브옵션의 플러스 버튼 클릭 시 동시에 숫자 증가
	$("#selection-item-options-01, #selection-item-options-02").on('click', '#plus-btn', function(event) {
		event.preventDefault();
		var $input = $(this).siblings('input[class^=amount-input]');
		//console.log($input);
		var className = $input.attr('class');
		//console.log(className);
		var $inputs = $("."+className);
		//console.log($inputs);
		var inputval = parseInt($inputs.val());
		//console.log(inputval);	
		var itemId = className.replace('amount-input', '');
		if (inputval >= 20) {
			alert("최대구매수량은 20개 입니다");
		} else {
		// +버튼 클릭 시 수량 증가될 때마다 총 상품금액 가격도 오르게 하기
		var updateVal = $(this).parent().parent().parent().find('[id^=price]').attr('data-price');
		updatePrice(updateVal);
		updateInput(itemId, 1);
		$inputs.val(inputval + 1);
		}
	});

 	// 상품 상세페이지 안 상품문의 게시판 리스트/페이징 ajax 처리
 	function pagination1(pageNo) {

 		$(":input[name=pageNo]").val(pageNo);

	 	$.ajax({
	 		type:"GET",
	 		url:"getProquelist.do",
	 		data:$('#search-form').serialize(),
	 		dataType:'json',
	 		success:function(results) {
	 			//console.log(results);
				 
				var productques = results.productques;
	 			//console.log(productque);
	  			var html1 = "";
				$("#qnaitemstable table").empty();
	 			 if (productques != null) {
		 			$.each(productques, function(index, item) {
		 				//console.log(item);
		 				html1 += "<tr>";
		 				html1 += "<td>"+item.id+"</td>";
		 				html1 += "<td>"+item.status+"</td>";
		 				html1 += "<td class='on' id='questiontitle_"+item.id+"'><a href='javascript:void(0);'>"+item.title+"</a></td>";
		 				html1 += "<td>"+item.customer.nickname+"</td>";
		 				html1 += "<td>"+item.strCreateDate+"</td>";
		 				html1 += "</tr>"; 
		 			});
	 			} else {
	 				$("#quelists").append("<tr><td colspan='5' class='text-center'>검색된 결과가 없습니다</td></tr>");
	 			} 
	 			
	 			$("#quelists").html(html1);
	 			
	 			
	 			var html2 = "";
	 			// ajax로 페이징 처리 
	 			$("#pagination-product-qna").empty();
	 			pagings = results.criteria;
	 			//console.log(pagings);
				if (pagings.totalRows > 0) {
					if (pagings.pageNo > 1) {
						html2 += "<li><a href=''><span>&lt;&lt;</span></li>";
					} else {
						html2 += "<li class='disabled'><span>&lt;&lt;</span></li>";
					}
					for (var i = pagings.beginPage; i <= pagings.endPage; i++) {
						html2 += "<li class='"+ (pagings.pageNo == i ? 'active' : "") +"'><a href='"+i+"'>"+i+"</a></li>";
					}
					if (pagings.pageNo < pagings.totalPages) {
						html2 += "<li id='clicked'><a href='"+(pagings.pageNo + 1)+"'>&gt;&gt;</a></li>";
					} else {
						html2 += "<li class='disabled'><span>&gt;&gt;</span></li>";
					}
				}
				$("#pagination-product-qna").html(html2);
	 		}
	 	});

 	}
 	pagination1(1);
 	pagination2(1);
 	
 // 구매후기 게시판 리스트/페이징 ajax 처리 
 	function pagination2(pageNo) {
	 	var productId = $("#productId").val();
 		$(":input[name=pageNo]").val(pageNo);
 		$.ajax({
	 		type:"GET",
	 		url:"getReviewList.do",
	 		data:{productId:productId},
	 		dataType:'json',
	 		success:function(values) {
	 			//console.log(values);
	 			var reviewlist = values.reviews;
	 			//console.log(reviewlist);
	  			var html6 = "";
				$("#qnaitemstable table").empty();
	 			 if (reviewlist != null) {
		 			$.each(reviewlist, function(index, item) {
		 				//console.log(item);
		 				html6 += "<tr>";
		 				html6 += "<td>"+item.id+"</td>";
		 				html6 += "<td>"+item.comment+"</td>";
		 				html6 += "<td>"+item.customer.nickname+"</td>";
		 				html6 += "<td>"+item.strCreateDate+"</td>";
		 				html6 += "</tr>"; 
		 			});
	 			} else {
	 				$("#revlists").append("<tr><td colspan='5' class='text-center'>검색된 결과가 없습니다</td></tr>");
	 			} 
	 			
	 			$("#revlists").html(html6);
	 			
	 			var html7 = "";
	 			// ajax로 페이징 처리 
	 			$("#pagination-product-review").empty();
	 			paging = values.criteria;
	 			//console.log(pagings);
				if (paging.totalRows > 0) {
					if (paging.pageNo > 1) {
						html7 += "<li><a href=''><span>&lt;&lt;</span></li>";
					} else {
						html7 += "<li class='disabled'><span>&lt;&lt;</span></li>";
					}
					for (var i = paging.beginPage; i <= paging.endPage; i++) {
						html7 += "<li class='"+ (paging.pageNo == i ? 'active' : "") +"'><a href='"+i+"'>"+i+"</a></li>";
					}
					if (paging.pageNo < paging.totalPages) {
						html7 += "<li id='clicked'><a href='"+(paging.pageNo + 1)+"'>&gt;&gt;</a></li>";
					} else {
						html7 += "<li class='disabled'><span>&gt;&gt;</span></li>";
					}
				}
				$("#pagination-product-review").html(html7); 
	 		}
	 	});
 	}
 	// 상세페이지 처음 들어갔을 때 페이지 번호는 반드시 1번이어야 한다
 	$("#btn-search").click(function() {
 		$(":input[name=pageNo]").val(1);
 	});
 	
 	
 	$("#allSearch").click(function() {
 		$("#keywordwidth").val("");
 		$("#btn-search").click();
 	}); 
 	
 	$("#pagination-product-qna").on('click', "a", function(event) {
 		event.preventDefault();
 		pagination($(this).attr('href'));
 	});
 	// 상품문의 내용과 판매자 답변이 나와있는 상태에서, 제목 클릭 시 내용과 판매자 답변 사라지게 하기  
 	$("#quelists").on('click', 'td.off',function(event){
 		//console.log($(this));
 		var $tr = $(this).closest('tr');
 		if($tr.find("td:nth-child(2)").text() == 'Y') {
 			$tr.next().next().remove();
 		}
 		$tr.next().remove();
 		$(this).removeClass('off');
 		$(this).addClass('on');
 	});
 	
 	// 상품문의 제목 클릭 시 내용과 판매자 답변이 있다면 답변 내용도 같이 나오게 ajax처리
 	$("#quelists").on('click', 'td.on', function(event) {
 		event.preventDefault();
 		//console.log('click');
 		var $tr = $(this).closest('tr');
 		var $td = $(this);
 		id = $td.attr('id').replace("questiontitle_", "");
 		//console.log(id);
 		if($td.attr('class') == 'on')
 			$.ajax({
 				type:"GET",
 				url:"getAnsContent.do",
 				data:{id:id},
 				dataType:'json',
 				success:function(content) {
 					console.log(content);
 					var html3 = "<tr>";
 					html3 += "<td></td><td id='proque-content' colspan='3' class='text-left'><label class='label label-info '>질문내용</label>  "+content.productQue.question+"</td>";
 					html3 += "</tr>";
 					if(content.productAns){
	 					html3 += "<tr>";
	 					html3 += "<td></td><td colspan='3' class='text-left'><label class='label label-warning '>판매자답변</label> "+content.productAns.answer+"</td>";
	 					html3 += "<td><span colspan='1'><label class='label label-success '>답변등록일</label></span></td>";
	 					html3 += "<td><span colspan='1'>"+content.productAns.strCreateDate+"</span></td>";
	 					html3 += "</tr>";
 					}
 					$tr.after(html3);
 				}
 			}).done(function(){
 				$td.removeClass('on');
 				$td.addClass('off');
 			});
 	});

});
</script>
</head>
<body>
    <div class="container">
        <p><span class="glyphicon glyphicon-home"></span> 홈 <span class="glyphicon glyphicon-chevron-right"></span> 패션 <small><span class="glyphicon glyphicon-triangle-bottom"></span></small> <span class="glyphicon glyphicon-chevron-right"></span> 남성의류 <small><span class="glyphicon glyphicon-triangle-bottom"></span></small> <span class="glyphicon glyphicon-chevron-right"></span> 남성상의 <small><span class="glyphicon glyphicon-triangle-bottom"></span></small></p>
        <div class="row">
            <div class="col-sm-4">
                <div class="row">
                    <img src="${image.path }" height="300px" id="img1">   
                    <img src="${image.path }" height="300px" id="img2">    
                </div>
                <div class="row text-center">
                    <img src="${image.path }" width="15%" height="50px" id="img11"/>
                </div>
            </div>
            <div class="col-sm-6">
	            	<div>
		                <strong><h1>
		                	 ${product.name }
		                </h1></strong>
		                <h4><del><fmt:formatNumber pattern="###,###,###" ><c:out value="${minPrice*1.2 }"></c:out></fmt:formatNumber>원</del></h4>
		                <h2 id="d"><fmt:formatNumber pattern="###,###,###"><c:out value="${minPrice }"></c:out></fmt:formatNumber>원</h2>
	            	</div>
                <small><span>상세옵션을 선택해 주세요. (1인당 최대 5개,<span id="d">배송비는 2,500원</span>)</span></small>
                <form name="select-options" method="get" action="/order/orderPage.do" id="order-form">
                	<input id="productId" type="hidden" name="productId" value="${product.id }">
                	<c:forEach var="proOptions" items="${productDetail }">
						<input type="hidden" name="itemId" value="${proOptions.id }">
	                	<input type="hidden" name="proqty" value="0"/>
	                </c:forEach>
	                
	                <select class="optionbar-options form-control" name="options">
						<option value="0">옵션명</option>
	                	<c:forEach var="proOptions" items="${productDetail }">
							<option value="${proOptions.id}">${proOptions.options }&nbsp; 재고: ${proOptions.initialQuantity - proOptions.saledQuantity} (+ ${proOptions.salePrice - minPrice})</option>
	                	</c:forEach>
	                </select>
	                <div id="selection-item-options-01">
		                
	                </div>
	                <div>
	               		<h3 class="text-right"><span>총 상품금액 </span><span class="payall">0</span><span>원</span></h3>
	            	</div>
	                <div class="col-sm-3"></div>
	                <div class="col-sm-3"><button class="btn btn-warning btn-lg" id="btn-buy">바로구매</button></div>
	                <div class="col-sm-3"><button class="btn btn-warning btn-lg" id="btn-cart">카트담기</button></div>
                </form>
                <hr>
            </div>
        </div>
        <hr>
        <div class="row mainbody">
        <nav class="navbar navbar-inverse" id="sc" style="min-width:1155px;">
	        <div class="container-fluid">
				<ul class="nav navbar-nav" id="sc" role="tablist">
					<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">상품설명</a></li>
					<li role="presentation"><a href="#profile"  aria-controls="profile" role="tab" data-toggle="tab">상품문의</a></li>
					<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">구매후기</a></li>
					<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">환불교환/상품고시</a></li>
				</ul>
	         </div>
		</nav>
        <div class="col-sm-9">
            <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <h4><strong>구매전 꼭 읽어주세요!</strong></h4>
                
                <div class="row bor">
                    <div class="col-sm-2"><img src="/resources/images/prodetails/ddddd.JPG" width="100%" /></div>
                    <div class="col-sm-10">
                        <h4><strong class="d">배송비는 2,500원</strong><strong>입니다.</strong></h4>
                        <span><strong>*이 상품은 해외배송이 불가능 합니다.</strong></span>
                    </div>
                </div>     
                     <c:forEach var="itemOptions" items="${productDetail }">                
			             <img src="${itemOptions.image.path }">
		            </c:forEach>
		            <img src="/resources/images/prodetails/buycaution.PNG" />     
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">
                <h4><strong>상품에 대해 궁금한 점을 물어보세요.</strong></h4>
                <img src="/resources/images/prodetails/beforebuyitems.PNG">
                <ul>
                    <li><span class="d">교환/환불 및 배송관련 문의는 고객센터 내 1:1문의하기</span>를 이용해주세요.</li>
                    <li>상품문의를 통한 취소나 환불, 반품 등은 처리되지 않습니다.</li>
                    <li>상품과 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 삭제됩니다.</li>
                </ul>
				<div class="row">
                  <div class="itemques">
                       <h4 class="quespro"><strong>상품 문의하기</strong></h4> 
                  </div>
                  <div class="col-sm-6">
                        <form id="search-form" class="form-inline pull-left">
                        	<input type="hidden" name="productId" value="${product.id }" >
							<input type="hidden" name="pageNo" value="${param.pageNo }">
								<div class="form-group">
								    <label class="sr-only">검색조건</label>
								    <select class="form-control" name="opt" id="keyresult">
								        <option value="title" ${param.opt eq 'title' ? 'selected' : '' }>제목</option>
								        <option value="contents" ${param.opt eq 'contents' ? 'selected' : '' }>내용</option>
								    </select>
								</div>
                                <div class="form-group">
                                    <label class="sr-only">키워드</label>
                                    <input type="text" class="form-control" id="keywordwidth" name="keyword" value="${param.keyword }" />
                                </div>
                                <button type="submit" class="btn btn-basic" id="btn-search">검색</button>
                         </form> 
                     </div>
                     <div class="col-sm-6">
	                     <form action="add.do" method="post">
		                     <input type="hidden" name="productId" value="${param.productId }">
		                     <button id="modal-question-btn" type="button" class="btn btn-default" data-toggle="modal" data-target="#questions">문의하기</button>
	                         <div class="modal fade" id="questions" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	                             <div class="modal-dialog" role="document">
	                                 <div class="modal-content">
	                                     <div class="modal-header">
	                                         <h4 class="modal-title" id="exampleModalLongTitle"><strong>판매자에게 문의하기</strong></h4>
	                                         <hr />
	                                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                             <span aria-hidden="true">&times;</span>
	                                         </button>
	                                         <h5 class="text-center">상품,배송,취소/반품,A/S등의 문의를 남겨주시면 판매자가 직접 답변을 드립니다</h5>
	                                     </div>
	                                     <div class="col-sm-12 modal-body well">
	                                         <div class="col-sm-10 form-group quemodal">
	                                             <div class="col-sm-2 text-center">
	                                                 <label>제목</label>
	                                             </div>
	                                                 <input type="text" name="title" class="form-control" id="itemname" />
	                                         </div> 
                                             <div class="col-sm-10 form-group quemodal">
                                                 <div class="col-sm-2 text-center">
                                                     <label>내용</label>
                                                 </div>
                                                     <textarea rows="7" name="question" class="form-control" id="itemname" ></textarea>
                                             </div> 
                                             <div class="quescaution col-sm-12 col-sm-offset-1">
                                                 <span><strong>문의 시 유의해주세요!</strong></span>
                                             </div>
                                             <div>
                                                 <ul class="col-sm-10 col-sm-offset-1">
                                                     <li>회원간 직거래로 발생하는 피해에 대해 행쇼는 책임지지 않습니다</li>
                                                     <li>주민등록번호, 연락처 등의 정보는 타인에게 노출될 경우 개인정보 도용의 위험이 있으니 주의해 주시기 바랍니다</li>
                                                     <li>비방, 광고, 불건전한 내용의 글은 관리자에 의해 사전 동의없이 삭제될 수 있습니다</li>
                                                 </ul>
                                             </div>
	                                             <hr />
	                                         <div class="modal-footer col-sm-10">
	                                             <button type="submit" class="btn btn-warning" id="registerok">등록</button>
	                                             <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </div> 
	                         <a href="#" class="btn btn-default">내 문의보기</a>    
	                         <a href="#" class="btn btn-default" id="allSearch">전체 문의보기</a> 
	                     </form>  
                     </div>  
                </div>              
                <hr />
                <div class="row">
                    <table class="table table-responsive qnaitems" id="qnaitemstable">
                       <colgroup>
                          <!--  <col width="50">
                           <col width="100">
                           <col width="300">
                           <col width="100">
                           <col width="80"> -->
                           <col span="12">
                           <col style="width: 70px">
                       </colgroup>
                        <thead>
                            <tr class="qnatitle">
                                <th scope="col">번호</th>
                                <th scope="col">답변상태</th>
                                <th scope="col">제목</th>
                                <th scope="col">문의자</th>
                                <th scope="col">등록일</th>
                            </tr>
                        </thead>
                        <tbody id="quelists">
                        </tbody>
                    </table>
                    <div class="text-center">
                    	<ul class="pagination" id="pagination-product-qna">
                    	</ul>
                	</div> 
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="messages">
	            <div>
	            	<img src="/resources/images/prodetails/itemreview1.PNG" width="100%" />
<!-- 	            	<img src="/resources/images/prodetails/afterbuyitems2.PNG" width="100%" /> -->
	            </div>
                <div class="row">
                    <table class="table table-responsive reviewitems" id="review-list">
	                    <colgroup>
	                        <col width="10%">
	                        <col width="*">
	                        <col width="20%">
	                        <col width="15%">
	                        <col width="15%">
	                        <col width="15%"> 
	                    </colgroup>
	                    <thead>
	                    	<tr class="revtitle">
		                    	<th>번호</th>
		                    	<th>구매후기</th>
		                    	<th>작성자</th>
		                    	<th>등록일</th>
	                    	</tr>
	                    </thead>
	                    <tbody id="revlists">
	                    </tbody>
                	</table>
                	<div class="text-center">
                    	<ul class="pagination" id="pagination-product-review">
                    	</ul>
                	</div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane text-center" id="settings">
                <h3><strong>지금 바로 마이페이지에서</strong></h3>
                <h3><strong>클릭 한 번으로 간편하게 환불/교환하기</strong></h3>
                <a href="javascript:void(0);" class="btn btn-default"><strong>환불/교환 신청</strong><span class="glyphicon glyphicon-triangle-right"></span></a>
                <hr />
                <img src="/resources/images/prodetails/refund1.PNG">
                <hr />
                <img src="/resources/images/prodetails/refund2.PNG">
                <hr />
                <img src="/resources/images/prodetails/refund3.PNG">
                <hr />
                <img src="/resources/images/prodetails/refund4.PNG">
            </div>
			</div>
		</div>
        <div class="line" id="scr">
            <div class="row">
                <h4><strong>옵션선택</strong></h4>
            </div>
            <form name="select-options" method="get" action="/order/orderPage.do" id="order-form">
	            <div class="row hei">
	            	<div>
		                <select class="optionbar-options form-control nb">
							<option value="0">옵션명</option>
							<c:forEach var="proOptions" items="${productDetail }">
								<option value="${proOptions.id}">${proOptions.options }&nbsp; 재고: ${proOptions.initialQuantity - proOptions.saledQuantity} (+ ${proOptions.salePrice - minPrice})</option>
							</c:forEach>
		                </select>
	            	</div>
					<div id="selection-item-options-02">
            		</div>
	            </div>
	            <div class="row">
	                <p class="text-left">총 상품금액 </p><h3 class="text-right"><span class="payall">0</span><span>원</span></h3>
	            </div>
	            <div class="row">
	                <button class="btn btn-default btn-lg btn-block nb">장바구니</button>
	            </div>
	            <div class="row">
	                <button class="btn btn-primary btn-lg btn-block nb">구매하기</button>
	            </div>
            </form>
            <div class="row rig">
                <div class="row nbs" id="top">
                    <a href="#" class="btn btn-info" data-toggle="tooltip" title="맨위로"><span class="glyphicon glyphicon-triangle-top"></span></a>
                </div>
                <div class="row" id="bottom">
                    <a href="#scrollbottom" class="btn btn-info" data-toggle="tooltip" title="맨아래로"><span class="glyphicon glyphicon-triangle-bottom"></span></a>
                </div>
            </div>
        </div>  
    </div>
    </div>
</body>
</html>