<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- msgpop -->
<link rel="stylesheet" href="<c:url value="/resources/css/member/memopop.css"/>">

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
</head>
<body>
 <div class="contents">
    <div class="memopop">
        <span>받는사람 : </span> <input type="text" name="name" id="name" value="${user.id}"/>
    </div>
    <hr>
    <span>제목 : </span> <input type="text" name="title" id="title"/>
    <hr>
    <div class="content">
        <textarea placeholder="내용을 입력하세요." rows="15" cols="80" value=""></textarea>
    </div>
    <div class="check">
        <input id="check" type="checkbox" name="check" value="1" /><span id="check1">보낸 쪽지함에 저장<span id="check2">(보낸쪽지함에 
                저장하면수신 확인이 가능합니다.)
        </span></span>
    </div>
    <div class="memoBtn">
        <button type="button" id="sendBtn" name="sendBtn">보내기</button>
        <input type="button" value="취소" id="cancel" name="cancel" onclick="javascript:self.close();">
    </div>
</div>
</body>
</html>