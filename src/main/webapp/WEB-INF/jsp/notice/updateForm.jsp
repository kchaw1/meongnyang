<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp" />
<c:import url="../admin/adminCommonCSSJS.jsp" />
<c:import url="writeFormCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../common/header.jsp" />
	</div>
	
	<!-- start -->
	<div class="top-section">
            <div class="main-title">
                <h1>공지사항</h1>
            </div>
        </div>
           
            <form action="update.mn" method="POST">
            <div class="bottom-section">
                <div class="section-two">
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                        <div id="title"><input type="text" class="form-control" name="ntcTitle" placeholder="제목을 입력하세요" value='${ntc.ntcTitle}' style="margin-bottom: 10px;"> </div>  <!-- 작성자파라미터 -->
                                        <div id="writer">${user.id}</div>
                                        <input type="hidden" name="ntcWriter" value="${user.id}" />
                                        <input type="hidden" name="ntcNo" value="${ntc.ntcNo}" />
                                </div>
                                <div class="panel-body">
                                        <div id="smnt-area"><textarea name="ntcContent" id="summernote">${ntc.ntcContent}</textarea> </div> <!-- 작성자파라미터 -->
                                        <input id="imageBoard" name="url" type="hidden"/>
                                </div>
                              </div>
                      
                    <div id="button-area">
                            <button type="submit" id="update-button" class="btn btn-default">글 수정</button>
                            &nbsp;&nbsp;
                            <button type="button" id="cancel-button" class="btn btn-default">취소</button>
                    </div>
                    <br>
                    <br>
                </div> 
            </div>
            </form>
	
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../common/footer.jsp" />
	</div>
	<script>
	$(document).ready(function () {
	    $('#summernote').summernote({
	        height: 330,                 // set editor height
	        placeholder: "내용을 입력해주세요",
	        focus: true,                  // set focus to editable area after initializing summernote
	        callbacks: {
	            onImageUpload: function(files, editor, welEditable) {
	              for (var i = files.length - 1; i >= 0; i--) {
	                sendFile(files[i], this);
	              }
	            }
	          } // callbacks
	    });
	});

	function sendFile(file, ele) {
	    var form_data = new FormData();
	    console.log("form_data", form_data)
	    form_data.append('file', file);
	    $.ajax({
	        data : form_data, 
	        type : "POST",
	        url : "<c:url value='/notice/uploadfile.mn'/>",
	        cache : false,
	        contentType : false,
	        enctype : "multipart/form_data",
	        processData : false,
	        success : function(noticeFile) {
	            console.log(noticeFile.url);
	            $(ele).summernote("editor.insertImage", noticeFile.url);
	        }
	    })//ajax
	}
	
	$("#cancel-button").click(function() {
		location.href = "list.mn"
	})
	</script>
</body>
</html>