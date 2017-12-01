<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-실적관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/earningpro.css">
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
	
	// 디폴트 상품리스트 맨 첫 행 아이템 아이디 뽑기
	var firsttr = $(".listtable tbody tr:first-child td:nth-child(2) a");
	var comid = firsttr.attr("id").replace("comid-", "");
	
	getAjaxDailyBycom();
	getAjaxMonthBycom();
	
	$("#a-date-left, #a-date-right").click(function() {
		var name = $(this).attr("id").replace("a-date-", "");
		
		if (name == 'left') {
			date = moment($("#date-input").val(), 'YYYY-MM-DD').add(-1, 'days').format("YYYY-MM-DD");
			$("#date-input").val(date);
			getAjaxDailyBycom();
		} else {
			date = moment($("#date-input").val(), 'YYYY-MM-DD').add(+1, 'days').format("YYYY-MM-DD");
			$("#date-input").val(date);
			getAjaxDailyBycom();
		}
	})
	
	$("#a-month-left, #a-month-right").click(function() {
		var name = $(this).attr("id").replace("a-month-", "");
		
		if (name == 'left') {
			month = moment($("#month-input").val(), 'YYYY-MM').add(-1, 'month').format("YYYY-MM");
			$("#month-input").val(month);
			getAjaxMonthBycom();
		} else {
			month = moment($("#month-input").val(), 'YYYY-MM').add(+1, 'month').format("YYYY-MM");
			$("#month-input").val(month);
			getAjaxMonthBycom();
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
		getAjaxDailyBycom();
	});
	
	$(document).on("change", "#month-input", function () {
		month = $(this).val();
		getAjaxMonthBycom();
	});
	
	$(document).on("change", "#year-input", function () {
		var strYear = $(this).val();
		year = strYear.substring(0,4);
		//getAjaxYear();
	});
	
	$(".listtable tbody tr").click(function() {
		var tr = $(this);
		tr.addClass("trbg").siblings().removeClass("trbg");
		comid = tr.find("a").attr("id").replace("comid-", "");
		getAjaxDailyBycom();
		getAjaxMonthBycom();
		//getAjaxYear();
	})
	
	function getAjaxDailyBycom() {
		$.ajax({
			type:"GET",
			url:"getdailybycom.do",
			data:{companyId:comid, selectDate:date},
			dataType:"json",
			success:function(chartData) {
				drawDailyChart(chartData);
			}
		})	 
	}
	
	function getAjaxMonthBycom() {
		$.ajax({
			type:"GET",
			url:"getmonthbycom.do",
			data:{companyId:comid, selectDate:month},
			dataType:"json",
			success:function(chartData) {
				var yyyy = month.substring(0,4);
				var mm = (month.substring(5,7)) - 1;		
				drawMonthChartByCom(chartData, yyyy, mm);
			}
		})	 
	}
	
	function getAjaxYear() {
		$.ajax({
			type:"GET",
			url:"getproyear.do",
			data:{itemId:itemid, selectDate:year},
			dataType:"json",
			success:function(chartData) {
				drawYearChart(chartData);
			}
		});
	}
	
})
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
	      
	      /*
	      for (var i=0; i<=23; i++) {
	    	 chartData.push([
	    		 {v:[i, 0, 0]},
	    	  	srcData["t" + i] 
	    	 ]) 
	      }*/
	      
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
			        width:980,
			        height:500
			      };

			      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

			      chart.draw(data, options);
	});
}

function drawMonthChartByCom(srcData, yyyy, mm) {
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
		 width:980,
		 height:500
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('line_chart_div'));
	      chart.draw(data, options);
	});
	}
</script>
<style>
		.form-con-02 {padding-left: 90px !important; width: 245px !important;}
</style>
</head>
<body>
	<c:set var="menu" value="earning"></c:set>
	<c:set var="sidemenu" value="company"></c:set>
	<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
	<%@ include file="/WEB-INF/views/admin/sidenav/earning.jsp"%>

	<div id="body-container-body">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#menu1">일</a></li>
			<li><a data-toggle="tab" href="#menu2">월</a></li>
			<li><a data-toggle="tab" href="#menu3">년</a></li>
		</ul>
		<div class="container main-div">

			<div class="tab-content">
				<div id="menu1" class="tab-pane fade in active">
					<div class="col-sm-offset-1 col-sm-10">

						<div class="col-sm-6 col-sm-offset-4 inputdate form-inline">
							<a href="#" id="a-date-left" class="form-group">◀</a> 
							<input class="form-group form-control form-con" id="date-input" type="date" /> 
							<a href="#" id="a-date-right" class="form-group">▶</a>
						</div>

						<div class="chartdiv row">
							<div id="chart_div"></div>
						</div>
						
						
					</div>
				</div>
				<div id="menu2" class="tab-pane fade">
					<div class="col-sm-offset-1 col-sm-10">
						<div class="col-sm-6 col-sm-offset-4 inputdate form-inline">
							<a href="#" id="a-month-left" class="form-group">◀</a> 
							<input class="form-control from-group form-con-02" type="text" id="month-input">
							<a href="#" id="a-month-right" class="form-group">▶</a>
						</div>

						<div class="chartdiv row">
							<div id="line_chart_div"></div>
						</div>
						
					</div>
				</div>
				<div id="menu3" class="tab-pane fade">
					<div class="col-sm-offset-1 col-sm-10">
					
						<div class="col-sm-6 col-sm-offset-4 inputdate form-inline">
							
							<a href="#" id="a-year-left" class="form-group">◀</a> 
							<input class="form-control from-group form-con-01" type="text" id="year-input">
							<a href="#" id="a-year-right" class="form-group">▶</a>
							</div>
						
						<div class="chartdiv row">
							<div id="chart_year_div"></div>
						</div>
						
						</div>
					
					</div>
				</div>
			</div>
			<div class="container">
			<div class="searchform">
							<form class="form-inline">
								<div class="form-group">
									<input type="date" class="form-control input-sm" name="begindate" /> 
									<span>~</span> <input type="date" class="form-control input-sm" name="enddate" />
								</div>
								<div class="form-group pull-right">
									<select class="form-control input-sm" name="opt">
										<option value="title"
											${param.opt eq 'title' ? 'selected' : '' }>상품명</option>
										<option value="seller"
											${param.opt eq 'seller' ? 'selected' : '' }>판매자</option>
									</select> <input type="text" class="form-control input-sm"
										name="keyword" />
									<button class="btn btn-info btn-sm">검색</button>
								</div>
							</form>
						</div>
						
						<div class="listtable">
							<table class="table table-condensed">
								<thead>
									<tr>
										<th>기업번호</th>
										<th>기업명</th>
										<th>이메일</th>
										<th>전화번호</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty companies }">
										<tr>
											<td colspan="5">검색 결과과 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="com" items="${companies }">
										<tr>
											<td>${com.id }</td>
											<td><a class="comid" id="comid-${com.id }"><c:out value="${com.name }"></c:out></a></td>
											<td>${com.username }</td>
											<td>${com.ceonumber}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
		</div>
	</div>

</body>
</html>