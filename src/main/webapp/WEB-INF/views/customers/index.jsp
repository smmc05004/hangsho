<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<%@ include file="/WEB-INF/views/customers/inc.jsp"%>
	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="home">
			<div class="buy_lst">
				<div class="well">
					<div style="margin-top: 20px" class="btn-group col-sm-3 date-btn"
						role="group" aria-label="...">
						<a href="?search=0" class="btn btn-warning btn-sm ${(param.search eq 0 or param.search eq null) ? 'active' : '' }">전체</a>
						<a href="?search=3" class="btn btn-warning btn-sm ${param.search eq 3 ? 'active' : '' }">3개월</a>
						<a href="?search=6" class="btn btn-warning btn-sm ${param.search eq 6 ? 'active' : '' }">6개월</a>
						 <a	href="?search=12" class="btn btn-warning btn-sm ${param.search eq 12 ? 'active' : '' }">1년</a>
					</div>
						<form action="" class="container">
							<label>특정 날짜로 찾기</label>
							<div class="form-group col-sm-3">
								<label>시작일</label> <input type="date" class="form-control"
									name="beginday" value="${param.beginday }" min="2010-01-01" max="${now }" />
							</div>
							<div class="form-group col-sm-3">
								<label>마지막일</label> <input type="date" class="form-control"
									name="endday" value="${param.endday }" max="${now }"/>
							</div>
							<input type="hidden" value="-1" name="search">
							<button type="submit" class="btn btn-md btn-primary">조회</button>
						</form>
				</div>


				<h2>구매내역</h2>
				<table border="1" class="custom-table2">
					<colgroup>
						<col width="170">
						<col width="500">
						<col width="122">
						<col width="175">
					</colgroup>
					<thead>
						<tr>
							<th scope="colgroup" colspan="2">구매내역</th>
							<th scope="col">유효기간/배송상태</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${not empty orders }">
							<tbody class="well">
								<c:forEach var="order" items="${orders }">

									<tr>
										<th scope="rowgroup" rowspan="2" class="deal_info">
											<div class="date_num">
												<p class="dt">
													<strong><fmt:formatDate
															value="${order.orderDate }" pattern="yyyy.MM.dd" /> </strong>
												</p>
												<i>(<fmt:formatDate value="${order.orderDate }"
														pattern="HH:mm:ss" />)
												</i>
												<p class="buy_num">
													<em class="txt">주문번호</em> <strong>${order.id }</strong>
												</p>
											</div>
											<div class="payment">
												<p>총 주문 금액</p>
												<p class="won">
													<em><fmt:formatNumber pattern=",###">${order.price }</fmt:formatNumber></em><i>원</i>
												</p>
												<p class="coupon">
													<i>티몬캐쉬·적립금 사용</i><em>0</em><em>원</em>
												</p>
											</div>
										</th>

										<th class="well">
											<%
												int oldPId = 0;
											%> <c:set target="<%=oldPId%>" var="pId"
												value="0" /> <c:forEach var="orderDetail"
												items="${order.orderDetails }">
												<c:if test="${pId != orderDetail.item.product.id }">
													<c:set target="<%=oldPId %>" var="pId"
														value="${orderDetail.item.product.id  }" />

													<div class="product-list">
														<div class="thmb_area">
															<a href="/hangshoproducts/detail.do?productId=${orderDetail.item.product.id  }" tl:area="PDCO"
																tl:ord="1" target="blank"><img
																src="${orderDetail.item.product.image.path }"
																width="106" height="71" alt="구매상품 썸네일" class="thmb">
															</a>
															<h4>
																<a href="/hangshoproducts/detail.do?productId=${orderDetail.item.product.id  }" tl:area="PDCO"
																	tl:ord="1" target="blank">${orderDetail.item.product.name }</a>
															</h4>

														</div>
														<p class="add_date_info">&nbsp;</p>
														<p class="add_date_info">
															배송완료일 : <strong>2017.09.20</strong>
														</p>
														<ul class="list-unstyled">

															<%
																int productPriceSum = 0;
															%>
															<c:forEach var="orderDetail"
																items="${order.orderDetails }">
																<c:if test="${orderDetail.item.product.id == pId }">
																	<c:set var="sum" target="<%= productPriceSum %>"
																		value="${sum + orderDetail.realPrice * orderDetail.orderQuantity}"
																		scope="page" />
																	<li>
																		<div class="text-left">
																			<div class="tit">
																				<strong>${orderDetail.item.options }</strong>
																				<p>
																					(구매수량<em>${orderDetail.orderQuantity}</em>개)
																				</p>
																			</div>
																		</div>
																	</li>

																</c:if>
															</c:forEach>
															<p class="pay_info">
																<span class="won"><em><fmt:formatNumber
																			pattern=",###">${sum}</fmt:formatNumber></em>원</span>(${order.condition })
															</p>
															<c:remove var="sum" scope="page" />
														</ul>
													</div>
												</c:if>
											</c:forEach> <c:remove var="pId" scope="page" />
										</th>

										<td class="expiry">
											<p class="delivery_condition">
												<strong>배송완료</strong>
											</p>
										</td>
										<td id="td_1553184610_680182918" class="manage">
											<div class="ly_btn">
												<div class="af_orderwrite">
													<button type="submit" class="btn btn-warning btn-sm">
														<a href="javascript:void(0)">구매후기쓰기</a>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3" class=" delivery"><span title=""
											class="adr">
												<p class="addr">
													<em>배송지 정보 : </em><span>${order.receiver },
														(${order.delivery.postalCode })
														${order.delivery.mainAddress } </span>
												</p>
												<p class="etc">${order.delivery.detailAddress }</p>
										</span></td>
									</tr>

								</c:forEach>
						</c:when>
						<c:otherwise>
							<tbody>
								<tr>
									<td colspan="4" class="none_lst text-center"><strong>구매내역이
											없습니다.</strong><br> <span>오늘의 티몬</span>에서 알찬 구매 어떠세요?
										<p style="margin: 10px;">
											<button type="submit" class="btn btn-default btn-md">
												<a href="/">오늘의 티몬 보러가기</a>
											</button>
										</p></td>
								</tr>
							</tbody>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
<script>
	$(function() {
		$('input[name=beginday]').change(function(){
			$('input[name=endday]').attr('min', $(this).val())
		})
		$('input[name=endday]').change(function(){
			$('input[name=beginday]').attr('max', $(this).val())
		})
	})
</script>
</html>