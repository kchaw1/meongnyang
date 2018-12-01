<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="writeFormCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<!-- start -->
	  <div class="top-section">
            <div class="main-title">
                <h1>공지사항</h1>
            </div>
        </div>
           
            </div>
            <form action="write.mn" method="POST">
            <div class="bottom-section">
                <div class="section-two">
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                        <div id="title"><input type="text" class="form-control" name="ntcTitle" placeholder="제목을 입력하세요" style="margin-bottom: 10px;"> </div>  <!-- 작성자파라미터 -->
                                        <div id="writer">${user.id}</div>
                                        <input type="hidden" name="ntcWriter" value="${user.id}" />
                                </div>
                                <div class="panel-body">
                                        <div id="smnt-area"><textarea name="ntcContent" id="summernote"></textarea> </div> <!-- 작성자파라미터 -->
                                        <input id="imageBoard" name="url" type="hidden"/>
                                </div>
                              </div>
                      
                    <div id="button-area">
                            <button type="submit" id="write-button" class="btn btn-default">글 작성</button>
                            &nbsp;&nbsp;
                            <button type="button" id="cancel-button" class="btn btn-default">취소</button>
                    </div>
                    <br>
                    <br>
                </div> 
            </div>
            </form>
          <!-- end  -->

         
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
	$("cancel-button").click(function() {
		location.href = "list.mn"
	})
	</script>
</body>
</html>