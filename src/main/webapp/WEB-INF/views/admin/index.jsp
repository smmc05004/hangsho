<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-회원관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/prolist.css">
<link rel="stylesheet" href="/resources/css/admin/index.css">
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment@2.19.2/moment.min.js"></script>
</head>
<script type="text/javascript">
$(function() {
	var date = moment().format('YYYY-MM-DD');
	getAjaxDailyAll();
	getAjaxAllCategory();
	function getAjaxDailyAll() {
		$.ajax({
			type:"GET",
			url:"getdailyall.do",
			data:{selectDate:date},
			dataType:"json",
			success:function(chartData) {
				console.log(chartData)
				drawDailyChart(chartData);
			}
		});
	}
	function getAjaxAllCategory() {
		$.ajax({
			type:"GET",
			url:"getdailyallcategory.do",
			data:{selectDate:date},
			dataType:"json",
			success:function(chartData) {
				drawDailyDonutChart(chartData);
			}
		}); 
	}
});
</script>
<script type="text/javascript">
function drawDailyChart(srcData) {
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(function() {
		
		 var data = new google.visualization.DataTable();
	      data.addColumn('timeofday', 'Time of Day');
	      data.addColumn('number', 'Motivation Level');
	      		      
	      var chartData = [];
	      for (var i=0; i<srcData.length; i++ ) {
	    	  chartData.push([ 
	    		{v:[i, 0, 0], f:srcData[i].qty+"개"},
	    			srcData[i].profit
	    	  ])
	      }
	      data.addRows(chartData);
	    
	      var options = {
			        title: 'Motivation Level Throughout the Day',
			        hAxis: {
			          title: 'Time of Day',
			          format: 'h:mm a',
			          viewWindow: {
			            min: [00, 00, 0],
			            max: [24, 00, 0]
			          }
			        },
			        vAxis: {
			          title: 'Profit'
			        },
			        width:580,
			        height:300
			      };

			      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

			      chart.draw(data, options);
	});
}
function drawDailyDonutChart(srcData) {
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(function drawChart() {
	
    	var chartData = [['Task', 'salePrice']];
    	for(i=0; i<srcData.length; i++){
    		chartData.push(
    			[srcData[i].name, srcData[i].profit]
    		)
    	}
    	
      var data = google.visualization.arrayToDataTable(chartData);

      var options = {
        pieHole: 0.4
      };
   

      var chart = new google.visualization.PieChart(document.getElementById('donut_all_daily'));
      chart.draw(data, options);
    });
}
</script>
<body>
<%@ include file="/WEB-INF/views/admin/nav.jsp" %>
<%@ include file="/WEB-INF/views/admin/sidenav/index.jsp" %>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-12 charts">
                    <h3>판매·판매량 실적</h3>
                    <span class="more"><a href="earningall.do" class="btn btn-default btn-xs">더보기</a></span>
                    <hr>
                    <div id="chart_div"></div>
                    <span><div id="donut_all_daily"></div></span>
               </div>
			<div class="col-sm-6 middletitle">
				<h3>상품리스트</h3>
				<span class="more"><a href="prolist.do" class="btn btn-default btn-xs">더보기</a></span>
				<hr>
				<table class="table table-bordered table-hover table-condensed">
					<colgroup>
						<col width="10%">
						<col width="60%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>상품이름</th>
							<th>판매자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${products }" begin="0" end="3">
							<tr>
								<td>${product.id }</td>
								<td>${product.name }</td>
								<td>${product.company.name }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody></tbody>
				</table>
			</div>
			<div class="col-sm-6 middletitle">
				<h3>회원관리</h3>
				<span class="more"><a href="membercom.do" class="btn btn-default btn-xs">더보기</a></span>
				<hr>
				<table class="table table-bordered table-hover table-condensed">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="40%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>판매이름</th>
							<th>회사번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="com" items="${companies }" begin="0" end="3">
							<tr>
								<td>${com.id }</td>
								<td>${com.name }</td>
								<td>${com.ceonumber }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody></tbody>
				</table>
			</div>
			<div class="col-sm-6 middletitle">
				<h3>문의접수</h3>
				<span class="more"><a href="qnalist.do" class="btn btn-default btn-xs">더보기</a></span>
				<hr>
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="qna" items="${qnas }" begin="0" end="3">
							<tr>
								<td>${qna.id }</td>
								<td>${qna.title }</td>
								<td>${qna.customer.name }</td>
								<td>${qna.replyId == 0 ? '답변작성' : '답변완료' }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody></tbody>
				</table>
			</div>
			<div class="col-sm-6 middletitle">
				<h3>회원관리</h3>
				<span class="more"><a href="membercus.do" class="btn btn-default btn-xs">더보기</a></span>
				<hr>
				<table class="table table-bordered table-hover table-condensed">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>회원이름</th>
							<th>등급</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cus" items="${customers }" begin="0" end="3">
							<tr>
								<td>${cus.id }</td>
								<td>${cus.username }</td>
								<td>${cus.name }</td>
								<td>${cus.grade }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>