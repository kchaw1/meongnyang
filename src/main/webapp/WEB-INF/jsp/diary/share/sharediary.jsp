<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp"/>
<c:import url="./sharediaryCSSJS.jsp"/>
</head>
<body>
<c:import url="../../common/header.jsp"/>
<div class="top-section">
	<div class="sharediaryList">
        <ul id="stickies">
        	<c:forEach var="dr" items="${list}">
            <li class="diary" data-toggle="modal" data-target="#share"  data-no="${dr.drNo}">
				<div class="dr-title">
	               <div class="title">${dr.drTitle}</div>
	               <div class="writer">${dr.drWriter}</div>
	               <div class="date"><fmt:formatDate value="${dr.drRegDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
              	</div>
              	<div class="dr-content">${dr.drContent}</div>
              	<div class="dr-comments"> 댓글없음</div>
			</li>
			</c:forEach> 
        </ul>
    </div>
    <div class="modal fade" id="share" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog modal-center">
	      <div class="modal-content">
	        <!-- <img src="./img/diary.png"/ class="diary"> -->
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          <h3 class="header"><span id="writer"></span> 일기</h3>
	        </div>
	        <div class="modal-body">
	          <div class="diaryList">
	
	          </div>
	      	</div>
	      </div>
	  </div>
	</div> 
</div>
<c:import url="../../common/footer.jsp"/>
<script type="text/javascript">
$(function(){
	var contentList = document.querySelectorAll(".dr-content");
	for(let content of contentList){
		//console.log($(content))
		$content = $(content);
		if($content.html().indexOf("img")!=-1){
			console.log($content.data("no"))
			$content.parent().addClass("bigger")
		}
	}	
}) //on.ready

$("[data-toggle='modal']").click(function() {
	  let drNo = $(this).data("no")
	 // alert(drNo);
	  //$("span#setdate").html(setdate.substr(0,4)+"." +setdate.substr(4,2)+"."+setdate.substr(6,2))  
	  showdetailDiary(drNo);
}) //일기가 있는 날짜 눌렀을 때 일기제목에 날짜 넣기 ..

function showdetailDiary(drNo) {
	$.ajax({
		url : "<c:url value='/diary/share/showdetail.mn' />",
		data : "drNo="+drNo,
		type : "POST"
	}).done(function(map){
		$("span#writer").html(map.diary.drWriter+" 님의");
		
		let str = "";
			str += '<div class="diary" data-no="'+map.diary.drNo+'" >'
			str += '<div class="dr-title">'
			str += '<span class="title">'+map.diary.drTitle+'</span><br>'
			str += '<span class="date">'+map.diary.drRegDateTime+'</span>';
			/* if(diary.drShare =='1') {
				str += '<span class="label label-share">전체 공개</span>';					
			} else if (diary.drShare =='2'){
				str += '<span class="label label-friend">친구에게만 공개</span>';
			} else {
				str += '<span class="label label-noshare">나만 보기</span>';
			} */
			if(map.diary.drContent ==null) {
				map.diary.drContent = "내용 없음..."
			}
			str += '</div><div class="dr-content">'+map.diary.drContent+'</div>';
			str += '<div class="buttons"><div class="button-box">'
			//str += '<button class="dr-delete" data-value="'+map.diary.drNo+'" data-date="'+diary.drDate+'">삭제</button>'
			//str += '<button class="dr-update" data-value="'+map.diary.drNo+'" data-date="'+diary.drDate+'">수정</button>'
			str += '</div></div></div>'
		$("div.diaryList").html(str);
	})//done
}//showdetaildiary
</script>
</body>
</html>