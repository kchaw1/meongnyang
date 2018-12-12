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
<link rel="stylesheet" href="<c:url value="/resources/css/community/communityMain.css"/>">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 

</head>

<style>
body{
background-color: #fdfdfd;
font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
 header.dogcat{
 margin: 0 auto; 
  font-family: 'Jua', sans-serif;
  }
.category{
	text-align:right;
    float: right;
    font-size: 16px;
    color: gray;
    font-family: 'Jua';
    font-weight: 100;
    margin-top: -38px;
    margin-right:7px;
	
}
.profileAndName{
   
    padding-bottom: 10px;
    margin-top: 145px;
    right: 0;
    top: 0;
    margin-right: 300px;
    position: absolute;
    position: fixed;
    width: 310px;
    height: 60px;
    
}
/*더보기 css*/
.showMore{
float: left;
width: 650px;
height: 100%;
padding-left: 34.2%;

}
.showMore2{
float: left;
width: 650px;
height: 100%;
padding-left: 34.2%;


}
#bubbly-button {
font-size: 16px;
      font-family: Do Hyeon;
  text-align: center;
    background-color: rgb(65, 192, 142, 0.7);
  display: inline-block;
  padding: 0.1em 2em;
  margin-top: 30px;
  margin-bottom: 30px;
  -webkit-appearance: none;
  appearance: none;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px  rgb(65, 192, 142, 0.7);
  font-weight: 500;
}
#bubbly-button:focus {
  outline: 0;
}
#bubbly-button:before, .bubbly-button:after {
  position: absolute;
  content: '';
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
#bubbly-button:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 20%, #ff0081 20%, transparent 30%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
#bubbly-button:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
#bubbly-button:active {
  transform: scale(0.9);
  background-color: rgb(65, 192, 142, 0.7);
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}
#bubbly-button.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
#bubbly-button.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}
.displayNone{
display: none;
}
.heart {
float:left;
  width: 100px;
  height: 100px;
  background: url("https://cssanimation.rocks/images/posts/steps/heart.png") no-repeat;
  background-position: 0 0;
  cursor: pointer;
  transition: background-position 1s steps(28);
  transition-duration: 0s;
   	margin-top: -40px;
    margin-left: -39px;
}
.heart.is-active {
  transition-duration: 1s;
  background-position: -2800px 0;
}
/* 채팅 */
.chat-launcher {
position: fixed;
bottom: 20px;
right: 20px;
width: 60px;
height: 60px;
z-index: 9999;
background: orange;
color: white;
border-radius: 50%;
cursor: pointer;
box-shadow: 0 1px 6px rgba(0, 0, 0, 0.06), 0 2px 32px rgba(0, 0, 0, 0.16);
}
.chat-launcher:before, .chat-launcher:after {
font-family: FontAwesome;
font-size: 34px;
position: absolute;
-webkit-transition: transform 180ms linear, opacity 130ms linear;
transition: transform 180ms linear, opacity 130ms linear;
}
.chat-launcher:before {
content: "\f086";

margin: 6px 0px 0px 13px;
opacity: 1;
-webkit-transform: rotate(0deg) scale(1);
transform: rotate(0deg) scale(1);
}

/*챠팅  */
.chat-launcher:after {
content: "\f00d";
padding-top: 20px;
margin: 13px 17px;
opacity: 0;
-webkit-transform: rotate(-30deg);
transform: rotate(-30deg);
}
.chat-launcher:hover {
background: #ffb329;
}
.chat-launcher.active:before {
opacity: 0;
-webkit-transform: rotate(70deg) scale(0);
transform: rotate(70deg) scale(0);
}
.chat-launcher.active:after {
opacity: 1;
-webkit-transform: rotate(0deg);
transform: rotate(0deg);
}

.top1{
    border-bottom: 1px solid #efefef;
    BACKGROUND-COLOR: WHITE;
    top: 0;
	
}
.top{
height :0px;
}
.forImg3{
width : 100% !important;
heigth : 100%;

}
.manyPic{
background-img : <c:url value = "/resources/img/community/userImg.jpg"/>;
background-size : 15px;
}



</style>
<body>
	<c:import url = "../common/header.jsp"/>

              <div class = "mainContainer">
 
					<!-- 이곳에 게시글들이 들어갑니다. -->
                  <!----------------------------------------------------------------------->
              </div><!--EndmainContainer-->
						

              <div class = "profileAndName">
                  <!-- 우측 상단 프로필 사진 -->
                  <img src="<c:url value = "/resources/img/community/userImg.jpg"/>" class = "imgSize">
                  <!-- 우측 상단 유저이름 -->
                  <span class = "userName">byoung_gwan_98</span>
                </div>
                <!-- 글작성 버튼이 들어갑니다. -->
                <div class = "writeForm">
                    <p class = "decoration"></p>
                    <div class = "containSizeControl">
                    <p class = "decoration2">커뮤니티</p>
                    <p class = "decoration3">여러분들의 일상을 공유해보세요!</p>
                    <button class = "writeBtn">글 작성하기</button>
                    </div>
                </div>
                 <!-- 아무거나 넣어주세요 -->
                <div class = "putSomething">
                        <h1 class = "decoration2">카테고리</h1>
                    <div class="select">

                        <select name="searchType" id="slct" onchange = "nextList(1, this.value)">
                        			<option class = "all"  id = "1" value="all" >전체보기</option>
									<option class = "free" id = "2" value="자유게시판" >자유게시판</option>
									<option class = "tip"  id = "3" value="꿀팁" >꿀팁</option>
									<option class = "pic"  id = "4" value="갤러리" >갤러리</option>
									<option class = "qna"  id = "5" value="QnA" >QnA</option>
                               		
                         </select>
                    </div>
        
                </div>
                <!-- 낭만 코양이 푸터 -->
                <div class = "mnFooter">
                    <div>Copyright ⓒ 낭만코양이 All rights reserved.<br>
                           with AR, CW, HK, SY, BG
                    </div>
                    <div class = "showMore">
		                    <button class="forAll" id = "bubbly-button" onclick = "forAllBtn()">더보기</button>
		                 
                   </div>
        			
                </div>
                

              <footer>
	            <div class="chat-launcher"></div>
	            
    		  </footer>
	
