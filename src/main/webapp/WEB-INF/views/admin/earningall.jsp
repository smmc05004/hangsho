<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-실적관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/js/admin/chart.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment@2.19.2/moment.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
$(function() {
	$('#year-input').datepicker({
        minViewMode: 'years',
        autoclose: true,
        format: 'yyyy년'
 	 });
	$('#month-input').datepicker({
		minViewMode: 1,
        autoclose: true,
		format: 'yyyy-mm'
 	 });
	
	// 오늘날짜 뽑기
	var date = moment().format("YYYY-MM-DD");
	var month = moment().format("YYYY-MM");
	var year = moment().format("YYYY");
	// 디폴트 오늘날짜
	$("#date-input").val(date);
	$("#month-input").val(month);
	$("#year-input").val(year+'년');

	getAjaxAllCategory();
	getAjaxDailyAll();
	getAjaxAllMonthCategory();
	getAjaxMonth();
	
	$("#a-date-left, #a-date-right").click(function() {
		var name = $(this).attr("id").replace("a-date-", "");
		
		if (name == 'left') {
			date = moment($("#date-input").val(), 'YYYY-MM-DD').add(-1, 'days').format("YYYY-MM-DD");
			$("#date-input").val(date);
			getAjaxAllCategory();
			getAjaxDailyAll();
		} else {
			date = moment($("#date-input").val(), 'YYYY-MM-DD').add(+1, 'days').format("YYYY-MM-DD");
			$("#date-input").val(date);
			getAjaxAllCategory();
			getAjaxDailyAll();
		}
	})
	
	$("#a-month-left, #a-month-right").click(function() {
		var name = $(this).attr("id").replace("a-month-", "");
		
		if (name == 'left') {
			month = moment($("#month-input").val(), 'YYYY-MM').add(-1, 'month').format("YYYY-MM");
			$("#month-input").val(month);
			getAjaxAllMonthCategory();
			getAjaxMonth();
		} else {
			month = moment($("#month-input").val(), 'YYYY-MM').add(+1, 'month').format("YYYY-MM");
			$("#month-input").val(month);
			getAjaxAllMonthCategory();
			getAjaxMonth();
		}
	})
	
	$("#a-year-left, #a-year-right").click(function() {
		var name = $(this).attr("id").replace("a-year-", "");
		
		if (name == 'left') {
			year = moment($("#year-input").val(), 'YYYY').add(-1, 'year').format("YYYY");
			$("#year-input").val(year+'년');
			getAjaxYear();
		} else {
			year = moment($("#year-input").val(), 'YYYY').add(+1, 'year').format("YYYY");
			$("#year-input").val(year+'년');
			getAjaxYear();
		}
	})
	$(document).on("change", "#date-input", function () {
		date = $(this).val();
		getAjaxAllCategory();
		getAjaxDailyAll();
	});
	
	$(document).on("change", "#month-input", function () {
		month = $(this).val();
		getAjaxAllMonthCategory();
		getAjaxMonth();
	});
	
	$(document).on("change", "#year-input", function () {
		var strYear = $(this).val();
		year = strYear.substring(0,4);
		//getAjaxYear();
	});
	
	function getAjaxAllCategory() {
		$.ajax({
			type:"GET",
			url:"getdailyallcategory.do",
			data:{selectDate:date},
			dataType:"json",
			success:function(chartData) {
				drawDailyDonutChart(chartData);
				var html = '';
				var totalQty = 0;
				var totalProfit = 0;
				for (i=0; i<chartData.length; i++) {
					html += "<tr>";
					html += "<td>"+chartData[i].name+"</td>";
					html += "<td>"+Number(parseInt(chartData[i].qty)).toLocaleString()+"</td>";
					html += "<td>"+Number(parseInt(chartData[i].profit)).toLocaleString()+"</td>";
					html += "</tr>";
					
					totalQty += parseInt(chartData[i].qty);
					totalProfit += parseInt(chartData[i].profit);
				}
				$("#info-table-tbody").html(html);
				var htmlTotal = "<tr><th>Total</th><td>"+Number(totalQty).toLocaleString()+" 개</td><td>"+Number(totalProfit).toLocaleString()+" 원</td></tr>";
				$("#info-total-table-tbody").html(htmlTotal);
			}
		})	 
	}
	
	function getAjaxAllMonthCategory() {
		console.log(month);
		$.ajax({
			type:"GET",
			url:"getmonthallcategory.do",
			data:{selectDate:month},
			dataType:"json",
			success:function(chartData) {
				drawMonthDonutChart(chartData);
				console.log(chartData);
				var html = '';
				var totalQty = 0;
				var totalProfit = 0;
				for (i=0; i<chartData.length; i++) {
					html += "<tr>";
					html += "<td>"+chartData[i].name+"</td>";
					html += "<td>"+Number(parseInt(chartData[i].qty)).toLocaleString()+"</td>";
					html += "<td>"+Number(parseInt(chartData[i].profit)).toLocaleString()+"</td>";
					html += "</tr>";
					
					totalQty += parseInt(chartData[i].qty);
					totalProfit += parseInt(chartData[i].profit);
				}
				$("#info-table-tbody-month").html(html);
				var htmlTotal = "<tr><th>Total</th><td>"+Number(totalQty).toLocaleString()+" 개</td><td>"+Number(totalProfit).toLocaleString()+" 원</td></tr>";
				$("#info-total-table-tbody-month").html(htmlTotal);
			}
		})	 
	}
	
	function getAjaxDailyAll() {
		$.ajax({
			type:"GET",
			url:"getdailyall.do",
			data:{selectDate:date},
			dataType:"json",
			success:function(chartData) {
				drawDailyChart(chartData);
			}
		})	 
	}
	function getAjaxMonth() {
		$.ajax({
			type:"GET",
			url:"getmonthall.do",
			data:{selectDate:month},
			dataType:"json",
			success:function(chartData) {
				var yyyy = month.substring(0,4);
				var mm = (month.substring(5,7)) - 1;		
				drawMonthChart(chartData, yyyy, mm);
			}
		})	 
	}

	
})
</script>
<script type="text/javascript">
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

