<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/community/communityGa.css"/>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 배민폰트 -->

<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">


<%-- <link rel="stylesheet" href="<c:url value="/resources/css/community/communityGa.css"/>"> --%>
<!-- 부트스트랩 -->



<c:import url="../common/headerfooterCSSJS.jsp" />

</head>
<style>


   

</style>
<body>
<c:import url = "../common/header.jsp"/>
<script src="<c:url value="/resources/js/common/chat.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/chat.css"/>">
<c:import url = "../common/chat.jsp"/>
<!-- 여기서부터 컨텐츠 시작  -->

					<!-- <div class = "searchForm">
							<form method = "POST" id = "forWriter" class="search-wrapper cf">
							        <input type="text" placeholder="작성자로 검색" name = "comWriter" >
							        <button type="submit" class = "submitBtn"><i class="fas fa-search"></i></button>
							</form>
					</div> -->
					
					<div class = "searchForm">
							<form id = "forWriter" class="search-wrapper cf" method = "POST">
							        <input type="text" placeholder="작성자로 검색" name = "comWriter" class = "comWriter"/>
							        <button class = "submitBtn"><i class="fas fa-search"></i></button>
							</form>
					</div>

<div class = "allContainer">
              <!--컨텐츠 여기서부터 forEach-->
                <c:forEach var = "b" items = "${gallery}">
            <div class = "galleryContentContainer" onclick = "detailFunction(${b.comNo})">
                <div class = "galleryImg"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                   <div class = "imgContainer">${b.comContent}</div>
                </div>
                <div class = "viewContainer">
               		 <div class="coracao"></div><div class = "heartCnt">6</div>

                </div>
            </div>
            </c:forEach>

           
                   
            
            
          </div><!-- 모든 컨텐츠들 담는 곳!-->




          <!--모달 부분-->
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <!--사진 들어가는부분-->
                <div class="modal-body">
                    <div class = "galleryDetailContainer">
                        <div class = "forImgList">
             					<!-- 이곳에 컨텐츠 -->
                        </div>
                        <div class = "forHr">
                            <div class = "galleryDetailBox">
                                <div class = "userName">qudrhks258님의 <span>1</span>번째 게시물</div>
                                <div class="heart" onclick = 'refFunction(0,"${user.id}")'></div>
                                
                            </div> 
                        </div>
                        <div class = "forComment">
                            <div class = "forComment2">
                                <div class = "forComment3">
                                         
                                         <!-- 이곳에 댓글 -->
                                </div> 
                            </div>
                            <div class = "commentWriteForm">
                                    <form id = "formTag" method = "POST">
                                        <textarea name = "comcContent" class= "inputTypeTextArea"></textarea><button class ="enterBtn" onclick = "insertComment()">등록</button>
                                        <input type="hidden" name="comcWriter" value="${user.id}" />
                            			
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
		</div>


 <!-- 낭만 코양이 푸터 -->
 
 <script>
 $(function(){
		//모든 content 클래스를 갖고있는 친구들 갖고오기
		var contentList = document.querySelectorAll(".imgContainer");
				console.log(contentList);
		//content에 하나하나 넣어주기
		for(let content of contentList){
			
			
			$content = $(content);
			console.log($content);
			var length;
			length = $content.find("img").length;
			
			var imgTag = $content.find("img");
			if($content.find("img").length >= 2){
				console.log("사진 갯수가 2개 이상이여 들어왔습니다.");
				console.log(imgTag);
				for(var i = 1; i <= length-1; i++){
					imgTag[i].remove();
				}
				
				$content.find("img").addClass("manyPic");
			}
			if($content.html().indexOf("img") != -1){
				$content.find("img").addClass("forImg3");
			}
		}
	

			
	});

 
 $(".submitBtn").click(function(){
	var comWriter=$(".comWriter").val();
	 
	$.ajax({
		 url : "<c:url value = '/community/communityGaToWriter.mn'/>",
		 type : "POST" ,
		 data :{comWriter : comWriter}
		 
	 }).done(function(result){
		 console.log(result);
		 var text = "";
		 for(let i = 0; i < result.list.length; i++){
		 text += "<div class = 'galleryContentContainer' onclick = 'detailFunction("+result.list[i].comNo+")'>"
        	  +"<div class = 'galleryImg'  class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo'>"
       	 	 +"<div class = 'imgContainer'>"+result.list[i].comContent+"</div>"
    		  +"</div>"
    		  +" <div class = 'viewContainer'>"
    		  +" <div class='coracao'></div><div class = 'heartCnt'>6</div>"
    		  +"</div></div>"
    		  
		 }
		 $(".allContainer").html(text);

		 
	 });
	
	 
 })

 
 
 
 //추천
 
 
 function refFunction(comNo, comRefUser){

	comNo = $("#forcomNo").attr("class");
	

	$.ajax({
		url : "<c:url value = '/community/checkRef.mn'/>",
		tpye : "POST",
		data : {comNo : comNo, comRefUser : comRefUser }
	}).done(function(result){
		console.log(result);
		if(result==0){
			$(".heart."+comNo).addClass("is-active");
			  $.ajax({
				  url : "<c:url value = '/community/insertRefCnt.mn'/>",
				  type : "POST", 
				  data : {comNo : comNo, comRefUser : comRefUser }
			  }).done(function(result){
				  console.log("추천 완료");
				  
					  $.ajax({
						  url : "<c:url value = '/community/selectRefCnt.mn'/>",
						  type : "POST", 
						  data : {comNo : comNo}
						  }).done(function(result){
							  console.log(result+"개의 추천의 갯수가 달렸습니다.");
							 /*  $("div.heart."+comNo).removeAttr("title"); */
							  $("div.heart."+comNo).attr("title", result+"개의 좋아요");
							  
						  });
						  
					//여기까지가 실시간으로 추천갯수 보여지는 ajax
			  }) 
			 
		}else{
			$(".heart."+comNo).removeClass("is-active");
			  $.ajax({
				  url : "<c:url value = '/community/deleteRefCnt.mn'/>",
				  type : "POST", 
				  data : {comNo : comNo, comRefUser : comRefUser }
			  }).done(function(result){
				  console.log("추천 취소 완료");
				  
				  $.ajax({
					  url : "<c:url value = '/community/selectRefCnt.mn'/>",
					  type : "POST", 
					  data : {comNo : comNo}
					  }).done(function(result){
						  console.log(result+"개의 추천의 갯수가 달렸습니다.");
						 /*  $("div.heart."+comNo).removeAttr("title"); */
						  $("div.heart."+comNo).attr("title", result+"개의 좋아요");
						  
					  });
					  
				//여기까지가 실시간으로 추천갯수 보여지는 ajax
			  }) 
			
		}
	});
	
	  
}
 
 //게시판 조회
 function detailFunction(comNo){
	 
	 
	 $.ajax({
		 url : "<c:url value = '/community/detailPage2.mn'/>",
		 type : "POST",
		 data : {comNo:comNo}
		 
	 }).done(function(comBoard){
		 console.log(comBoard.comContent);
		 $(".forImgList").html(comBoard.comContent);
		 var text = "";
		 text = "<input type='hidden' id = 'forcomNo' class = '"+comBoard.comNo+"' name='comNo' value='"+comBoard.comNo+"'/>"
		 $("#formTag").append(text);
/* 		 var forRefText = "";
		 forRefText = "<div class='heart' onclick = 'refFunction("+comBoard.comNo+",${user.id})'></div>"
		 $(".galleryDetailBox2").html(forRefText); */
		 
		 
	 });
	
	 commentList(comNo);
	 

 }
 
 
 
 //갤러리 댓글 조회
  function commentList(comNo){
	 $.ajax({
			url : "<c:url value = '/community/selectComment.mn'/>",
			type : "POST",
			data : {comNo:comNo}
			
		}).done(function(result){
		
			var text = "";
			for(let i = 0; i < result.length; i++){
				
				text +="<div>"
	            	 +"<div class = 'userName2'>"+result[i].comcWriter+"<span class = 'forPoint'>·</span></div>"
	            	 +"<div class = 'commentList'>"+result[i].comcContent+"</div>"
	            	/*  +"<div class = 'commentRegDate'>"+result[i].comcRegDate+"</div>" */
	            	 +"</div>"
			}
 			$(".forComment3").html(text);
		});
 }
 
 //댓글 등록
 
 function insertComment(){
	
	 $.ajax({
			url : "<c:url value = '/community/insertComment.mn'/>",
			type : "POST",
			data : $("#formTag").serialize()
		}).done(function(result){
			 var comNo = $("#forcomNo").attr("class");
			commentList(comNo);
		});
	 
 }


 



 

 
 
 
$(function() {
     $(".heart").on("click", function() {
     $(this).toggleClass("is-active");
  });
});

$('.form-control').on('keyup', function() {

if($(this).val().length > 34) {
 add

alert("글자수는 34자로 이내로 제한됩니다.");

 $(this).val($(this).val().substring(0, 34));

}

});


 
 </script>
               
</body>
</html>