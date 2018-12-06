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

                        <select name="searchType" id="slct" onchange = "nextListSecond(0,this.value)">
                        			<option class = "all"  id = "1" value="전체보기" >전체보기</option>
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
		                    <button class="forCa" id = "bubbly-button" onclick = "forCaBtn()">더보기</button>
                   </div>
        			
                </div>
                

              <footer></footer>    
	
<script>
//---------------------------------------------------------------------------------------------------------------
// 처음 커뮤니티 페이지 뜰때에는 1Page이며 ajax를 이용하여 뿌려준다.
 $(document).ready(function(){
	
	nextList(1);

}); 

 var comCategory =  $("#slct option:selected").val();
console.log(comCategory);




//카테고리를 위한 페이지 번호
var pageNo = 0;
//전체보기를 위한 페이지 번호
var pageNoS = 1;

function forAllBtn(){
	//전체보기를 위한 버튼
	console.log("전체보기를 위한 버튼");
	++pageNoS;
	nextList(pageNoS);
}
function forCaBtn(){
	 
	comCategory =  $("#slct option:selected").val();
	console.log("카테고리를 위한 버튼");
	nextListSecond(pageNo, comCategory);
	++pageNo;
	
}
/* $(".forAll").click(function(){
	//전체보기를 위한 버튼
	console.log("전체보기를 위한 버튼");
	++pageNoS;
	nextList(pageNoS);
});

$(".forCa").click(function(comCategory, comCategory2){
	if(comCategory != comCategory2){
		pageNo = 0;
		comCategory =  $("#slct option:selected").val();
		console.log("===================첫번쨰 : "+comCategory+", 두번쨰 : "+comCategory2);
		console.log("카테고리를 위한 버튼");
		nextListSecond(pageNo, comCategory);
		++pageNo;
	}
	
	
	
}); */

// 두번째
var nextListSecond = function(pageNo, comCategory){
	
	console.log(comCategory+"nextListSecond에서 받아진 comCtegory");
	/* if(comCategory == "전체보기"){
		
		$("#bubbly-button").removeClass("displayNone");
		$("#bubbly-button").addClass("forAll");
	
		
 }else{
		 	$("#bubbly-button").removeClass();
			$("#bubbly-button").addClass("forCa");
		

	 } */

	//if문 전체보기일 경우 /community/communityPageList.mn 이 url을 사용하고
	//전체보기 외의 카테고리가 선택되었을 경우 /community/communityPageListC.mn 이 url을 사용한다.
	if(comCategory == "전체보기"){
		
		console.log(pageNo, comCategory+"가 선택됨----------------------카테고리 전체보기를 선택했을시를 위한 ajax입니다-------------------------");
	
		/* */
		
		$.ajax({
			url : "<c:url value = '/community/communityPageList.mn'/>",
			type : "POST",
			data : "pageNo="+pageNo
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
			$(".mainContainer").append(text);
			//동적으로 생성된거라 이렇게해줘야 한다는데요? 후후
			$(".mid").click(function() {
				var no = $(this).attr('id');
				location.href = "detailPage.mn?comNo="+no;
										});
		})
		
		
		
	}else if(comCategory != "전체보기"){
		
		++pageNo;
		console.log(pageNo,comCategory+"가 선택됨----------------------다른 카테고리들을 위한 ajax입니다-------------------------")
		
		$.ajax({
			url : "<c:url value = '/community/communityPageListC.mn'/>",
			type : "POST",
			data : "pageNo="+pageNo+"&comCategory="+comCategory
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
			$(".mainContainer").html(text);
			//동적으로 생성된거라 이렇게해줘야 한다는데요? 후후
			$(".mid").click(function() {
				var no = $(this).attr('id');
				location.href = "detailPage.mn?comNo="+no;
										});
			
			
			
}) //여기까지가 한 에이작스

		
		
		
	}
	
}





//전체보기를 위한 페이지
 var nextList = function(pageNoS){
	console.log(pageNoS+"----------------------처음 전체보기를 위한 ajax입니다-------------------------")

	$.ajax({
		url : "<c:url value = '/community/communityPageList.mn'/>",
		type : "POST",
		data : "pageNo="+pageNoS
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
		$(".mainContainer").append(text);
		//동적으로 생성된거라 이렇게해줘야 한다는데요? 후후
		$(".mid").click(function() {
			var no = $(this).attr('id');
			location.href = "detailPage.mn?comNo="+no;
									});
	})

}; 
//------------------------------------------------카테고리 ----------------------------------------------------
/* 
 function categoryFunction(comCategory){
	//더보기를 누를경우 nextList(pageNo) 이함수가 실행되며 communityPageList.mn로 가게된다.()
	//그래서 다른 카테고리를 선택해도 전체보기의 게시글들이 뜨게된다! 구별해주기위해 아래의 if문을 사용한 것이다.(버튼의 클래스를 다르게하여 보내주는 URL을 다르게!)
 	if(comCategory != "전체보기"){
		$("#bubbly-button").removeClass("forAll");
		$("#bubbly-button").addClass("forCa");
		
 	 
	}else{
		$("#bubbly-button").removeClass("forCa");
		$("#bubbly-button").addClass("forAll");
 		
	}
	



	//pageNo의 값을 1 리셋시켜야한다!
	pageNo = 1;
	if(comCategory == "전체보기" || comCategory == null || pageNo == 1){
		
		
		console.log("전체보기!")
			$.ajax({
		url : "<c:url value = '/community/communityPageList.mn'/>",
		type : "POST",
		data : "pageNo="+pageNo
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
		$(".mainContainer").html(text);
		//동적으로 생성된거라 이렇게해줘야 한다는데요? 후후
		$(".mid").click(function() {
			var no = $(this).attr('id');
			location.href = "detailPage.mn?comNo="+no;
									});
	})
		
}else{
	
	
		console.log("전체보기를 제외한 다른애들!")

			 $.ajax({
					url : "<c:url value = '/community/communityPageListC.mn'/>",
					type : "POST",
					data : "pageNo="+pageNo+"&comCategory="+comCategory
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
					$(".mainContainer").html(text);
					//동적으로 생성된거라 이렇게해줘야 한다는데요? 후후
					$(".mid").click(function() {
						var no = $(this).attr('id');
						location.href = "detailPage.mn?comNo="+no;
												});
					
					
					
	}) 

			
}
	

	
	
}; */


//---------------------------------------------------------------------------------------------------------------




//클릭시 글작성 Form
$(".writeBtn").click(function() {
	location.href = "writeForm.mn";
});
//클릭시 상세 글 보기
/* $(".mid").click(function() {
	var no = $(this).attr('id');
	location.href = "detailPage.mn?comNo="+no;
});
 */
/*  $(".mid").on("click", function(){
	 console.log("ehlsek!s");
	 location.href = "detailPage.mn?comNo="+no;
 });
  */
/*   
 $(".forCa").click(function(){
	//카테고리를 위한 버튼
	var comCategory =  $("#slct option:selected").val();
	  console.log(comCategory);
	  console.log("카테고리들을 위한 버튼");
	  ++pageNo;
	  categoryFunction(comCategory);

}); */

</script>



</body>
</html>