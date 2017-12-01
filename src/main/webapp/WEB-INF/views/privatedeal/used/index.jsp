<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/used.css">
<script type="text/javascript">
	$(function() {
			
		var $bclistA = $("#bclist li a");
		var bc = "";
		$bclistA.each(function(index, element) {
			if ('${param.bc}' ==  $(element).attr('href').replace("index.do?bc=", "")) {
				bc = $(element).text();
			}
		})
		$("#chooseBC").text(bc);
		
		var $mclistA = $("#mclist li a");
		var mc = "";
		$mclistA.each(function(index, element) {
			if ('${param.mc}' ==  $(element).attr('href').replace("index.do?bc=${param.bc}&mc=", "")) {
				mc = $(element).text();
			}
		});
		$("#chooseMC").text(mc);
		
		var $sclistA = $("#sclist li a");
		var sc = "";
		$sclistA.each(function(index, element) {
			if ('${param.sc}' ==  $(element).attr('href').replace("index.do?bc=${param.bc}&mc=${param.mc}&sc=", "")) {
				sc = $(element).text();
			}
		});
		$("#chooseSC").text(sc);		
		
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<div class="container-fluid">
        <div class="container">
        	<%@ include file="/WEB-INF/views/inc/categoryUsed.jsp" %> 
            <div class="text-center">
                <h2>안전 중고나라</h2>
            </div>
            <hr/>
            <div class="row">
                <div>
                    <ul class="categoryd">
                        <c:choose>
                    		<c:when test="${empty middleCategories }">
                    			<li><a href="index.do">전체</a></li>
	                    		<li><a href="index.do?bc=100">식품</a></li>
	                    		<li><a href="index.do?bc=200">패션</a></li>
	                    		<li><a href="index.do?bc=300">가전</a></li>
                    		</c:when>                    		
                    		<c:when test="${not empty middleCategories and empty smallCategories }">
                    				<li><a href="index.do?bc=${param.bc }">전체</a>
                    			<c:forEach var="middleCategory" items="${middleCategories }">
			                        <li><a href="index.do?bc=${param.bc }&mc=${middleCategory.id}">${middleCategory.name }</a></li>
		                    	</c:forEach>
                    		</c:when>
                    		<c:when test="${not empty smallCategories }">
                    				<li><a href="index.do?bc=${param.bc }&mc=${param.mc}">전체</a>
                    			<c:forEach var="smallCategory" items="${smallCategories }">
			                        <li><a href="index.do?bc=${param.bc }&mc=${param.mc}&sc=${smallCategory.id}">${smallCategory.name }</a></li>
		                    	</c:forEach>
                    		</c:when>
                    	</c:choose>                       
                    </ul>
                </div>                          
            </div>
            <hr/>
        </div>       
        <div class="container-fluid">           
            <div class="container">
                <div class="row">                             
                    <div class="col-sm-8">                        
                        <form action="index.do" class="form-inline" id="search-form">
                            <input type="hidden" name="pageNo" value="${param.pageNo }">
                            <input type="hidden" name="bc" value="${param.bc }">
                            <input type="hidden" name="mc" value="${param.mc }">
                            <input type="hidden" name="sc" value="${param.sc }">
                            <div class="form-group">
                                <select class="form-control" id="division" name="division">
                                    <option value=""> 전체 보기</option>
                                    <option value="S" ${param.division eq 'S' ? 'selected' : ''}> 판매목록만 보기</option>
                                    <option value="B" ${param.division eq 'B' ? 'selected' : ''}> 구매목록만 보기</option>                               
                                </select>
                                <label class="sr-only">검색조건</label>
                                <select class="form-control" name="opt">
                                    <option value="title" ${param.opt eq 'title' ? 'selected' : '' }> 제목</option>
                                    <option value="writer" ${param.opt eq 'writer' ? 'selected' : '' }> 닉네임</option>
                                    <option value="contents" ${param.opt eq 'contents' ? 'selected' : '' }> 내용</option>                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="sr-only">키워드</label>
                                <input type="text" class="form-control" name="keyword" value="${param.keyword }" />
                            </div>
                            <button type="submit" class="btn btn-info" id="btn-search">조회</button>
                        </form>
                    </div>
                    <div class="text-right write_sb">
                        <a href="/usedform.do" class="btn btn-info">글쓰기</a>                    
                    </div>                               
                </div>                
                <table class="table table-condensed privatedeal">
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">                        
                        <col width="10%">                        
                        <col width="10%">                        
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>희망가격</th>
                            <th>상태</th>
                            <th>닉네임</th>
                            <th>등록일</th>
                            <th>조회수</th>                           
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${empty usedlist }">
                    		<tr>
                    			<td colspan="7" class="text-center">검색된 결과가 없습니다.</td>
                    		</tr>
                    	</c:if>
                    	<c:forEach var="used" items="${usedlist}">
                    		<tr>
	                            <td>${used.id }</td>
	                            <td><a href="detail.do?no=${used.id }"><strong class="${used.division.id eq 'S' ? 'text-danger' : 'text-primary' }">[${used.division.name }]</strong> <c:out value="${used.title}" /> </a> <span class="text-warning">${used.commentCnt ne 0 ? [used.commentCnt] : '' }</span></td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${not empty used.desiredprice}">
			                            	<fmt:formatNumber value="${used.desiredprice }" pattern="#,###" />원	                            		
	                            		</c:when>
	                            		<c:otherwise>
	                            			없음
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <c:choose>
	                            	<c:when test="${used.status.id eq 'DP'}">
	                            		<td class="text-success">${used.status.name }</td>
	                            	</c:when>
	                            	<c:when test="${used.status.id eq 'DPI'}">
	                            		<td class="text-primary">${used.status.name }</td>
	                            	</c:when>
	                            	<c:when test="${used.status.id eq 'DI'}">
	                            		<td class="text-warning">${used.status.name }</td>
	                            	</c:when>
	                            	<c:when test="${used.status.id eq 'DC'}">
	                            		<td class="text-danger">${used.status.name }</td>
	                            	</c:when>
	                            </c:choose>	                            
	                            <td><c:out value="${used.customer.nickname }" /></td>
	                            <td><fmt:formatDate value="${used.createdate }" pattern="yyyy-MM-dd"/></td>
	                            <td>${used.clicked }</td>
	                        </tr>
                    	</c:forEach> 
                    </tbody>
                </table>                              
				<%@ include file="/WEB-INF/views/inc/paginations.jsp" %>               
            </div>        
        </div>
    </div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		$('.pagination a').click(function(event) {
			event.preventDefault();
			$(':input[name=pageNo]').val($(this).attr('href'));
			$("#search-form").submit();
		});
		
		$("#btn-search").click(function() {
			$(':input[name=pageNo]').val(1);
		});	
		
		$('#division').change(function() {
			$(':input[name=bc]').val('${param.bc}');
			$(':input[name=mc]').val('${param.mc}');
			$(':input[name=sc]').val('${param.sc}');
			$(':input[name=pageNo]').val(1);
			$('#search-form').submit();
		});
	});
</script>
</html>