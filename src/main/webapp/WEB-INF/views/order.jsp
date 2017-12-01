<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<meta http-equiv="pragma" content="no-cache"/>

<meta http-equiv="pragma" content="no-store"/>

<meta http-equiv="cache-control" content="no-cache"/>

<meta http-equiv="Expires" content="-1"/>

<script type="text/javascript" >
$(function() {
	
	 
	   
	   var totalDeliveryFee = 0;
	   $("strong.deliveryFee").each(function() {
		   totalDeliveryFee += parseInt($(this).text());
	   });
	   $("strong.deliveryFeeAll").text(totalDeliveryFee);
	   
	   var orderPrice0 = 0;
	   var productPrice0 = 0;
	   var discountPrice0 = 0;
	   
	   $(".qty").each(function() {
			  var $itemList = $(this).closest("div.item-list-box");
			  var originalPrice = parseInt($itemList.find("span.originalPriceOne").text());
			  var discountPrice = parseInt($itemList.find("strong.discountPriceOne").text());
			  var deliveryFee = parseInt($itemList.find("strong.deliveryFee").text());
			   
			  var qty = parseInt($itemList.find("small.qty").text());
			  $itemList.find("span.originalPriceOne").text(originalPrice*qty);
			  $itemList.find("strong.discountPriceOne").text(discountPrice*qty);
			  
		   });
	   
	   $("span.sumpriceone").each(function() {
		   var $itemListBox = $(this).closest("div.item-list-box");
		   var originalPrice = parseInt($itemListBox.find("span.originalPriceOne").text());
		   var discountPrice = parseInt($itemListBox.find("strong.discountPriceOne").text());
		   var deliveryFee = parseInt($itemListBox.find("strong.deliveryFee").text());
		   
		   $(this).text(originalPrice - discountPrice + deliveryFee);
		   
		   orderPrice0 += parseInt($(this).text());
	   });
	   $("span.originalPriceOne").each(function() {
		   productPrice0 += parseInt($(this).text());
	   });
	   $("strong.originalPriceAll").text(productPrice0);
	   
	   $("strong.discountPriceOne").each(function() {
		   discountPrice0 += parseInt($(this).text());
	   });
	   $("strong.salePriceAll").text(discountPrice0);
	   
	   $("span.sumpriceall").text(orderPrice0);
	   $("strong.allPrice").text(orderPrice0);
	   $("span.sumpricepay").text(orderPrice0);
	   
	   
	   $("#apply-coupon-btn").click(function() {
	      $(".dis").text($("#grade").attr("data-discount"));
	      
	      var cash = $("#inputpoint").val();
	      var originPay = $(".allPrice").text();
	      var deliveryPay = $(".deliveryFee").text();
	      var couponPay = $(".couponPrice").text();

	      var resultPay = Number(originPay)+Number(deliveryPay)-Number(couponPay)-Number(cash);
	    
	      $(".sumpricepay").text(resultPay);	

	      
	   });
	   
	   $(".grade").click(function() {
		  
		  $("#couponId").val($("#grade").attr("data-id"));
		  console.log($("#couponId").val());
	   });
	   
	   $("#cancel-coupon-btn").click(function() {
	      var noneCoupon = 0;
	      $(".dis").text(noneCoupon);
	      
	      var cash = $("#inputpoint").val();
	      var originPay = $(".allPrice").text();
	      var deliveryPay = $(".deliveryFee").text();
	      var couponPay = $(".couponPrice").text();
	      
	      var resultPay = Number(originPay)+Number(deliveryPay)-Number(couponPay)-Number(cash);
	      $(".sumpricepay").text(resultPay);
	   });
	   
	   
	   $("#allCheck").click(function() {
	      if($("#allCheck").prop("checked")) {
	         $("input[name=checked]").prop("checked",true);
	      } else {
	         $("input[name=checked]").prop("checked",false);
	      }
	   });

	    $("#optionsRadios1").click(function() {
	        $("#address4").val("");
	        $("#detailaddress4").val("");
	        $("#postalcode4").val("");
	        $("#home").text("");
	        $("#delivery").val("");
	        
	        var addre = $("#address1").val();
	        var detailaddre = $("#detailaddress1").val();
	        var postal = $("#postalcode1").val();
	        var delivery = $("#delivery1").text();
	        
	        $("#address4").val(addre);
	        $("#detailaddress4").val(detailaddre);
	        $("#postalcode4").val(postal);
	        $("#home").text(delivery);
	        

	        
	        var home = $("#home").text();
	        $("#delivery").val(home);
	    });
	    
	    $("#optionsRadios2").click(function() {
	        $("#address4").val("");
	        $("#detailaddress4").val("");
	        $("#postalcode4").val("");
	        $("#home").text("");
	        $("#delivery").val("");
	        
	        var delId = $("#optionsRadios2").val();
	        var addre = $("#address2").val();
	        var detailaddre = $("#detailaddress2").val();
	        var postal = $("#postalcode2").val();
	        var delivery = $("#delivery2").text();
	        
	        
	        $("#address4").val(addre);
	        $("#detailaddress4").val(detailaddre);
	        $("#postalcode4").val(postal);
	        $("#home").text(delivery);
	        $("#deliveryId").val(delId);
	        
	        
	        var home = $("#home").text();
	        $("#delivery").val(home);
	       
	    });
	    
	    
	    $("#optionsRadios3").click(function() {
	       
	        $("#address4").val("");
	        $("#detailaddress4").val("");
	        $("#postalcode4").val("");
	        $("#home").text("");
	        $("#delivery").val("");
	        
	        var delId = $("#optionsRadios3").val();
	        var addre = $("#address3").val();
	        var detailaddre = $("#detailaddress3").val();
	        var postal = $("#postalcode3").val();
	        var delivery = $("#delivery3").text();
	        
	        $("#address4").val(addre);
	        $("#detailaddress4").val(detailaddre);
	        $("#postalcode4").val(postal);
	        $("#home").text(delivery);
	        $("#deliveryId").val(delId);
	        
	        var home = $("#home").text();
	        $("#delivery").val(home);
	    });
	        
	    
	    $("#useadd1").click(function() {
	        var addr1 = $("#main-address1").val();
	        var detailaddr = $("#address-detail-input1").val();
	        var postalCode = $("#postal-code1").val();
	        
	        
	        $("#address1").val(addr1);
	        $("#detailaddress1").val(detailaddr);
	        $("#postalcode1").val(postalCode);
	        
	    });
	    
	    $("#useadd2").click(function() {
	        var addr1 = $("#main-address2").val();
	        var detailaddr = $("#address-detail-input2").val();
	        var postalCode = $("#postal-code2").val();
	        var delivery = $("#inputdelivery2").val();
	        
	        $("#address2").val(addr1);
	        $("#detailaddress2").val(detailaddr);
	        $("#postalcode2").val(postalCode);
	        $("#delivery2").text(delivery);
	        
	        
	    });
	    
	    $("#useadd3").click(function() {
	        var addr1 = $("#main-address3").val();
	        var detailaddr = $("#address-detail-input3").val();
	        var postalCode = $("#postal-code3").val();
	        var delivery = $("#inputdelivery3").val();
	        
	        $("#address3").val(addr1);
	        $("#detailaddress3").val(detailaddr);
	        $("#postalcode3").val(postalCode);
	        $("#delivery3").text(delivery);
	       
	    });
	    
	    

	    $("#address-btn1").click(function(event) {
	        event.preventDefault();
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#postal-code1').val(data.zonecode); //5자리 새우편번호 사용
	               $('#main-address1').val( fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $('#address-detail-input1').focus();
	            }
	        }).open();
	    });
	    $("#address-btn2").click(function(event) {
	        event.preventDefault();
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#postal-code2').val(data.zonecode); //5자리 새우편번호 사용
	               $('#main-address2').val( fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $('#address-detail-input2').focus();
	            }
	        }).open();
	    });
	    $("#address-btn3").click(function(event) {
	        event.preventDefault();
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#postal-code3').val(data.zonecode); //5자리 새우편번호 사용
	               $('#main-address3').val( fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $('#address-detail-input3').focus();
	            }
	        }).open();
	    });
	    
	    $("#submit-btn").click(function(e) {
	       e.preventDefault();
	       var payPrice = $(".sumpricepay").text();
	       $("#realPrice").val(payPrice);
	       var price = $(".sumpriceall").text();
	       $("#totalPrice").val(price);
	       
	       if(!$("#check1").prop("checked") || !$("#check2").prop("checked") || !$("#check3").prop("checked")) {
	          alert("약관에 동의해주세요.");
	          return false;
	       }
	       if($(".sumpricepay").text() != 0) {
	    	   alert("잔액이 부족합니다.")
	    	   return false;
	       }
	       $("#addorder").submit();
	    });
	    $("#cash-all").click(function() {
	       var cash = $("#inputpoint").val();
	    
	      var originPay = parseInt($(".allPrice").text());
	      var couponPay = parseInt($(".couponPrice").text());
	       var point = parseInt($("#customerPoint").text());
	       
	       
	       if(point > (originPay-couponPay)) {
	          $("#inputpoint").val(originPay-couponPay);
	          
	       } else {
	          $("#inputpoint").val(point);
	       }
	       
	       return false;
	       
	    });
	    $("#cash-commitbtn").click(function() {
	       if($("#inputpoint").val() == "") {
	         $("#inputpoint").val("0");
	      }
	       if($("#inputpoint").val() < 0) {
	          $("#inputpoint").val("0");
	          return false;
	       }
	       
	       if($("#inputpoint").val() > parseInt($("#customerPoint").text())) {
	          
	          alert("적립금이 부족합니다.");
	          $("#inputpoint").val("0");
	          return false;
	       }
	       
	       
	       var cash = $("#inputpoint").val();
	       $(".usedCash").text(cash);
	       
	      var originPay = $(".allPrice").text();
	      var couponPay = $(".couponPrice").text();

	      var result = Number(originPay)-Number(couponPay);
	      
	      $(".sumpricepay").text(result - cash);
	      
	      
	      return false;

	      
	       
	    });
	    
	    $("#checkbox").click(function() {
	       
	    }); 
	})
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/order.css">

