$(function() {

	   
	   $("#apply-coupon-btn").click(function() {
	      $(".dis").text($("#grade").attr("data-discount"));
	      
	      var cash = $("#inputpoint").val();
	      var originPay = $(".allPrice").text();
	      var deliveryPay = $(".deliveryFee").text();
	      var couponPay = $(".couponPrice").text();

	      var resultPay = Number(originPay)+Number(deliveryPay)-Number(couponPay)-Number(cash);
	      
	      $(".sumpricepay").text(resultPay);
	      
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
	        alert(delivery);

	        
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
	        alert(delId);
	        
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
	        alert(delId);
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
	        var deli = $("#deli2").val();
	        
	        $("#address2").val(addr1);
	        $("#detailaddress2").val(detailaddr);
	        $("#postalcode2").val(postalCode);
	        $("#delivery2").text(deli);
	        
	    });
	    
	    $("#useadd3").click(function() {
	        var addr1 = $("#main-address3").val();
	        var detailaddr = $("#address-detail-input3").val();
	        var postalCode = $("#postal-code3").val();
	        var deli = $("#deli3").val();
	        
	        $("#address3").val(addr1);
	        $("#detailaddress3").val(detailaddr);
	        $("#postalcode3").val(postalCode);
	        $("#delivery3").text(deli);
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
	       var payPrice = $(".allPrice").text();
	       $("#realPrice").val(payPrice);
	       var price = $(".sumpriceall").text();
	       $("#totalPrice").val(price);
	       alert($("#deliveryId").val());
	       if(!$("#check1").prop("checked") || !$("#check2").prop("checked") || !$("#check3").prop("checked")) {
	          alert("약관에 동의해주세요.");
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