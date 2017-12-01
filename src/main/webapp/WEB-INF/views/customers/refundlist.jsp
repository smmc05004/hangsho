<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<%@ include file="/WEB-INF/views/customers/inc.jsp" %>
				<!-- Tab panes -->
				<div role="tabpanel" class="tab-pane" id="profile">
					<table border="1" class="custom-table">
						<caption>취소/환불/교환(없을 때)</caption>
						<colgroup>
							<col width="150">
							<col width="400">
							<col width="90">
							<col width="150">
							<col width="120">
							<col width="120">
						</colgroup>
						<thead>
							<tr>
								<th scope="colgroup">주문번호</th>
								<th scope="colgroup">상품명/옵션</th>
								<th scope="col">수량</th>
								<th scope="col">취소/환불금액</th>
								<th scope="col">주문상태</th>
								<th scope="col">취소처리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4" class="none_lst text-center"><strong>취소/환불내역이
										없습니다.</strong><br></td>
							</tr>
						</tbody>
					</table>
					<table border="1" class="table table-condensed custom-table3">
						<caption>취소/환불/교환(있을 때)</caption>
						<colgroup>
							<col width="150">
							<col width="400">
							<col width="90">
							<col width="150">
							<col width="120">
							<col width="120">
						</colgroup>
						<thead>
							<tr>
								<th scope="colgroup">주문번호</th>
								<th scope="colgroup">상품명/옵션</th>
								<th scope="col">수량</th>
								<th scope="col">취소/환불금액</th>
								<th scope="col">주문상태</th>
								<th scope="col">취소처리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="lst-cancel-refund1">1</td>
								<td class="lst-cancel-refund2"><img
									src="../images/ryan.jpg" height="20%"> 갤럭시 노트8</td>
								<td class="lst-cancel-refund3">1</td>
								<td class="lst-cancel-refund4">1개</td>
								<td class="lst-cancel-refund5">배송완료</td>
								<td class="lst-cancel-refund6">취소완료</td>
							</tr>
							<tr>
								<td class="lst-cancel-refund1">2</td>
								<td class="lst-cancel-refund2"><img
									src="../images/ryan.jpg" height="20%"> 자바스크립트/제이쿼리</td>
								<td class="lst-cancel-refund3">3</td>
								<td class="lst-cancel-refund4">2개</td>
								<td class="lst-cancel-refund5">배송완료</td>
								<td class="lst-cancel-refund6">환불완료</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>