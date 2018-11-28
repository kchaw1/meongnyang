<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="<c:url value="/resources/js/member/login.js" />"></script>
<script>
$("button#loginform").click(function(){
	var f = document.login;
	//alert(f.loginid.value)
	//alert(f.loginpass.value)
	$.ajax({
		url : "<c:url value='/member/loginform.mn'/>",
		data : {
				"id" : f.loginid.value,
				"pass" : f.loginpass.value
				},
		type : "POST"
	}).done(function(result){
		if(result == false) {
			swal({
			  type: 'error',
			  title: '아이디와 비밀번호를 다시 입력해주세요.',
			  timer : 3000
			}) //sweetalert
			setTimeout(function() {
				f.loginpass.value = "";
				f.loginid.focus();
				f.loginid.select();
			}, 1500)
		} else {
			/* location.href = "<c:url value='/main.mn'/>" */
			location.href = "<c:url value='/diary/writeform.mn'/>"
		}
	}) //done
})
</script>
<script>
	$(document).on('click', '.browse', function() {
		var file = $(this).parent().parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change', '.file', function() {
		$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
		var formData = new FormData();
		  console.dir($("input[name=userProfile]")[0].files[0]); 
		 formData.append("file", $("input[name=userProfile]")[0].files[0]);
		 
		 var reader = new FileReader();
		 reader.onload = function () {
			 $(".browse").attr("src", reader.result);
			 $.ajax({
				 url : false,
				 type : "POST",
				 processData: false,
				 contentType: false,
				 data : formData
			 }).done(function (data) {
				 
			 });
		 }
		 reader.readAsDataURL($("input[name=userProfile]")[0].files[0]);
	}) 
	/* $("#profile").click(function() {
		$("#file").click();
	});
	
	$("#file").on('change', function() {
		alert("파일이 첨부되었습니다.");
		var formData = new FormData();
		console.dir($("input[name=file]")[0].files[0]);
		formData.append("file", $("input[name=file]").[0].files[0]);
		
		var reader = new FileReader();
		reader.onload = function () {
			$("#profile").attr("src", reader.result);
			$.ajax({
				url : false,
				type : "POST",
				processData: false,
				contentType: false,
				data : formData
			}).done(function (data){
				
			});
		}
		reader.readAsDataURL($("input[name=file]").[0].files[0]);
	}) */
</script>
<script>
$(document).ready( function() {
    
    $("input[type=file]").change(function () {
         
        var fileListView = "";
         
        var formData = new FormData(); //ajax로 넘길 data
         
        var fileInput = document.getElementById("test_file"); //id로 파일 태그를 호출
         
        var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
         
        for (var i = 0; i < files.length; i++) {
            formData.append('file-'+i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
        }
         
        $.ajax({
            url: "/test/fileSave",
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                 
                if(data.code == "OK"){ //응답결과
                     
                    fileInfoList = data.fileInfoList; //응답 결과 데이터 fileInfoList
                    $.each(fileInfoList, function( index, fileInfo ) {
                         
                        console.log("Path: "+fileInfo.fileFullPath); //전체경로
                        console.log("FileName: "+fileInfo.originalFilename); //파일명
                                                 
                        fileListView += "<p>"+fileInfo.originalFilename+"</p>"; //루프를 돌려서 화면에 보여줄 리스트 작성
                         
                    });
                     
                    $("#file_view_list").html(fileListView); //리스트를 화면에 보여줌
                     
                }else{
                    alert("파일 등록에 실패하였습니다.");
                }
                 
            },
            error: function(xhr,textStatus,error){
                                     
                console.log("textStatus: "+xhr.status+", error: "+error);
                alert("예상치 못한 오류가 발생했습니다.");
                 
            }
        });

         
    });
     
});
</script>
</script>