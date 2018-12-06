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



<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    

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
    float: left;
    font-size: 16px;
    color: gray;
	/* float: left;
    font-size: 16px;
    color: gray;
	margin-right: 15px;
	width: auto;
	height: 20px;
	color: gray;
	font-size: 16px;
	font-family: 'Jua', sans-serif;
	font-weight: 100; */
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
                

              <footer></footer>    
	
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

function forAllBtn(){
	//전체보기를 위한 버튼
	console.log("전체보기를 위한 버튼");
	++pageNo;
	clickPlus = true;
	nextList(pageNo);
}



//전체보기를 위한 페이지
 var nextList = function(pageNoS, comCategory){
	var param = "pageNo="+pageNoS;
	if (comCategory) { 
		if (comCategory != "all") param += "&comCategory=" + comCategory;
		pageNo = 1;
	}
	
	if (clickPlus) {
		if ($("#slct").val() != "all") param += "&comCategory=" + $("#slct").val();
	}
	
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
           		+"<div class = 'top'>"
              	+"<div class = 'locationC'>"
                +"<img src='<c:url value = '/resources/img/community/userImg.jpg'/>' class = 'imgSize'>"
                +"<span class = 'userName'>"
                +result.list[i].comWriter
                +"</span>"
                +"<span class = 'regDate'> ·'"+result.list[i].comRegDate+"'</span></div></div>"
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
                +"<div class = 'category'>"
                +result.list[i].comCategory
                +"</div>"
                +"<div class = 'forCnt'>"
                +"<div class = 'commentCnt'><i class='fas fa-comment-dots'></i> 2 Comments</div>"
                +"<div class = 'viewCnt'><i class='fas fa-eye'></i> ${b.comViewCnt} View</div></div></div></div></div></div>"
              
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
	})

}; 

function nextListSecond(comCategory){
	pageNoS = 1;
	nextList(pageNoS, comCategory)	
}

// function nextListSecond(comCategory){
// 	 console.log(comCategory);
// 	 location.href = "communityPage2.mn?comCategory="+comCategory;
	
// }







//---------------------------------------------------------------------------------------------------------------




//클릭시 글작성 Form
$(".writeBtn").click(function() {
	location.href = "writeForm.mn";
});


</script>



</body>
</html>