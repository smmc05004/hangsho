<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/qna.css">	
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <div class="container">
       <div class="row text-center">
           <h1>고객님의 주문과 결제가</h1>
           <h1>정상적으로 완료되었습니다.</h1>
           <h3 style="margin-top:50px; margin-bottom:20px;">행쇼 쇼핑몰을 이용해주셔서 감사합니다.</h3>
           <a href="/index.do" class="btn btn-warning btn-lg">홈으로</a>
           <a href="/customers/index.do" class="btn btn-warning btn-lg">주문내역</a>
        </div> 
    </div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>