function drawMonthDonutChart(srcData) {
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
        pieHole: 0.4,
        width:500,
        height:500
      };
   

      var chart = new google.visualization.PieChart(document.getElementById('donut_all_month'));
      chart.draw(data, options);
    });
}

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
			          title: 'Profit',
			        },
			        width:1300,
			        height:400
			      };

			      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

			      chart.draw(data, options);
	});
	
}

function drawMonthChart(srcData, yyyy, mm) {
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(function() {
	var data = new google.visualization.DataTable();
	      data.addColumn('date', 'Time of Day');
	      data.addColumn('number', 'profit');
	      var chartData = [];
	      for (var i=0; i<srcData.length; i++ ) {
	    	  chartData.push([ 
	    		 {v: new Date(yyyy, mm, i + 1), f:yyyy+'/'+(mm + 1)+'/'+ (i+1)},
	    		  srcData[i].profit
	    	  ])
	      }
	      
	      data.addRows(chartData);
	      
	      var options = {
	        hAxis: {
	          format: 'MM/dd',
	          gridlines: {count: 15}
	        },
	        vAxis: {
	                    title: 'profit',
	                format: 'short'
	            },
		 width:1300,
		 height:400
	      };
	  
	         
	      var chart = new google.visualization.LineChart(document.getElementById('line_chart_div'));
	      chart.draw(data, options);
	});
	}
