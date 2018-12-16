<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src = "https://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 배민폰트 -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<!-- 배민폰트 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<%-- <link rel="stylesheet" href="<c:url value="/resources/css/community/communityGa.css"/>"> --%>
<!-- 부트스트랩 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="../common/headerfooterCSSJS.jsp" />

</head>
<style>


body{
background-color: #fdfdfd;
}
       .searchPart{
        width: 100%;
        height: 50px;
    }
    .allContainer{
        width: 100%;
        height: 100%;
        padding-left: 280px;
        padding-right: 200px;
    }
    div{
        float: left;
    }



.galleryContentContainer{
    width: 280px;
    height: 270px;
    border: 1px solid rgb(226, 219, 219);
    margin-right: 58px;
    margin-top: 30px;
}
.viewContainer{
    width: 100%;
    height: 25px;
    border: 1px solid rgb(226, 219, 219);
        padding: 8px;
}
.searchForm{
width : 100%;
	margin-top : 115px;
	padding-left : 658px;
	padding-right :  658px;
	
}


.cf:before, .cf:after{
    content:"";
    display:table;
}
 
.cf:after{
    clear:both;
}
 
.cf{
    zoom:1;
}    

 /* Form wrapper styling */
.search-wrapper {
width: 240px;
margin: 45px auto 50px auto;

}
 
/* Form text input */
 
.search-wrapper input {
width: 160px;
height: 20px;
padding: 10px 15px;
float: left;
font: normal 16px 'Arial', 'Tahoma';
border: 0;
background: #fff;
border-radius: 5px 0 0 5px;
}

.search-wrapper input:hover + .search-wrapper button {
    background: #ccc
}
 
.search-wrapper input:focus {
    outline: 0;
    background: #fff;

}
 
.search-wrapper input::-webkit-input-placeholder {
   color: #c6c7c6;
   font-weight: normal;

}
 
.search-wrapper input:-moz-placeholder {
    color: #999;
    font-weight: normal;
    font-style: italic;
}
 
.search-wrapper input:-ms-input-placeholder {
    color: #999;
    font-weight: normal;
    font-style: italic;
}    
 
/* Form submit button */
.search-wrapper button {
overflow: visible;
position: relative;
float: right;
border: 0;
padding: 0;
cursor: pointer;
height: 40px;
width: 50px;
font: bold 18px 'Arial', 'Tahoma';
color: white;
background: #f1eaea;
border-radius: 0 5px 5px 0;
transition: all 2.0s linear;
    -webkit-transition: all 0.2s linear;
    -moz-transition: all 0.2s linear;
    -ms-transition: all 0.2s linear;
    -o-transition: all 0.2s linear;
}
   
.search-wrapper button:hover{     
    background: rgb(65, 192, 142, 0.7);
    transition: all 2.0s linear;
    -webkit-transition: all 0.2s linear;
    -moz-transition: all 0.2s linear;
    -ms-transition: all 0.2s linear;
    -o-transition: all 0.2s linear;
}   
   
.search-wrapper button:active,
.search-wrapper button:focus{   
    background: #329400;
    outline: 0;   
    transition: all 0s linear;
    -webkit-transition: all 0s linear;
    -moz-transition: all 0s linear;
    -ms-transition: all 0s linear;
    -o-transition: all 0s linear;
  
}
 

 
.search-wrapper button:hover:before{
    border-right-color: #e54040;
  
}
 
.search-wrapper button:focus:before,
.search-wrapper button:active:before{
        border-right-color: #c42f2f;
}      
 
.search-wrapper button::-moz-focus-inner { /* remove extra button spacing for Mozilla Firefox */
    border: 0;
    padding: 0;
}    

.search-wrapper input {
    width: 160px;
    height: 20px;
    padding: 10px 15px;
    float: left;
    font: normal 16px 'Arial', 'Tahoma';
    border: 0;
    background: #fff;
    border-radius: 5px 0 0 5px;
    margin-top: 10px;
}

.search-wrapper {
    width: 240px;
    margin: 45px auto 50px auto;
    background: white;
}


/* 하트 */

.coracao{
  width: 10px;
  height: 10px;
  background: red;
  position: relative;
  transform: rotate(-135deg);

  animation: pulsar 1s alternate ease infinite;
}

.coracao::before{
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: red;
  position: absolute;
  top: 7px;
  content: "";
}

.coracao::after{
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: red;
  position: absolute;
  left: 7px;
  content: "";
}

@keyframes pulsar{
  0%   {transform: scale(.5) rotate(-135deg);}
  100% {transform: scale(.6) rotate(-135deg);}
}
.heartCnt {
    font-size: 13px;
    margin-top: -3.6px;
    margin-left: 5px;
}


</style>
<body>
<c:import url = "../common/header.jsp"/>

<!-- 여기서부터 컨텐츠 시작  -->

					<div class = "searchForm">
							<form action="/search.html" class="search-wrapper cf">
							        <input type="text" placeholder="작성자로 검색" required="">
							        <button type="submit"><i class="fas fa-search"></i></button>
							</form>
					</div>

<div class = "allContainer">
              <!--컨텐츠 여기서부터 forEach-->
                <c:forEach var = "b" items = "${gallery}">
            <div class = "galleryContentContainer">
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
 
 </script>
               
</body>
</html>