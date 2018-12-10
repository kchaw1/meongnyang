<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
$(function(){
	var contentList = document.querySelectorAll(".dr-content");
	var css = null;
	for(let content of contentList){
		var liDiary = content.parentNode;
		//console.log($(content))
		$content = $(content);
		if($content.html().indexOf("img")!=-1){
			//console.log($content.data("no"))
			$content.parent().addClass("bigger")
			css = document.defaultView.getComputedStyle(liDiary);
			liDiary.style.width = parseInt(css.width) + 80 + "px"
			liDiary.style.height = parseInt(css.height) + 120 + "px"
			liDiary.style.paddingLeft = parseInt(css.paddingLeft) + 10 + "px"
			liDiary.style.paddingTop = parseInt(css.paddingTop) + 20 + "px"
			//console.dir(document.defaultView.getComputedStyle(liDiary));
		}
	} // contentList
	
	
	
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
		data : {"drNo" : drNo,
				"userId" : "${user.id}"
			},
		type : "POST"
	}).done(function(map){
		$("span#writer").html(map.diary.drWriter+" 님의");
		
		let str = "";
			str += '<div class="diary" data-no="'+map.diary.drNo+'" >'
			str += '<div class="drTitle">'
			str += '<span class="title">'+map.diary.drTitle+'</span><br>'
			str += '<span class="date">'+map.diary.drRegDateTime+'</span>';
			 if(map.diary.drShare =='1') {
				str += '<span class="label label-share">전체 공개</span>';					
			} else if (map.diary.drShare =='2'){
				str += '<span class="label label-friend">친구에게만 공개</span>';
			} else {
				str += '<span class="label label-noshare">나만 보기</span>';
			}
			if(map.diary.drContent ==null) {
				map.diary.drContent = "내용 없음..."
			}
			str += '</div><div class="drContent">'+map.diary.drContent+'</div>';
			str += '<div class="buttons"><div class="button-box">'
			//str += '<button class="dr-delete" data-value="'+map.diary.drNo+'" data-date="'+diary.drDate+'">삭제</button>'
			//str += '<button class="dr-update" data-value="'+map.diary.drNo+'" data-date="'+diary.drDate+'">수정</button>'
			str += '</div></div></div>'
		$("div.diaryList").html(str);
	})//done
}//showdetaildiary

var pageNo = "${param.pageNo}";
$(window).scroll(function(){
	//alert(pageNo)
	var sh = $(window).scrollTop() + $(window).height();
	var dh = $(document).height(); 
	
	/* if(sh +10 >=dh) { */
	if($(window).scrollTop() == $(document).height() - $(window).height()) {
		pageNo++;
		//alert(pageNo)
		$.ajax({
			url : "<c:url value='/diary/share/plusdiary.mn' />",
			data : {"pageNo" : pageNo,
				"userId" : "${user.id}"
			},
			type : "POST"
		}).done(function(map) {
			console.log(map.list1)
			console.log("${user.id}")
			let str ="";
			if("${user.id}"==null || "${user.id}"==""){
				for(let diary of map.list1){
					str += '<li class="diary" data-toggle="modal" data-target="#share"  data-no="'+diary.drNo+'">'
					str += '<div class="dr-title">'
					str += '<div class="title">'+diary.drTitle+'</div>'
					str += '<div class="writer">'+diary.drWriter+'</div>'
					str += '<div class="date">'+diary.drRegDateTime+'</div>'
					str += '</div><div class="dr-content">'+diary.drContent+'</div>'
					str += '<div class="dr-comments"> 댓글없음</div></li>'
				}
			} else {
				for(let diary of map.list2){
					if((diary.friendsId!=null && diary.drShare=='2') || diary.drShare=='1' || diary.drWriter =="${user.id}"){
						str += '<li class="diary" data-toggle="modal" data-target="#share"  data-no="'+diary.drNo+'">'
						str += '<div class="dr-title">'
						str += '<div class="title">'+diary.drTitle+'</div>'
						str += '<div class="writer">'+diary.drWriter
						if(diary.friendsId != null) {
							str += '<span class="label label-friend">친구</span>'
						} else if(diary.drWriter == "${user.id}") {
							str += '<span class="label label-me">나</span>'
						}
						str += '</div>'
						str += '<div class="date">'+diary.drRegDateTime+'</div>'
						str += '</div><div class="dr-content">'+diary.drContent+'</div>'
						str += '<div class="dr-comments"> 댓글없음</div></li>'
						
					} // 친구꺼인데 2 일때랑 내 일기랑 공개 일기만 보여주기..
					
				} // for
				} // 로그인 했을시..
			
			$("ul#stickies").append(str);	
		}) //done
	}
});
</script>