<script>
//---------------------------------------------------------------------------------------------------------------
// 처음 커뮤니티 페이지 뜰때에는 1Page이며 ajax를 이용하여 뿌려준다.
 $(document).ready(function(){

	nextList(1);

}); 



//전체보기를 위한 페이지 번호
var pageNo = 1;
var beforeComCategory;
var clickPlus = false;
var user;

function forAllBtn(){
	//전체보기를 위한 버튼
	console.log("전체보기를 위한 버튼");
	++pageNo;
	clickPlus = true;
	nextList(pageNo);
}



//전체보기를 위한 페이지
 var nextList = function(pageNoS, comCategory){
	 user = "${user.id}"
	 console.log("현재"+user+"님이 접속해 있습니다.");
	//param은 페이지 번호를 가지고 있다.
	var param = "pageNo="+pageNoS+"&user="+user;
	if (comCategory) { 
	//만약 카테고리가 전체보기가 아닐때 param에 카테고리또한 넣어준뒤 페이지 번호를 1로 변환시킨다.
		if (comCategory != "all") param += "&comCategory=" + comCategory;
		pageNo = 1;
	}//end first if
	
	if (clickPlus) {
		//선택된 카테고리의 값이 전체보기가 아니라면 선택된 카테고리값을 넣어준다. 
		if ($("#slct").val() != "all") param += "&comCategory=" + $("#slct").val();
	}//end second if
	
	console.log(pageNoS+"----------------------처음 전체보기를 위한 ajax입니다-------------------------")

	$.ajax({
		url : "<c:url value = '/community/communityPageList.mn'/>",
		type : "POST",
		data : param
	}).done(function(result){
		
		console.log(result);
		var text = "";
		for(let i = 0; i < result.list.length; i++){
		text+=  "<div class = 'contentsContainer'>"
        		+"<div class = 'left'>"
        		+"<div class = 'contentContainer'>"
           		+"<div class = 'top1'>"
              	+"<div class = 'locationC'>"
                +"<img src='<c:url value = '/resources/img/community/userImg.jpg'/>' class = 'imgSize'>"
                +"<span class = 'userName'>"
                +result.list[i].comWriter
                +"</span>"
                +"<span class = 'regDate'> ·"+result.list[i].comRegDate+"</span></div><div class ='category'>"+result.list[i].comCategory+"</div></div>"
				+"<div class = 'mid' id = '"
				+result.list[i].comNo
				+"'>"
                +"<div class = 'forContent'>"
                +"<h1 class ='title'>"
                +result.list[i].comTitle
                +"</h1>"
                +"<div class = 'content'>"
                +result.list[i].comContent
                +"</div></div>"
                +"<div class = 'forImg'></div></div>"
                +"<div class = 'bottom'>"
                if(result.list[i].comCheckCnt == 1){
                text+= "<div class ='heart is-active "+result.list[i].comNo+"' onclick = refFunction("+result.list[i].comNo+",'${user.id}')></div>"
                +"<div class = 'forCnt'>"
                +"<div class = 'commentCnt'><i class='fas fa-comment-dots'></i> "+result.list[i].comCommentCnt+" Comments</div>"
                +"<div class = 'viewCnt'><i class='fas fa-eye'></i> "+result.list[i].comViewCnt+" View</div></div></div></div></div></div>"
                }else{
                text+= "<div class ='heart "+result.list[i].comNo+"' onclick = refFunction("+result.list[i].comNo+",'${user.id}')></div>"	
                +"<div class = 'forCnt'>"
                +"<div class = 'commentCnt'><i class='fas fa-comment-dots'></i> "+result.list[i].comCommentCnt+" Comments</div>"
                +"<div class = 'viewCnt'><i class='fas fa-eye'></i> "+result.list[i].comViewCnt+" View</div></div></div></div></div></div>"
                }
              
              
              
		}
		if (comCategory && clickPlus == false) {
			$(".mainContainer").html("");
		}
		$(".mainContainer").append(text);
		
		clickPlus = false;
		
		//동적으로 생성된거라 이렇게해줘야 한다는데요? 후후
		$(".mid").click(function() {
			var no = $(this).attr('id');
			location.href = "detailPage.mn?comNo="+no;
									});
		
		//이미지 없애기
		var length;
		$(function(){
			var contentList = document.querySelectorAll(".content");
					console.log(contentList);
			for(let content of contentList){

				console.log($(content));
				$content = $(content);
			
				if($content.find("img").length >= 2){
					console.log("사진갯수가 2개이상")
					$content.find("img").addClass("manyPic")
				}
				if($content.html().indexOf("img")!=-1){
				  	$content.find("img").addClass("forImg3");
				  	
			}	
		}}); 


	})

}; 

function nextListSecond(comCategory){
	pageNoS = 1;
	nextList(pageNoS, comCategory)	
}








//---------------------------------------------------------------------------------------------------------------




//클릭시 글작성 Form
$(".writeBtn").click(function() {
	location.href = "writeForm.mn";
});


function refFunction(comNo, comRefUser){
	
	
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










</script>



</body>
</html>