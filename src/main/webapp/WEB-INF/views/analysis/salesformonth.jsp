<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['line']});
    google.charts.load("current", {packages:['corechart', 'bar']});
    google.charts.load("current", {packages:["corechart"]});
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment@2.19.2/moment.min.js"></script>
<style type="text/css">
	#table-area {  height: 300px; overflow-y: scroll;}
    #search-form {  height: 100px; background-color: #e6f7ff; text-align: center;}
    table th { background-color: #e6f7ff;}
    #topic-area, #search-form, #table-area, #summary-area, #graph-area { padding-bottom: 30px;}
    #topic-area, #search-form, #summary-area, #graph-area { padding-top: 30px;}
</style>
</head>
<body>
<c:set var="menu" value="monthsales" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
<div id="body-container-body">
   <div class="container">
     
		<!--제목-->
		<div id="topic-area">
			<h2>월 단위 판매량 분석</h2>
		</div>
     
        <!--데이터 추출을 위한 검색 폼-->
		<div class="row" id="search-form">
			<form action="getprofit.do" class="form-inline" id="search-form">
				<div class="form-group">
                    <input type="month" class="form-control"  name="endday" value="${param.endday }"/>
					<select name="opt" class="form-control">
						<option>선택</option>
						<option value="productName" ${param.opt eq 'productName' ? 'selected' : '' }>상품명</option>
                    </select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-info btn-sm" id="search-btn">조회</button>
				</div>
           </form>
		</div>
		
       <!--위의 검색으로 생성되는 데이터 테이블-->
       <div class="row" id="table-area">
           <table class="table table-hover" id="data-table">
               <thead>
                   <tr>
                       <th>상품명</th>
                       <th>옵션명</th>
                       <th>주문량</th>
                       <th>수익</th>
                       <th>주문자 아이디</th>
                       <th>주문날짜</th>
                   </tr>
               </thead>
               <tbody></tbody>
           </table>
       </div>
       
       <!--데이터 기반 그래프 생성-->
		<div class="row" id="graph-area">
		
			<div class="row">
				<div id="monthSalesChart"></div>
			</div>
			
			<div class="col-sm-9">
				<div id="categoryChart"></div>
			</div>
			
			<div class="row">
				<div class="col-sm-6">
					<div id="monthSalesCircleChart"></div>
				</div>
				<div class="col-sm-6">
					<div id="categorycircleChart"></div>
				</div>
			</div>
			
		</div>
    </div>  
</div>
</body>
<script>
$(function() {
		
	function getChartData(endDay, opt, keyword) {
    	$.ajax({
    		type:"GET",
    		url:"getMonthSales.do",
    		data:{
    			endday : endDay,
    			opt : opt,
    			keyword : keyword
    		},
    		dataType:"json",
    		success:function(result) {

    			monthChartDraw(result);
    			monthCircleChartDraw(result);
    		}
    	});
    }
	
	/* 월별 차트 생성 */
    function monthChartDraw(dayData) {
    	
        var data = new google.visualization.DataTable();
        data.addColumn('string', '날짜');
        data.addColumn('number', '판매량');
        var dataArr = [];
        $.each(dayData, function(index, data) {
              dataArr.push([data.day.substr(8, data.day.length), data.quantity]);
        });
        data.addRows(dataArr);
        var options = {
        		chart: {
          		title: dayData[0].day + " ~ " + dayData[dayData.length-1].day + "판매량 현황",
          		}
        }
        var chart = new google.charts.Line(document.getElementById('monthSalesChart'));
        chart.draw(data, google.charts.Line.convertOptions(options));
     }
    
     function monthCircleChartDraw(dayData) {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '날짜');
	      data.addColumn('number', '판매량');
	      var dataArr = [];
	        $.each(dayData, function(index, data) {
	              dataArr.push([data.day.substr(8, data.day.length), data.quantity]);
	        });
	      data.addRows(dataArr);

	      var options = {
	    	title: "일별 매출 현황",
	    	slices: {  2: {offset: 0.2},
                		4: {offset: 0.3},
      		},
	        sliceVisibilityThreshold: .2
	      };

	      var chart = new google.visualization.PieChart(document.getElementById('monthSalesCircleChart'));
	      chart.draw(data, options);
	    }
     
   
    /* 카테고리 차트 생성 */
	function getCategoryData(endDay, opt, keyword) {
		$.ajax({
			type:"GET",
			url:"getMonthCategorySales.do",
			data: {
    			endday : endDay,
    			opt : opt,
    			keyword : keyword
			},
			dataType:"json",
			success:function(result) {

				CategoryChartDraw(result)
				CategoryCircleChartDraw(result)
			}
		});
	}
	
	function CategoryChartDraw(dayData) {
    	
        var data = new google.visualization.DataTable();
        data.addColumn('string', '카테고리');
        data.addColumn('number', '판매량');
        var dataArr = [];
        $.each(dayData, function(index, data) {
              dataArr.push([data.category, data.quantity]);
        });
        data.addRows(dataArr);
        var options = {
           title: "카테고리별 판매량 현황",
        }
        var chart = new google.visualization.ColumnChart(document.getElementById('categoryChart'));
        chart.draw(data, options);
        
     }
	 
	function CategoryCircleChartDraw(dayData) {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '카테고리');
	      data.addColumn('number', '판매량');
	      var dataArr = [];
	        $.each(dayData, function(index, data) {
	              dataArr.push([data.category, data.quantity]);
	        });
	      data.addRows(dataArr);

	      var options = {
	    	title: "카테고리별 판매 현황",
	    	slices: {  2: {offset: 0.2},
                4: {offset: 0.3},
      		},
	        sliceVisibilityThreshold: .2
	     };

	      var chart = new google.visualization.PieChart(document.getElementById('categorycircleChart'));
	      chart.draw(data, options);
	    }
	
	$("#search-btn").click(function(event) {
		event.preventDefault();
		
		 var endday = $("input[name=endday]").val();
		 var opt = $("select[name=opt] option:selected").val();
		 var keyword = $("input[name=keyword]").val();
		 
		getChartData(endday, opt, keyword);
	 
		getCategoryData(endday, opt, keyword);
	
		$.ajax({
			type:"GET",
			data:{
				endday: endday,
				keyword: keyword,
				opt: opt
			},
			url:"getMonthTable.do",
			dataType:"json",
			success:function(result) {

				var html="";
					$.each(result.orderDetails, function(index, orderDetail) {
						
						html += "<tr>";
						html += "<td>"+orderDetail.item.product.name+"</td>";
						html += "<td><a href='../item/detail.do?itemId="+orderDetail.item.id+"' >"+orderDetail.item.options+"</a></td>";
						html += "<td>"+orderDetail.item.salePrice+"</td>";
						html += "<td>"+((orderDetail.item.salePrice - orderDetail.item.originalPrice) * orderDetail.orderQuantity) +"</td>";
						html += "<td>"+orderDetail.order.customer.username+"</td>";
						html += "<td>"+new Date(orderDetail.order.orderDate).toLocaleDateString()+"</td>";
						html += "</tr>";
					});

					$("#data-table tbody").html(html);
			}
		});
		  
	});
	  
});
    </script>
</html>