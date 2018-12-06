<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp"/>
<link rel="stylesheet" href="<c:url value="/resources/css/community/detailPage.css"/>">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script src = "https://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

 <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<!-- 부트스트랩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- sweetAlert -->

<script src="<c:url value="/resources/js/common/sweetalert2.all.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/sweetalert2.min.css"/>">


</head>
<style>
body{
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
    }
 header.dogcat{
 
 	margin: 0 auto; 
  font-family: 'Jua', sans-serif;}
.body1{

height: 100%;
margin-top: 105px;
/* padding-right: 270px;
padding-left: 270px; */
}

.coWriter{
	 font-size: 14px;
    font-weight: 400;
    line-height: 16px;
    color: rgb(0, 63, 109);
}
.reply{
	margin-left: 5px;
	display: none;
    float: right;
}
/* .left{
margin-top: 70px;
float: left;
width: 650px;
height: 100%;

} */
/* .right{
    float: left;
width: 320px;
height: 100%;

} */

/*채팅*/
.comments:after { border-color: #fff; }
.comments:before { background-color: #fff; }
.comments .comment {
background: #fff;
border-radius: 10px;
font-size: 11px;
padding: 10px 15px;
}
.comments [class*="level-"] .photo:before { background-color: #fff; }
.comments .meta { color: #ccc; }
.comments .meta a { color: inherit; }
.comments .meta a:hover { color: #34b5d0; }
.comments .body { color: #888; }

/**
* Comments Thread
*/
.comments {
list-style-type: none;
padding: 5px 0 0 46px;
position: relative;
margin: 0 0 0 12px;
}
.comments:before,
.comments .comment,
.comments .comment:after,
.comments .comment:before,
.comments .photo img,
.comments [class*="level-"] .photo:before {
box-shadow: 0 1px 3px rgba(0,0,0,.4);
}
.comments:after,
.comments:before {
display: block;
content: '';
position: absolute;
}
.comments:before {
border-radius: 0 0 5px 5px;
height: 100%;
width: 8px;
left: 0;
top: 0;
}
.comments:after {
box-shadow: 0 1px 3px rgba(0,0,0,.4), 0 1px 3px rgba(0,0,0,.4) inset;
border-width: 4px;
border-style: solid;
border-radius: 18px;
height: 10px;
width: 10px;
left: -5px;
top: -16px;
z-index: -1;
}
.comments .comment {
margin-bottom: 10px;
position: relative;
}
.comments .comment:after,
.comments .comment:before {
border-radius: 10px;
background-color: #fff;
position: absolute;
display: block;
content: '';
}
.comments .comment:after {
width: 12px;
height: 12px;
left: -14px;
top: 7px;
}
.comments .comment:before {
width: 5px;
height: 5px;
left: -22px;
top: 16px;
}
.comments .photo {
position: absolute;
left: -60px;
top: 2px;
}
.comments .photo img {
border: 1px solid #fff;
border-radius: 32px;
overflow : hidden;
}
.comments .meta { margin-bottom: 5px; }
.comments .meta .reply { display: none; float: right; }
.comments .comment:hover .reply { display: block; }
.comments [class*="level-"] .photo:before {
display: block;
content: '';
position: absolute;
margin-top: -2px;
height: 4px;
width: 20px;
left: -10px;
top: 50%;
z-index: -1;
}
.comments .level-2 { margin-left: 30px; }
.comments .level-3 { margin-left: 50px; }
.comments .level-4 { margin-left: 70px; }
.comments .level-5 { margin-left: 90px; }
.comments .level-6 { margin-left: 110px; }
.comments .level-3 .photo:before { width: 40px; left: -30px;}
.comments .level-4 .photo:before { width: 60px; left: -50px;}
.comments .level-5 .photo:before { width: 80px; left: -70px;}
.comments .level-6 .photo:before { width: 100px; left: -90px;}

.reTextArea{
  width: 590px;
  height: 40px;
}
.reBtn{
  float: right;
  width: 40px;
    font-size: 16px;
    border: none;
    color: white;
    border-radius: 5px;
    background-color: rgb(65, 192, 142, 0.7);
    height: 42px;
    font-family: Do Hyeon;
    letter-spacing: 3px;
}
.displayNone{
  display: none;
}
.cancelReply{
  right: 0;
}
.editTextArea{
  margin: 0px; width: 621px; height: 41px;
}
.editBtn{
  display: none;
    float: right;
    color: gray;
}
.viewCnt{
margin-top: 20px;
  float: right;
  font-size: 14px;

}
</style>
<body>
  <c:import url = "../common/header.jsp"/>


    <div class = "body1">
        <div class = "body2">
            <div class = "left">
                    <p style = "font-family: 'Jua'">${communityBoard.comTitle}<span class = "viewCnt">조회수 : ${comViewCnt}</span></p>
                    <div class= "justforHr1"></div>
                    <br>
                   <div class = "category"><i class="fas fa-user-circle"> ${communityBoard.comWriter}<span class="regDate"> ·<fmt:formatDate value="${communityBoard.comRegDate}" pattern="yyyy-MM-dd HH:mm"/></span></i></div>
                    <br>
                    <div class= "writeContainer">
                        <div class = "writeMargin">
                          ${communityBoard.comContent}
                        </div>
                    </div>
                    
                     <!-- 댓글 -->
                     <div class = "commentHr">
                         <div class ="commentmargin">
         <form id = "insertComment" method = "POST">
                            <div class = "coWriter">${user.id}</div>
                            <input type="hidden" name="comcWriter" value="${user.id}" />
                            <input type="hidden" name="comNo" value="${communityBoard.comNo}"/>
                            <textarea class = "commentForm" name = "comcContent" ></textarea>
         </form>
                            <button class = "commentBtn">등록</button>
                            <div class = "brbr"></div>
                        </div>
                     </div>

                     <div class ="commnetsHr"></div>
                   <br>
                   <br>
                   
                   <div class = "commentList">
                        <div class ="commentWriter"></div>
                        <ul class="comments" id = "comments">
                               <!-- 이곳에 댓글이 들어감 -->
                        </ul>
                   </div>
                   

            </div>
            <div class = "right">
                    <div class = "main-column2">
                            <div class = "ruleContainer">
                                <div class = "beforeWrite">게시판 규칙</div>
                                <div class = "spanwrite">게시글 개당 활동점수 +1</div>
                                <div class = "spanwrite">댓글 개당 활동점수 +1</div>
                                <div class = "spanwrite">악의적인 댓글 지양해주세요</div>
                                <div class = "spanwrite">상담게시판은 일정레벨이상 댓글작성 가능합니다.</div>
                                <div class = "spanwrite">중복된 글을 지양해주세요</div>
                                <div class = "spanwrite">양심체크 하셨나요?</div>
                                <div class = "spanwrite spanwrite1">딱봤을때 하면 안될거같죠? 하지마세요</div>
        
                                
                            </div>
                            <div class = "main-column3">
                                    <div class = "imgsize2"></div>
                                    <div class = "goWrite">작성자세요?</div>
                                
                                    <button class= "writeBtn btnEdit" id = "${communityBoard.comNo}">글 수정하기</button>
                                    <button class= "writeBtn btnDelete" id = "${communityBoard.comNo}">글 삭제하기</button>
                                </div>
                            
                        </div>
                
            </div>
        </div>
    </div>


    <footer class="dogcat">
            <div class="footertitle">
              <h4 class="dogcat">Copyright ⓒ<span>낭만코양이</span> All rights reserved.</h4>
              <h4 class="dogcat">with AR, CW, HK, SY, BG</h4>
            </div>
          </footer>
                
    <footer>
            <div class="chat-launcher"></div>
            <div class="chat-wrapper" data-headline="Chat">
            </div>
    </footer>
<script>
//댓글 등록
$(document).on("click",".commentBtn", function(e){
	$.ajax({
		url : "<c:url value = '/community/insertComment.mn'/>",
		type : "POST",
		data : $("#insertComment").serialize()
	}).done(function(result){

	});
});


$(document).on("click",".commentBtn", function(e){
	commentConunt();
	commentList();
});
//댓글 갯수 함수
function commentConunt(){
	
	$.ajax({
		url : "<c:url value = '/community/selectCommentCount.mn'/>",
		type :"POST",
		data : "comNo=${communityBoard.comNo}"
	}).done(function(count){
		
	$(".commnetsHr").html('Comments'+'&nbsp'+count);
		
		
	});
};

// 댓글 조회함수
function commentList(){
	$.ajax({
		url : "<c:url value = '/community/selectComment.mn'/>",
		type : "POST",
		data : "comNo=${communityBoard.comNo}"
		
	}).done(function(result){
		console.log(result);
		
		var text = "";
		
		for(let i = 0; i < result.length; i++){
			text += "<li class='comment "
					+result[i].comcNo
					+"'>"
					+"<a href='#' title='View this user profile' class='photo'><img src='<c:url value = '/resources/img/community/userImg.jpg'/>' width='32' alt='Kasper'></a>"
					+"<div class='meta'>"
					+result[i].comcWriter+"&nbsp|&nbsp"+result[i].comcRegDate
					+"<a class='reply' onclick='replyComment("
					+result[i].comcNo
					+")'>Reply</a>"
					
			if("${user.id}" == result[i].comcWriter){
				
			text +=	"<a class='reply' id = 'deleteComment' name = '"
					+result[i].comcNo
					+"'>Delete</a>"
					+"<a class='reply "
					+result[i].comcNo
					+"' id = 'editComment' onclick = 'editFunction("
					+result[i].comcNo
					+")'>Edit</a>"
													}
			text+="</div><div class='body'>"
					+result[i].comcContent
					+"</div></li>"
					+"<li class='comment editForm displayNone "
					+result[i].comcNo
					+"' id = 'forC"
					+result[i].comcNo
					+"'><form class = 'updateComment "
					+result[i].comcNo
					+"' method = 'POST'>"
					+"<a href=''#' title='View this user profile' class='photo'><img src='<c:url value = '/resources/img/community/userImg.jpg'/>' width='32' alt='Photo'></a>"
					+" <div><textarea name = 'comcContent' class = 'editTextArea "
					+result[i].comcNo
					+"'></textarea><input type='hidden' name='comcNo' value = '"
					+result[i].comcNo
					+"'/><button onclick = 'editBtn("
					+result[i].comcNo
					+")'class = 'reBtn'>등록</button></div>"
					+"<a class='cancelEdit' onclick = 'editCancel("
					+result[i].comcNo
					+")'>수정취소</a></form>"
					+"</li><li class='comment level-2 displayNone' id = 'replyForm"
					+result[i].comcNo
					+"'>"
                    +"<form class = 'replyCommentForm"
                    +result[i].comcNo
                    +"' method = 'POST'><a href='#' title='View this user profile' class='photo'><img src='<c:url value = '/resources/img/community/userImg.jpg'/>' width='32' alt='Photo'></a>"
                    +"<div><textarea class = 'reTextArea' name = 'comcContent'></textarea><button class = 'reBtn'  onclick= replyFunction("
                    +result[i].comcNo
                    +")>등록</button>"
                    +"<input type='hidden' name='comcWriter' value='${user.id}' />"
                    +"<input type='hidden' name='comNo' value='"+result[i].comNo+"'/>"
                    +"</div>"
                    +"<a class='cancelReply' onclick= 'cancelReply("
                    +result[i].comcNo
                    +")'>답글취소</a>"
                  	+"</li></form>"

                  	
		}
		$("#comments").html(text);

		});

};
commentList();
commentConunt();
//---------------------------------------------------------------------댓글 삭제파트!--------------------------------------------------------------
//댓글 삭제
 $(document).on("click","#deleteComment", function(e){
	 var comcNo = $(this).attr("name");
	 
	$.ajax({
		url : "<c:url value = '/community/deleteComment.mn'/>",
		type : "POST",
		data : "comcNo="+ comcNo
		}).done(function(result){
			
			commentList();
		})
});
//---------------------------------------------------------------------댓글 수정파트!--------------------------------------------------------------
//댓글 수정
function editBtn(comment_no){
	
	$.ajax({
		url : "<c:url value = '/community/updateComment.mn'/>",
		type : "POST",
		data : $(".updateComment."+comment_no).serialize()
	}).done(function(result){
		commentList();
	});
}

//댓굴 수정시form형태로 변환하는  function
function editFunction(comment_no){
			
	var text = $(".reply."+comment_no).parent().siblings(".body").text();

	$(".comment."+comment_no).addClass("displayNone");
	//이놈이 문제야 이놈이!!!!!!!!!!!!!!!!!!
	/* console.log($(".editForm.displayNone."+comment_no).removeClass("displayNone "+comment_no)); */
	$(".editForm.displayNone."+comment_no).removeClass("displayNone "+comment_no);
    $(".editTextArea."+comment_no).html(text);
			
		/* 	var text = $(this).parent().siblings(".body").text();
	        $(this).parent().parent().addClass("displayNone");
	        $(this).parent().parent().siblings("#editForm").removeClass("displayNone");
	        $(".editTextArea").html(text); */
		}
//댓글 수정 취소시 형태 바꾸기.
function editCancel(comment_no){
	
	$(".comment."+comment_no).removeClass("displayNone");
	$("#forC"+comment_no).addClass("displayNone "+comment_no);
/* 	$(".editForm.displayNone."+comment_no).addClass("displayNone "+comment_no); */
}
//---------------------------------------------------------------------대댓글 파트!--------------------------------------------------------------
//대댓글 등록

 function replyFunction(comment_no){
	$.ajax({
		url : "<c:url value = '/community/insertComment.mn'/>",
		type : "POST",
		data : $(".replyCommentForm"+comment_no).serialize()
	}).done(function(result){
		
		commentList();
	});
}


//대댓글 reply 클릭시 폼형태 띄우기
function replyComment(comment_no){
	//reply를 누르면 .comment level-2 form이 뜬다.(displayNone클래스가 지워져야함)
	$("#replyForm"+comment_no).removeClass("displayNone");

	
}
//대댓글 reply 폼형태 나와있는 상태에서 답글 취소를 누르면 사라지게 하기.
function cancelReply(comment_no){
	$("#replyForm"+comment_no).addClass("displayNone");
}



//-------------------------------------------------------------게시글 삭제와 글수정 파트!--------------------------------------------------------------
//클릭시 글 삭제
$("button.btnDelete").click(function() {
	var no = $(this).attr('id');
	if('${communityBoard.comWriter}'!='${user.id}'){
		swal({
			  type: 'error',
			  title: '삡..작성자만 수정 가능해요..',
			  showConfirmButton: false,
			  timer: 1500
		})
		return;	
	}else{
		swal({
			  type: 'success',
			  title: '삭제 완료!',
			  showConfirmButton: false,
			  timer: 2000
			  })
	setTimeout(function() {
							location.href = "delete.mn?comNo="+no;
							}, 1000);
			  /* location.href = "delete.mn?comNo="+no; */
	}
	
	
});
//클릭시 글 수정
$("button.btnEdit").click(function() {
	var no = $(this).attr('id');
	if('${communityBoard.comWriter}'!='${user.id}'){
		swal({
			  type: 'error',
			  title: '삡..작성자만 삭제 가능해요..',
			  showConfirmButton: false,
			  timer: 1500
		})
		return;	
	}
	
	
	location.href = "editWriteForm.mn?comNo="+no;
});
</script>
    
</body>
</html>