</script>
<style>
#chart_div {; width: 1300px; height: 400px;}
#line_chart_div {width: 1300px; height: 400px;}
#chart_year_div {width: 980px; height: 500px;}
th {background-color: #e6e6e6;}
.listtable {overflow-y: scroll; height: 212px; border: 1px solid #e6e6e6;}
.searchform {margin-bottom: 20px;}
.pagination a {color: #666 !important;}
.pagination .active a{background-color: #5bc0de; color: #fff !important; border-color: #5bc0de;}
#chart-daily-div {z-index: 2; position: absolute; left: 200px; top: 20px;}
.chart-donut-div {z-index: 1; position: absolute; top:340px; left: 330px;}
#info-table {z-index: 3; position: absolute; width: 550px; height: 250px; top:430px; left: 782px; overflow-y: scroll; border: 1px solid #e6e6e6; }
#info-total-table {z-index: 3; position: absolute; width: 550px; height: 34px; top:700px; left: 782px;}
#info-table-tbody {overflow-y: scroll}
.main-div {position: relative; margin-top: 20px;}
.inputdate {position: absolute; z-index: 30;}
.form-con {padding-left: 75px !important;}
.trbg {background-color: #f2f2f2;}
.form-con-01 {padding-left: 96px !important; width: 245px !important;}
.form-con-02 {padding-left: 90px !important; width: 245px !important;}
#donut_all_daily {width: 500px; height: 500px;}
#donut_all_month {width: 500px; height: 500px;}
</style>
</head>
<body>
	<c:set var="menu" value="earning"></c:set>
	<c:set var="sidemenu" value="all"></c:set>
	<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
	<%@ include file="/WEB-INF/views/admin/sidenav/earning.jsp"%>

	<div id="body-container-body">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#menu1" id="days">일</a></li>
			<li><a id="month" data-toggle="tab" href="#menu2">월</a></li>
			<li><a id="year" data-toggle="tab" href="#menu3">년</a></li>
		</ul>
		<div class="main-div">

			<div class="tab-content">
				<div id="menu1" class="tab-pane fade in active">
				<div class="container">
					<div class="col-sm-offset-1 col-sm-10">
						<div class="col-sm-6 col-sm-offset-4 inputdate form-inline">
							<a href="#" id="a-date-left" class="form-group">◀</a> 
							<input class="form-group form-control form-con" id="date-input" type="date" /> 
							<a href="#" id="a-date-right" class="form-group">▶</a>
						</div>
					</div>
				</div>

						<div class="inline-form">
							<div class="form-group chart-donut-div">
								<div id="donut_all_daily"></div>
							</div>
							<div class="form-group" id="chart-daily-div">
								<div id="chart_div"></div>
							</div>
						</div>
					<div id="info-table">
						<table class="table table-condensed table-bordered text-right">
							<colgroup>
								<col width="26%" />
								<col width="37%" />
								<col width="37%" />
							</colgroup>
							<thead>
								<tr>
									<th class="text-right">카테고리</th>
									<th class="text-right">판매량</th>
									<th class="text-right">수익</th>
								</tr>
							</thead>
							<tbody id="info-table-tbody">
							</tbody>
						</table>
					</div>
					<div id="info-total-table">
						<table class="table table-condensed table-bordered text-right">
							<colgroup>
								<col width="25%" />
								<col width="36%" />
								<col width="39%" />
							</colgroup>
							<tbody id="info-total-table-tbody">
							</tbody>
						</table>
					</div>
						
				</div>
				<!-- menu2 -->
				<div id="menu2" class="tab-pane fade">
					<div class="container">
						<div class="col-sm-offset-1 col-sm-10">
							<div class="col-sm-6 col-sm-offset-4 inputdate form-inline">
								<a href="#" id="a-month-left" class="form-group">◀</a> 
								<input class="form-control from-group form-con-02" type="text" id="month-input">
								<a href="#" id="a-month-right" class="form-group">▶</a>
							</div>
						</div>
					</div>

						<div class="inline-form">
							<div class="form-group chart-donut-div">
								<div id="donut_all_month"></div>
							</div>
							<div class="form-group" id="chart-daily-div">
								<div id="line_chart_div"></div>
							</div>
						</div>
					<div id="info-table">
						<table class="table table-condensed table-bordered text-right">
							<colgroup>
								<col width="26%" />
								<col width="37%" />
								<col width="37%" />
							</colgroup>
							<thead>
								<tr>
									<th class="text-right">카테고리</th>
									<th class="text-right">판매량</th>
									<th class="text-right">수익</th>
								</tr>
							</thead>
							<tbody id="info-table-tbody-month">
							</tbody>
						</table>
					</div>
					<div id="info-total-table">
						<table class="table table-condensed table-bordered text-right">
							<colgroup>
								<col width="25%" />
								<col width="36%" />
								<col width="39%" />
							</colgroup>
							<tbody id="info-total-table-tbody-month">
							</tbody>
						</table>
					</div>
				</div>
				<div id="menu3" class="tab-pane fade">
					<div class="container">
						<div class="col-sm-offset-1 col-sm-10">
							<div class="col-sm-6 col-sm-offset-4 inputdate form-inline">
								<a href="#" id="a-year-left" class="form-group">◀</a> 
								<input class="form-control from-group form-con-01" type="text" id="year-input">
								<a href="#" id="a-year-right" class="form-group">▶</a>
							</div>
						</div>
					</div>

						<div class="inline-form">
							<div class="form-group chart-donut-div">
								<div id="donut_all_daily"></div>
							</div>
							<div class="form-group" id="chart-daily-div">
								<div id="chart_div"></div>
							</div>
						</div>
					<div id="info-table">
						<table class="table table-condensed table-bordered">
							<colgroup>
								<col width="26%" />
								<col width="37%" />
								<col width="37%" />
							</colgroup>
							<thead>
								<tr>
									<th>카테고리</th>
									<th>판매량</th>
									<th>수익</th>
								</tr>
							</thead>
							<tbody id="info-table-tbody">
							</tbody>
						</table>
					</div>
					<div id="info-total-table">
						<table class="table table-condensed table-bordered">
							<colgroup>
								<col width="25%" />
								<col width="36%" />
								<col width="39%" />
							</colgroup>
							<tbody id="info-total-table-tbody">
							</tbody>
						</table>
					</div>
					</div>
				</div>
			</div>
	</div>

</body>
</html>