<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-추천상품관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/prolist.css">
</head>
<body>
<c:set var="menu" value="product"></c:set>
<c:set var="sidemenu" value="recompro"></c:set>
<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
<%@ include file="/WEB-INF/views/admin/sidenav/product.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
				<h3>추천상품관리</h3>
				<hr />
				<div class="searchform text-right">
				
					<form class="form-inline">
						<div class="form-group">
							<input type="date" class="form-control input-sm" name="begindate" />
							<span>~</span> <input type="date" class="form-control input-sm"
								name="enddate" />
						</div>
						<div class="form-group">
							<select class="form-control input-sm">
								<option>전체</option>
								<option>제목</option>
								<option>판매자</option>
							</select> <input type="text" class="form-control input-sm" name="keyword" />
							<button class="btn btn-info btn-sm">조회</button>
						</div>
					</form>
				</div>
				<div class="listtable">
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>슬라이드 유형</th>
								<th>시작날짜</th>
								<th>완료날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty sliders }">
								<tr>
									<td colspan="5" class="text-center">검색된 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="slider" items="${sliders }">
								<tr>
									<td>${slider.id }</td>
									<td><a href="recomdetail.do?id=${slider.id }"><c:out value="${slider.type }"></c:out> </a></td>
									<td><fmt:formatDate value="${slider.startDate }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${slider.endDate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
							
							<!-- 
							<tr>
								<td>001</td>
								<td><a href="">[나이키]신상 에어맥스 97 슈즈 15종 득템찬스!</a></td>
								<td>쓱가</td>
								<td>2017-05-12</td>
								<td>하의</td>
							</tr>
							 -->
							
						</tbody>
					</table>
				</div>
				<div class="text-center">
					<ul class="pagination">
						<li><a href="#">&lt;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>