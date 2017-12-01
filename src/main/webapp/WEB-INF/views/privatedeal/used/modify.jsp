<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp" %>
<link rel="stylesheet" href="/resources/css/meronaform.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<script type="text/javascript">
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "editor",
	        sSkinURI: "./resources/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : true,
	        }
	    });
	    //전송버튼
	    $("#insertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#insertBoardFrm").submit();
	    });
	});
</script>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<div class="container-fluid">           
        <div class="container-fluid">           
            <div class="container">
                <h3>안전 중고나라</h3>            
                <form action="/modifyU.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
                	<input type="hidden" name="id" value="${param.no }">                	
                    <table class="table table-condensed meronaform">
                        <tbody>
                            <tr>
                                <th>구분</th>
                                <td>
                                    <select name="division" id="">
                                        <option value="S" ${merona.division.id eq 'S' ? 'selected' : '' }>판매</option>
                                        <option value="B" ${merona.division.id eq 'B' ? 'selected' : '' }>구매</option>
                                    </select>
                                </td>
                                <th>카테고리</th>
                                <td class="category">
                                    <select name="bigcategory">
                                        <option value="">====대분류====</option>                                        
                                        <option value="100" ${merona.smallcategory.midCategory.bigCategory.id eq '100' ? 'selected' : '' }>식품</option>                                                                                
                                        <option value="200" ${merona.smallcategory.midCategory.bigCategory.id eq '200' ? 'selected' : '' }>패션</option>                                                                                
                                        <option value="300" ${merona.smallcategory.midCategory.bigCategory.id eq '300' ? 'selected' : '' }>가전</option>                                                                                
                                    </select>
                                    <select name="middlecategory">                                    	
                                        <option value="">====중분류====</option>
                                        <c:set var="midC" value="${merona.smallcategory.midCategory.id}" />
                                        <c:forEach var="middleCategory" items="${middleCategories }">
                                        	<option value="${middleCategory.id }" ${middleCategory.id eq midC ? 'selected' : '' }>${middleCategory.name }</option>
                                        </c:forEach>                                        
                                    </select>
                                    <select name="smallcategory">
                                        <option value="">====소분류====</option>
                                        <c:set var="smC" value="${merona.smallcategory.id}" />
                                        <c:forEach var="smallCategory" items="${smallCategories }">
                                        	<option value="${smallCategory.id }" ${smallCategory.id eq smC ? 'selected' : '' }>${smallCategory.name }</option>
                                        </c:forEach>                                                                        
                                    </select>
                                </td>
                                <th>희망가격</th>
                                <td class="hopeprice"><input type="number" name="desiredprice" value="${merona.desiredprice }"> 원</td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td colspan="5">
                                    <input type="text" name="title" class="titlei" value="${merona.title }">
                                </td>
                            </tr>
                        </tbody>                        
                    </table>
                    
                    <textarea name="contents" id="editor" style="width: 100%; height: 400px;">${merona.contents }</textarea>             
                          
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-info" id="insertBoard">수정</button>
                        <a href="/used/detail.do?no=${param.no }" class="btn btn-default">취소</a>
                    </div>

                </form>
            </div>      
        </div>
        
    </div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
<script>
	
    $(function() {    	
		
    	$("select[name=bigcategory]").change(function() {
            
            var bigcategory = $("select[name=bigcategory]").val();
            
            $.ajax({
               type:"GET",
               url:"/getmiddle.do",
               data:{bigcategory:bigcategory},
               dataType:"json",
               success:function(midCategories) {
            	  //console.log(midCategories);
            	  
                  var html = "";
                  html += "<option>====중분류====</option>"
                  $.each(midCategories, function(index, midCategory) {
                	  
                     html += "<option value="+midCategory.id+">"+midCategory.name+"</option>";
                  });
                  
                  $("select[name=middlecategory]").html(html);
                  $("select[name=smallcategory]").html("<option>====소분류====</option>");
               }
            });
         });
         
         $("select[name=middlecategory]").change(function() {
        	 
            var middlecategory = $("select[name=middlecategory]").val();
            
            $.ajax ({
               type:"GET",
               url:"/getsmall.do",
               data:{middlecategory: middlecategory},
               dataType:"json",
               success:function(smallCategories) {
                  //console.log(smallCategories);
                  
                  var html = "";
                  html += "<option>====소분류====</option>"                  
                  $.each(smallCategories, function(index, smallCategory) {
                	  
                     html += "<option value="+smallCategory.id+">"+smallCategory.name+"</option>";
                  });
                  
                  $("select[name=smallcategory]").html(html);
               }
            });
         });
        
    })
</script>
</html>