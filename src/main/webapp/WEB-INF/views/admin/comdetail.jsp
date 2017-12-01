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
	<c:set var="sidemenu" value="company"></c:set>
	<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
	<%@ include file="/WEB-INF/views/admin/sidenav/member.jsp"%>

	<div id="body-container-body">
		<div class="container">
			<div class="col-sm-offset-1 col-sm-10">
				<h3>기업고객</h3>
				<hr />
				<div class="searchform text-right">
				</div>
				<div>
					<table class="table listtable">
						<tbody>
							<tr>
								<th>번호</th><td>${com.id }</td>								
								<th>대표자</th><td>${com.name }</td>								
							</tr>
							<tr>
								<th>아이디</th><td colspan="3">${com.username }</td>
							</tr>
							<tr>
								<th>주소</th><td colspan="3">${com.mainaddress } ${com.detailaddress }</td>
							</tr>
							<tr>
								<th>회사번호</th><td>${com.ceonumber }</td>								
								<th>대표번호</th><td>${com.phonenumber }</td>								
							</tr>
						</tbody>
					</table>
					</div>
					<div style="margin-top: 50px; overflow-y: scroll; height: 300px; border: 1px solid #e6e6e6">
					<table class="table table-hover table-condensed table-bordered">
						<colgroup>
							<col width="15%">
							<col width="60%">
						</colgroup>
						<thead>
							<tr>
								<th>상품번호</th>
								<th>상품제목</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty products }">
								<tr>
									<td colspan="3">등록된 상품이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="product" items="${products }">
								<tr>
									<td>${product.id }</td>
									<td><a href="prodetail.do?id=${product.id }">${product.name }</a></td>
									<td><fmt:formatDate value="${product.createDate }"/> </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			<div class="text-right" style="padding-top: 10px;">
				<a href="membercom.do" class="btn btn-info">돌아가기</a>
			</div>
			</div>
		</div>
	</div>

</body>
</html>