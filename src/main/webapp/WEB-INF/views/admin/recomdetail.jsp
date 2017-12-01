<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-상품관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<style>
#body-container-body>div:first-child {margin-top: 50px;}
.listtable {overflow-y: scroll; height: 550px; border: 1px solid #e6e6e6;}
.selecttable {overflow-y: scroll; height: 550px; border: 1px solid #e6e6e6;}
th {background-color: #e6e6e6; text-align: center;}
.searchform {margin-top: 15px; margin-bottom: 15px;}
.prolist {position: relative;}
.list-title {font-size: 20px; text-align: right; color: #333;}
.btn-recom {text-align: center; margin-top: 350px;}
.btn-recom a {margin-bottom: 5px;}
#btn-div {margin-top: 10px;}
.trselect {background-color: #e6e6e6}
</style>
<script type="text/javascript">
$(function() {
	$("#allcheck-01, #allcheck-02").click(function() {
		var isallcheck = $(this).is(":checked");
		var $tr = $(this).closest("table").find("tr")
		
		if (isallcheck) {
			$tr.removeClass("trselect");
			$tr.addClass("trselect");
		} else {
			$tr.removeClass("trselect");
		}
	});
	
	$(document).on("click", "tbody tr", function() {
		$(this).toggleClass("trselect");
	})
	
	$(document).on("click", "#btn-right", function () {
		var $trselect = $("#prolist-table-01 tbody .trselect").removeClass("trselect").clone();
		$("#prolist-table-02 tbody").append($trselect);
		$("#allcheck-01, #allcheck-02").prop("checked", false);
	})
	
	$(document).on("click", "#btn-left", function () {
		var $trselect = $("#prolist-table-02 tbody .trselect");
		$trselect.remove();
		$("#allcheck-01, #allcheck-02").prop("checked", false);
	}) 
	
})
</script>
</head>
<body>
<c:set var="menu" value="product"></c:set>
<c:set var="sidemenu" value="recompro"></c:set>
<%@ include file="/WEB-INF/views/admin/nav.jsp"%>00
<%@ include file="/WEB-INF/views/admin/sidenav/product.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-12">
				<h3>추천상품 설정</h3>
				<hr />
				<div class="col-sm-5">
					<label class="list-title">상품리스트</label>
					<div class="searchform">
						<form>
							<div class="form-inline">
								<div class="form-group">
									<select class="form-control input-sm">
										<option>카테고리</option>
										<option>식품</option>
										<option>패션</option>
										<option>메인</option>
									</select> 
									<select class="form-control input-sm">
										<option>전체</option>
										<option>상품명</option>
										<option>판매자</option>
									</select> 
									<input type="text" class="form-control input-sm" name="keyword" />
									<button class="btn btn-default btn-sm">검색</button>
								</div>
							</div>
						</form>
					</div>
					<div class="prolist">

						<div class="listtable">
							<table class="table table-condensed table-hover text-center" id="prolist-table-01">
								<colgroup>
                                    <col width="15%">
                                    <col width="40%">
                                    <col width="20%">
                                    <col width="20%">
                                </colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" id="allcheck-01" /> 번호</th>
										<th>제목</th>
										<th>판매자</th>
										<th>분류</th>
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
											<td>
												${product.id }
												<input class="hidden" value="${product.id }" name="productId"/> 
											</td>
											<td><c:out value="${product.name }"></c:out></td>
											<td>${product.company.name }</td>
											<td>${product.smallCategory.name }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-sm-1">
					<div class="btn-recom">
						<a class="btn btn-default btn-sm" id="btn-right"> ▶ 추천 </a>
						<a class="btn btn-default btn-sm" id="btn-left"> ◀ 취소 </a>
					</div>
				</div>
				<div class="col-sm-5">
					<label class="list-title">추천상품</label>
						<form action="recomadd.do" method="post">
							<input class="hidden" value="${param.id }" name="sid"/>
							<div class="searchform">
								<div class="form-inline form-group">
									<select class="form-control input-sm" name="type">
										<option ${slider.type eq '메인' ? 'selected' : ''}>메인</option>
										<option ${slider.type eq '베스트' ? 'selected' : ''}>베스트</option>
										<option ${slider.type eq '신상품' ? 'selected' : ''}>신상품</option>
										<option ${slider.type eq '인기' ? 'selected' : ''}>인기</option>
										<option ${slider.type eq '식품' ? 'selected' : ''}>식품</option>
										<option ${slider.type eq '패션' ? 'selected' : ''}>패션</option>
										<option ${slider.type eq '가전' ? 'selected' : ''}>가전</option>
									</select> 
									<input type="date" class="form-control input-sm" name="startDate" value="${slider.startDateFormat }"/> <span>~</span> 
									<input type="date" class="form-control input-sm" name="endDate" value="${slider.endDateFormat }"/>
								</div>
							</div>
						<div class="prolist">
							<div class="selecttable">
								<table class="table table-condensed table-hover text-center" id="prolist-table-02">
									<colgroup>
	                                    <col width="15%">
	                                    <col width="40%">
	                                    <col width="20%">
	                                    <col width="20%">
	                                </colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" id="allcheck-02" /> 번호</th>
											<th>제목</th>
											<th>판매자</th>
											<th>분류</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="sliderInfo" items="${sliderInfos }">
											<tr>
												<td>
													${sliderInfo.product.id }
													<input class="hidden" value="${sliderInfo.product.id }" name="productId"/> 
												</td>
												<td><c:out value="${sliderInfo.product.name }"></c:out></td>
												<td>${sliderInfo.product.company.name }</td>
												<td>${sliderInfo.product.smallCategory.name }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="text-right" id="btn-div">
								<a href="recompro.do" class="btn btn-default btn-sm">돌아가기</a>
								<button  type="submit" class="btn btn-info btn-sm">저장</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>