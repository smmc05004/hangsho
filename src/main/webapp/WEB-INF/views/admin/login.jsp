<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<html>
<title>행쇼-회원관리</title>
<%@ include file="/WEB-INF/views/admin/common.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/nav.jsp"%>
		<div id="body-container-body">
			<div class="container">
				<div class="col-sm-offset-2 col-sm-6">
				<form action="logincheck.do">
					<div class="form-group" style="margin-top: 300px">
						<label>관리자 확인</label> <input type="text" name="code"
							maxlength="64" class="form-control">
					</div>
					<div class="text-right">
						<button type="button" class='btn btn-default' id="send-code">코드발송</button>
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>
		</div>
		
	</div>

</body>
<script type="text/javascript">
	$(function() {
		$('#send-code').click(function() {
			$.ajax({
				url : "send-code.do",
				type : "GET",
				dataType : "json",
				success : function(r) {
					console.log(r);
					if (r) {
						alert('로그인 코드가 메일로 발송되었습니다.');
					} else {
						alert('로그인 코드가 발송되지 않았습니다.');
					}
				}
			});
		});
	})
</script>
</html>