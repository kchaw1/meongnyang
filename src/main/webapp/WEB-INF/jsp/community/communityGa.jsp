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
       .searchPart{
        width: 100%;
        height: 50px;
    }
    .allContainer{
        margin-top: 110px;
        width: 100%;
        height: 1000px;
        border: 1px solid black;
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
    margin-right: 87px;
    margin-top: 30px;
}
.viewContainer{
    width: 100%;
    height: 25px;
    border: 1px solid rgb(226, 219, 219);
}

</style>
<body>
<c:import url = "../common/header.jsp"/>

<!-- 여기서부터 컨텐츠 시작  -->

<div class = "allContainer">
              <!--컨텐츠 여기서부터 forEach-->
                <c:forEach var = "b" items = "${map.gallery}">
            <div class = "galleryContentContainer">
                <div class = "galleryImg"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                   <div class = "img">${b.comContent}</div>
                </div>
                <div class = "viewContainer"></div>
            </div>
            </c:forEach>

           
                   
            
            
          </div><!-- 모든 컨텐츠들 담는 곳!-->




          <!--모달 부분-->





		

 <!-- 낭만 코양이 푸터 -->

               
</body>
</html>