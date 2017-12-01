<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/abcompany/header.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>기업 고객 메인페이지</title>
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
	#question-table, #product-table, #item-table, #review-table{
	height: 50px;
	} 
</style>
</head>
<body>
<c:set var="menu" value="main" />
<%@ include file="/WEB-INF/views/abcompany/navi.jsp" %>
<div id="body-container" class="container-fluid">
	<div id="body-container-body">
		<div class="container">
		
			<div class="row">
				<h1>기업고객 관리 페이지</h1>
			</div>
			
			<hr />
			
			<div class="row">
				<div class="col-sm-6">
					<h3>문의</h3>
					<div class="text-right">
						<small><a href="../product/qna.do">더보기</a></small>
					</div>
					<div id="question-table">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
	                                <th>제목</th>
	                                <th>상태</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-6">
					<h3>최근 등록된 상품</h3>
					<div class="text-right">
						<small><a href="../product/list.do">더보기</a></small>
					</div>
					<table class="table table-bordered" id="product-table">
						<thead>
							<tr>
								<th>번호</th>
                                <th>분류</th>
                                <th>상품명</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			
			<hr />
			
			<div class="row">
				<div class="col-sm-8" id="bar-chart">
					<h3>차트</h3>
					<div id="dayChart"></div>
				</div>
				<div class="col-sm-4" id="circle-chart">
					<h3>차트</h3>
					<div id="dayCircleChart"></div>
				</div>
			</div>
			
			<hr />
			
			<div class="row">
				<div class="col-sm-6">
					<h3>최근 등록된 아이템</h3>
					<div class="text-right">
						<small><a href="../item/list.do">더보기</a></small>
					</div>
					<table class="table table-hover" id="item-table">
						<thead>
							<tr>
								<th>번호</th>
                                <th>상품명</th>
                                <th>옵션</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<div class="col-sm-6">
					<h3>리뷰</h3>
					<div class="text-right">
						<small><a href="../company/reviewList.do">더보기</a></small>
					</div>
					<table class="table table-condensed" id="review-table">
						<thead>
							<tr>
								<th>번호</th>
	                            <th>유저ID</th>
	                            <th>상품명</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	
	$.ajax({
		type:"GET",
		url:"getQuestionsForIndex.do",
		dataType:"json",
		success:function(result) {

			var html = "";
			$.each(result, function(index, question) {
				html += "<tr>";
				html += "<td>"+question.id+"</td>"
				html += "<td>"+question.title+"</td>"
				html += "<td>"+question.status+"</td>"
				html += "</tr>";
			});
			$("#question-table tbody").html(html);
		}
	});
	
	$.ajax({
		type:"GET",
		url:"getProductsForIndex.do",
		dataType:"json",
		success:function(result) {
			
			var html = "";
			$.each(result, function(index, product) {
				html += "<tr>";
				html += "<td>"+product.id+"</td>"
				html += "<td>"+product.name+"</td>"
				html += "<td>"+product.smallCategory.name+"</td>"
				html += "</tr>";
			});
			$("#product-table tbody").html(html); 
		}
	});
	
	$.ajax({
		type:"GET",
		url:"getItemsForIndex.do",
		dataType:"json",
		success:function(result) {
			
			var html = "";
			$.each(result, function(index, item) {
				html += "<tr>";
				html += "<td>"+item.id+"</td>"
				html += "<td>"+item.options+"</td>"
				html += "<td>"+item.salePrice+"</td>"
				html += "</tr>";
			});
			$("#item-table tbody").html(html); 
		}
	});
	
	$.ajax({
		type:"GET",
		url:"getReviewsForIndex.do",
		dataType:"json",
		success:function(result) {
			
			var html = "";
			$.each(result, function(index, review) {
				html += "<tr>";
				html += "<td>"+review.id+"</td>"
				html += "<td>"+review.comment+"</td>"
				html += "<td>"+review.customer.username+"</td>"
				html += "</tr>";
			});
			$("#review-table tbody").html(html);
		}
	});
	
	function getChartData(beginDay, endDay, opt, keyword) {
    	$.ajax({
    		type:"GET",
    		url:"../analysis/getDayProfit.do",
    		data:{
    			beginday: beginDay,
    			endday : endDay,
    			opt : opt,
    			keyword : keyword
    		},
    		dataType:"json",
    		success:function(result) {
    			console.log(result);
    			dayChartDraw(result);
    			dayCircleChartDraw(result);
    		}
    	});
    }
	
	/* 일별 차트 생성 */
    function dayChartDraw(dayData) {
    	
        var data = new google.visualization.DataTable();
        data.addColumn('string', '날짜');
        data.addColumn('number', '이익');
        var dataArr = [];
        $.each(dayData, function(index, data) {
              dataArr.push([data.day.substr(8, data.day.length), data.profit]);
        });
        data.addRows(dataArr);
        var options = { 
       		chart: {
       		title: dayData[0].day + " ~ " + dayData[dayData.length-1].day + "일별 매출 현황",
       		}
        };
        var chart = new google.charts.Line(document.getElementById('dayChart'));
        chart.draw(data, google.charts.Line.convertOptions(options));
        
     }
	
    function dayCircleChartDraw(dayData) {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '날짜');
	      data.addColumn('number', '이익');
	      var dataArr = [];
	        $.each(dayData, function(index, data) {
	              dataArr.push([data.day.substr(8, data.day.length), data.profit]);
	        });
	      data.addRows(dataArr);

	      var options = {
	    	title: "일별 매출 현황",
	    	slices: {  2: {offset: 0.2},
              		4: {offset: 0.3},
    		},
    		pieHole: 0.5,
	        
	      };

	      var chart = new google.visualization.PieChart(document.getElementById('dayCircleChart'));
	      chart.draw(data, options);
	    }

    google.charts.setOnLoadCallback(getChartData(moment().add(-8,"days").format("YYYY-MM-DD"), moment().add(-1,"days").format("YYYY-MM-DD")));
	
});	
</script>
</html>