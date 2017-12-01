<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-회원관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/memberlist.css">
</head>
<body>
	<c:set var="menu" value="member"></c:set>
	<c:set var="sidemenu" value="customer"></c:set>
	<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
	<%@ include file="/WEB-INF/views/admin/sidenav/member.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
				<h3>개인고객</h3>
				<hr />
				<div class="searchform">
					<form class="form-inline">
						
						<div class="form-group">
							<select class="form-control input-sm">
								<option>전체</option>
								<option>이름</option>
							</select> <input type="text" class="form-control input-sm" name="keyword" />
							<button class="btn btn-info btn-sm">조회</button>
						</div>
					</form>
				</div>
				<div class="listtable">
					<table class="table table-hover table-condensed listtable">
						<colgroup>
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>회원번호</th>
								<th>이름</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>등급</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="customer" items="${customers }" begin="0" end="14">
								<tr>
									<td>${customer.id }</td>
									<td><a href="cusdetail.do?cus=${customer.id }"><c:out value="${customer.name }"></c:out></a></td>
									<td><c:out value="${customer.username }"></c:out></td>
									<td><c:out value="${customer.nickname }"></c:out></td>
									<td><c:out value="${customer.grade }"></c:out></td>
								</tr>
							</c:forEach>
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