<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-상품관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/recompro.css">
<script type="text/javascript">
$(function() {
	$("#allcheck-01, #allcheck-02").click(function() {
		var isallcheck = $(this).is(":checked");
		var $checkbox = $(this).closest("table").find("td input")
		
		if (isallcheck) {
			$checkbox.removeClass("checked");
			$checkbox.addClass("checked").prop("checked", true);
		} else {
			$checkbox.removeClass("checked").prop("checked", false);
		}
	});
	
	$(document).on("click", "tbody tr input", function() {
		var ischeck = $(this).is(":checked");
		
		if (ischeck == true) {
			$(this).addClass("checked");		
		} else {
			$(this).removeClass("checked");
		}
		console.log($(this))
	})
	
	$(document).on("click", "#btn-down", function () {
		var $trcheck = $("#prolist-table-01 tbody tr .checked").prop("checked", false).removeClass("checked").closest("tr").clone();
		$("#prolist-table-02 tbody").append($trcheck);
		$("#allcheck-01").prop("checked", false).removeClass("checked");
	})
	
	$(document).on("click", "#btn-up", function () {
		var $trcheck = $("#prolist-table-02 tbody tr .checked").closest("tr");
		console.log($trcheck);
		$trcheck.remove();
	}) 
	
})
</script>
</head>
<body>
<c:set var="menu" value="product"></c:set>
<c:set var="sidemenu" value="recompro"></c:set>
<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
<%@ include file="/WEB-INF/views/admin/sidenav/product.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
				<h3>추천상품 설정</h3>
				<hr />
				<div class="searchform">
					<form class="form-inline">
						<div class="form-group">
							<input type="date" class="form-control input-sm" name="begindate" />
							<span>~</span> 
							<input type="date" class="form-control input-sm" name="enddate" />
							<select class="form-control input-sm">
								<option>전체</option>
								<option>상품명</option>
								<option>카테고리</option>
								<option>판매자</option>
							</select> <input type="text" class="form-control input-sm" name="keyword" />
							<button class="btn btn-info btn-sm">조회</button>
						</div>
					</form>
				</div>
				<div class="prolist">
					<label class="list-title">상품리스트</label>
					<div class="listtable">
						<table class="table table-condensed table-hover text-center" id="prolist-table-01">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="50%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="allcheck-01"/></th>
									<th>상품번호</th>
									<th>상품제목</th>
									<th>판매자</th>
									<th>카테고리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty products }">
									<tr>
										<td colspan="5" class="text-center">검색된 결과가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="product" items="${products }">
									<tr>
										<td><input type="checkbox" /></td>
										<td>${product.id }</td>
										<td><c:out value="${product.name }"></c:out></td>
										<td>${product.company.name }</td>
										<td>
												${product.smallCategory.name }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn-recom">
					<a class="btn btn-default btn-sm" id="btn-down"> 추천 ▼ </a>
					<a class="btn btn-default btn-sm" id="btn-up"> 취소 ▲ </a>
				</div>
				<div class="prolist">
					<label class="list-title">추천상품</label>
					<div class="selecttable">
						<table class="table table-condensed table-hover text-center" id="prolist-table-02">
							<thead>
								<tr>
									<th><input type="checkbox" id="allcheck-02" /></th>
									<th>상품번호</th>
									<th>상품제목</th>
									<th>판매자</th>
									<th>카테고리</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
					<div class="text-right">
						<button id="btn-sumbit-02" type="submit" class="btn btn-info btn-sm">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>