</head>
<body>
   <%@ include file="/WEB-INF/views/inc/header.jsp"%>
   <div class="container">

      <h1 class="spd">주문/결제</h1>
      
      <h4 class="pd">배송지 정보</h4>

      <div class="row">
         <div class="col-sm-2 spds">
            <strong id="delivery1">기본 배송지</strong>
         </div>
         <div class="radio">
            <input type="radio" name="optionsRadios1" id="optionsRadios1"
               value="option1" checked="checked">
           <div class="col-sm-1 spd">
               <input type="text" class="form-control" name="postalcode"
                  id="postalcode1" placeholder="우편번호"
                  value="${customer.postalcode }" disabled>
            </div>
            <div class="col-sm-4 spd">
               <input type="text" class="form-control" name="address"
                  id="address1" placeholder="주소를 입력하세요."
                  value="${customer.mainaddress }" disabled>
            </div>
            
            <div class="col-sm-4 spd">
               <input type="text" class="form-control" name="detailaddress"
                  id="detailaddress1" placeholder="상세주소를 입력하세요."
                  value="${customer.detailaddress }" disabled>
            </div>
         </div>
         <div class="col-sm-1 btnposition">
            <button class="btn btn-warning btn-sm" data-toggle="modal"
               data-target="#deliaddr1">주소 수정</button>
            <div class="modal fade" id="deliaddr1" tabindex="-1" role="dialog"
               aria-labelledby="exampleModalLongTitle" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">우편번호 검색</h5>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body">

                        <div class="form-group">
                           <div id="address-package">
                              <input type="text" maxlength="5"
                                 class="form-control postal-area" name="postalcode"
                                 id="postal-code1" placeholder="우편번호" readonly /> <a href=""
                                 id="address-btn1"
                                 class="form-control  btn btn-default postal-area">주소검색</a>
                           </div>
                        </div>
                        <div class="form-group">
                           <input type="text" name="mainaddress" class="form-control"
                              placeholder="주소" id="main-address1">
                        </div>
                        <div class="form-group">
                           <input type="text" name="detailaddress" class="form-control"
                              placeholder="상세 주소를 입력해 주세요" id="address-detail-input1">
                        </div>

                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="useadd1"
                           data-dismiss="modal">사용</button>
                        <button type="button" class="btn btn-secondary"
                           data-dismiss="modal">취소</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   
      
         <c:forEach var="deliverys" items="${delivery }" varStatus="status">
            <div class="row">
               <div class="col-sm-2 spds">
                  <strong id="delivery${status.index+2}">${deliverys.title }</strong>
               </div>
               <div class="radio">
                  <input type="radio" name="optionsRadios1" id="optionsRadios${status.index+2}"
                     value="${deliverys.id }">
                     <div class="col-sm-1 spd">
                     <input type="text" class="form-control" name="postalcode"
                        id="postalcode${status.index+2}" placeholder="우편번호"
                        value="${deliverys.postalCode }" disabled>
                     </div>
                  <div class="col-sm-4 spd">
                     <input type="text" class="form-control" name="address"
                        id="address${status.index+2}" placeholder="주소를 입력하세요." value="${deliverys.mainAddress }" disabled>
                  </div>
                  <div class="col-sm-4 spd">
                     <input type="text" class="form-control" name="detailAddress"
                        id="detailaddress${status.index+2}" placeholder="상세주소를 입력하세요." value="${deliverys.detailAddress }" disabled>
                  </div>
               </div>
               <div class="col-sm-1 btnposition">
                  <button class="btn btn-warning btn-sm" data-toggle="modal"
                     data-target="#deliaddr${status.index+2 }">주소 수정</button>
                  <div class="modal fade" id="deliaddr${status.index+2 }" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLongTitle">우편번호 검색</h5>
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                              </button>
                           </div>
                           <div class="modal-body">
      
                              <div class="form-group">
                                 <div id="address-package">
                                 	<input type="text" class="form-control" value="${deliverys.title }" id="inputdelivery${status.index+2 }">
                                    <input type="text" maxlength="5"
                                       class="form-control postal-area" name="postalcode"
                                       id="postal-code${status.index+2 }" placeholder="우편번호" readonly /> <a href=""
                                       id="address-btn${status.index+2 }"
                                       class="form-control  btn btn-default postal-area">주소검색</a>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <input type="text" name="mainAddress" class="form-control"
                                    placeholder="주소" id="main-address${status.index+2 }">
                              </div>
                              <div class="form-group">
                                 <input type="text" name="detailAddress" class="form-control"
                                    placeholder="상세 주소를 입력해 주세요" id="address-detail-input${status.index+2 }">
                              </div>
      
                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-primary" id="useadd${status.index+2 }"
                                 data-dismiss="modal">사용</button>
                              <button type="button" class="btn btn-secondary"
                                 data-dismiss="modal">취소</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </c:forEach>
            
      
      <form action="/order/addOrder.do" method="post" id="addorder">
         <div class="row">
            <div class="col-sm-2 paddingtop">
               <strong>이름</strong>
            </div>
            <div class="col-sm-10 inputline">
               <input type="text" class="form-control" name="orderReceiver" id="name"
                  value="${customer.name }">
            </div>
         </div>
      <input type="hidden" name="deliveryId" id="deliveryId" value="">
         <div class="row">
            <div class="col-sm-2 paddingtop">
               <strong>연락처</strong>
            </div>
            <div class="col-sm-10 inputline">
               <input type="text" class="form-control" name="phonenumber"
                  id="phonenumber" value="${customer.phonenumber }">
            </div>
         </div>
         <div class="row">
            <div class="col-sm-2 paddingtop">
               <strong id="home">주소</strong>
               <input type="hidden" name="deliveryTitle" id="delivery" value="기본 배송지"/>
            </div>
            <div class="col-sm-10 inputline">
               <div class="col-sm-2">
               <input type="text" class="form-control" name="postalCode"
                  id="postalcode4" placeholder="우편번호"
                   value="${customer.postalcode }" readonly>
               </div>
               <div class="col-sm-5">
                  <input type="text" class="form-control" name="main"
                     id="address4" placeholder="주소를 입력하세요."
                     value="${customer.mainaddress }" readonly>
               </div>
               <div class="col-sm-5">
                  <input type="text" class="form-control" name="detail"
                     id="detailaddress4" placeholder="상세주소를 입력하세요."
                     value="${customer.detailaddress }" readonly>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-2 spdss">
               <strong>배송메모</strong>
            </div>
            <div class="col-sm-10 spd">
               <select class="form-control" name="orderMessage">
                  <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                  <option value="배송전에 연락주세요">배송전에 연락주세요</option>
               </select>
            </div>
         </div>
         <h4 class="pd">할인 쿠폰/적립혜택</h4>
         <div class="row spd">
            <div class="col-sm-2">
               <strong>적용가능 쿠폰</strong>
            </div>
            <div class="col-sm-10">
               딜전용 쿠폰 <strong class="d">${couponCount }</strong>장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <a href=""
                  class="btn btn-warning btn-sm" id="couponbtn" data-toggle="modal"
                  data-target="#exampleModalLong">쿠폰적용</a>

               <div class="modal fade" id="exampleModalLong" tabindex="-1"
                  role="dialog" aria-labelledby="exampleModalLongTitle"
                  aria-hidden="true">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLongTitle">쿠폰창</h5>
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
                        <c:if test="${empty coupons }">
                           <h4>사용가능한 쿠폰이 없습니다.</h4>
                        </c:if>
                        <c:forEach var="coupon" items="${coupons }">
                           <div>
                              <div class="showradio1">
                                 <div class="coupon-radio">
                                    <label class="grade">          
                                       <input type="radio" name="optionsRadios2" id="grade" data-id="${coupon.id }" data-discount="${coupon.discountPrice }" value="${customer.grade}">
                                       <img src="/resources/images/coupon/${customer.grade}.jpg" />
                                    </label>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                        <input type="hidden" name="couponId" id="couponId" value="0">
                        </div>
                        <div class="modal-footer">
                           <button type="button" id="apply-coupon-btn" class="btn btn-primary" data-dismiss="modal">적용</button>
                           <button type="button" id="cancel-coupon-btn" class="btn btn-secondary" data-dismiss="modal">적용취소</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-2 spd">
               <strong>쿠폰할인</strong>
            </div>
            <div class="col-sm-10 spd">
               <strong class="d dis">0</strong><strong>원</strong>
            </div>
         </div>
         
         <h4 class="pd">주문상품 정보</h4>
         <div class="row">
            <div class="col-sm-5 song">
               <strong>상품정보</strong>
            </div>
            <div class="col-sm-2 song">
               <strong>상품금액</strong>
            </div>
            <div class="col-sm-2 song">
               <strong>할인금액</strong>
            </div>
            <div class="col-sm-1 song">
               <strong>배송비</strong>
            </div>
            <div class="col-sm-2 song">
               <strong>주문금액</strong>
            </div>
         </div>
         <%int i = 0; %>
         <c:set var="index" target="<%=i%>"/>
         <c:forEach var="items" items="${itemDetail }" varStatus="status" >
       		<c:if test="${quantity[status.index] != 0}">
            <div class="row item-list-box" id="${status.index}">
               <div class="col-sm-5 ck indexfinder">
                  <div class="col-sm-6">
                     <img src="${items.image.path }" width="80%" />
                  </div>
                  <h5>
                     <strong>${items.product.name }</strong>
                  </h5>
                  <div>
                     <small class="sm">${items.options } &nbsp;</small><small class="qty">${quantity[status.index]}</small><small>개</small> 
                     <input type="hidden" name="orderQuantity" value="${quantity[status.index]}" > <!--  -->
                     <input type="hidden" name="itemId" value="${items.id }">
                     
                  </div>
               </div>
               <div class="col-sm-2" id="blue">
                  <h4><span class="originalPriceOne">${items.salePrice }</span>원</h4>
               </div>
               <div class="col-sm-2 kk">
                  <strong>- </strong><strong class="discountPriceOne"><fmt:formatNumber pattern="####"><c:out value="${items.salePrice * items.product.discountRatio/100 }"></c:out></fmt:formatNumber></strong><strong>원</strong>
               </div>
               <div class="col-sm-1 kk">
               
               <c:choose>
         		<c:when test="${not empty previousProductId}">
         			<!-- 배송비 적용 -->
         			<strong class="deliveryFee deliveryFee${status.index }">${items.product.deliveryFee }</strong><strong>원</strong>
         		</c:when>
         		<c:when test="${previousProductId != null and previousProductId != items.product.id }">
	         		<!-- 배송비 적용 -->
	         		<strong class="deliveryFee deliveryFee${status.index }">${items.product.deliveryFee }</strong><strong>원</strong>
         		</c:when>
         		<c:otherwise>
	         		<!-- 배송비 적용안함 -->
	         		<strong class="deliveryFee deliveryFee${status.index }">0</strong><strong>원</strong>
         		</c:otherwise>
         	</c:choose>
         	
         	<c:set var="previousProductId" value="${items.product.id }" />
         	<input type="hidden" id="indexNo" value="${status.index }">
               
               </div>
               <div class="col-sm-2 kk">
                  <h3><span class="sumpriceone"></span><span>원</span></h3>
               </div>
   
            </div>
            
   <!--  <c:set var="index" value="${index + 1 }"/>
         <c:out value="${index }" />
     -->     
     		</c:if>
         </c:forEach>
         
         <hr>
         <div class="row">
            <div class="col-sm-7"></div>
            <div class="col-sm-2">
               <div class="row">
                  <h4>
                     <strong>상품금액</strong>
                  </h4>
               </div>
               <div class="row">
                  <h4>
                     <strong>할인금액</strong>
                  </h4>
               </div>
               <div class="row">
                  <h4>
                     <strong>배송비</strong>
                  </h4>
               </div>
            </div>
            <div class="col-sm-3">
               <div class="row right">
                  <h4>
                  <%int totalPrice = 0; %>
                  <c:set target="<%=totalPrice %>" value="0" var="totalPrice"/>
                  <c:forEach var="item" items="${itemDetail }">
                     <c:set var="totalPrice" value="${totalPrice + item.salePrice }" />
                  </c:forEach>
                     <strong class="originalPriceAll">${totalPrice }</strong><strong>원</strong>
                     
                  </h4>
               </div>
               <div class="row right">
                  <h4>
                  <%int totalSalePrice = 0; %>
                  <c:set target="<%=totalSalePrice %>" value="0" var="totalSalePrice"></c:set>
                  <c:forEach var="item" items="${itemDetail }">
                     <fmt:formatNumber pattern="####"><c:set var="totalSalePrice" value="${totalSalePrice + item.salePrice*(item.product.discountRatio/100) }"></c:set></fmt:formatNumber>
                  </c:forEach>
                     <strong>- </strong><strong class="salePriceAll"><fmt:formatNumber pattern="####">${totalSalePrice }</fmt:formatNumber></strong><strong>원</strong>
                  </h4>
               </div>
               <div class="row right">
                  <h4>
                  <%int totalDeliveryFee = 0; %>
                  <c:set target="<%=totalDeliveryFee %>" value="0" var="totalDeliveryFee"></c:set>
                  
                  
                  
                  
                     <c:set var="totalDeliveryFee" value="${totalDeliveryFee + item.product.deliveryFee }"></c:set>
                     <strong class="deliveryFeeAll">${totalDeliveryFee }</strong><strong>원</strong>
                  </h4>
               </div>
            </div>
         </div>
         <hr>
         <div class="row right pd">
            <div class="col-sm-2">
               <h3>총 주문금액</h3>
            </div>
            <h4>
            <%int totalPriceAll =0; %>
            <c:set target="<%=totalPriceAll %>" value="0" var="totalPriceAll"></c:set>
            <c:forEach var="item" items="${itemDetail }">
                <c:set var="totalPriceAll" value="${ totalDeliveryFee + totalPrice - totalSalePrice}"></c:set>
            </c:forEach>
               
               <span class="sumpriceall"><fmt:formatNumber pattern="####"><c:out value="${totalPriceAll }"/></fmt:formatNumber></span><strong>원</strong>
               <input type="hidden" name="orderPrice" id="totalPrice">
            </h4>
         </div>

         <h4 class="pd">
            <strong>결제수단</strong>
         </h4>
         <div class="row spd">
            <div class="col-sm-2">
               <strong>결제 방법</strong>
            </div>
            <div class="col-sm-6">
               <div class="radio">
                  <label> <input type="radio" name="optionsRadios3"
                     value="option1" checked>티몬캐쉬
                  </label>
               </div>
               
            </div>

            <div class="col-sm-4">
               <h4>적립금 사용</h4>
            <div>&nbsp;&nbsp;사용가능 금액 : <span class="d" id="customerPoint">${customer.point }</span></div>
               <div class="col-sm-5">
                  <input type="number" class="form-control" name="customerPoint" id="inputpoint" min="0"
                     value="0">
               </div>
               
               <div class="col-sm-7">
                       원 
                  <a href="" class="btn btn-warning btn-sm" id="cash-all">전액사용</a>
                  <a href="" class="btn btn-warning btn-sm" id="cash-commitbtn">적용</a>
               </div>

                  

            </div>

         </div>
         

         <h4 class="pd">약관 동의</h4>
         <div class="row">
            <div class="col-sm-8">
               <div class="row spd">
                  <h4>
                     <input type="checkbox" id="allCheck" />&nbsp;&nbsp;<strong>전체
                        동의하기</strong>
                  </h4>
               </div>
               <div class="row">
                  <input type="checkbox" name="checked" id="check1" />&nbsp;&nbsp;개인정보 제3자 제공에
                  동의합니다.
               </div>
               <div class="row">
                  <input type="checkbox" name="checked" id="check2" />&nbsp;&nbsp;결제대행서비스 이용약관에
                  동의합니다.
               </div>
               <div class="row">
                  <input type="checkbox" name="checked" id="check3" />&nbsp;&nbsp;주문할 상품설명에 명시된
                  내용과 사용조건을 확인하였으며, 취소. 환불규정에 동의합니다.
               </div>
            </div>
            <div class="col-sm-4">
               <div class="row">
                  <div class="col-sm-6">
                     <strong>총 주문금액</strong>
                  </div>
                  <div class="col-sm-6 text-right">
                  
                     <strong class="allPrice"></strong><strong>원</strong>
                     <input type="hidden" name="orderRealPrice" id="realPrice">
                  </div>
               </div>
               <div class="row">
                  <div class="col-sm-6">
                     <strong>쿠폰할인금액</strong>
                  </div>
                  <div class="col-sm-6 text-right">
                     <strong>- </strong><strong class="dis couponPrice">0</strong><strong>원</strong>
                  </div>
               </div>
               <div class="row spd">
                  <div class="col-sm-6">
                     <strong>적립금 사용</strong>
                  </div>
                  <div class="col-sm-6 text-right">
                     <strong>- </strong><strong class="usedCash">0</strong><strong>원</strong>
                  </div>
               </div>
               <div class="row">
                  <h4 class="d">총 결제금액</h4>
               </div>
               <div class="row text-right">
                  
                  <h3 class="d">
                      <span class="userCash"></span>
                     <span class="sumpricepay"><fmt:formatNumber pattern="####"><c:out value="${totalPriceAll }" /></fmt:formatNumber></span><span>원</span>
                  </h3>
               </div>
            </div>
            <div class="text-center">
               <button class="btn btn-warning btn-md" id="submit-btn" type="submit">결제</button>
               <button class="btn btn-warning btn-md">뒤로</button>
            </div>
         </div>
      </form>
   </div>
   <%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>