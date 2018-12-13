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
	
	//사진 뿌려주기..
	showImage();
	
}) //on.ready

$("ul#stickies").on("click", "[data-toggle='modal']",function() {
	//alert($(this).data("no"))
	  let drNo = $(this).data("no")
	 // alert(drNo);
	  //$("span#setdate").html(setdate.substr(0,4)+"." +setdate.substr(4,2)+"."+setdate.substr(6,2))  
	  showdetailDiary(drNo);
}) //일기가 있는 날짜 눌렀을 때 일기제목에 날짜 넣기 ..

function showImage(){
	var div = document.querySelectorAll("div.writer")
	for(let ele of div) {
		$ele = $(ele);
		let id = $ele.data("id");
		$.ajax({
			url : "<c:url value='/diary/share/showimage.mn' />",
			data : "id=" + id,
			type : "POST"
		}).done(function(member){
			let html ="";
			if(member.imageName == null) {
				html ='<img src="<c:url value="/resources/img/community/userImg.jpg"/>" />'	
			} else {
				html = '<img src="<c:url value="/common/download.mn?sysName='+member.imageName+'&path='+member.imagePath+'"/>" />'
			}
			//console.log(member)
			
			$(".writer[data-id='"+id+"'] div.image").html(html);
		})
		
	} //for 문..
} //showImage 함수..

function showdetailDiary(drNo) {
	//alert(drNo);
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
			
			if(("${user.id}" != "")) {
				str += '<div class="aboutcomments" data-no="'+map.diary.drNo+'">'
				str += '<div class="commentform form-group">'
				str += '<form id="commentform" name="comment" method="POST" >'
				str += '<input type="hidden" name="drcWriter" value="${user.id}"/>'
				str += '<input type="text" class="form-control" id="drcContent" data-no="'+map.diary.drNo+'" placeholder="댓글을 입력해주세요."/>'		
				str += '<div class="combuttonbox" data-no="'+map.diary.drNo+'">'
				str += '<a href="#1" id="morecomments" class="more hidden" data-no="'+map.diary.drNo+'">댓글 더보기</a>'
				str += '<button type="button" class="drc-write">등록</button>'
				str += '</div></form></div>'
				str += '<div class="commentList hidden" data-no="'+map.diary.drNo+'"><ul class="comments">'
				str += '</ul></div>'
				str += '</div></div>'
			}
			$("div.diaryList").html(str);
			
			$("button.drc-write").click(function(){
				writecomment($(this).parent().data("no"))
			})
			
			if(map.comment.length != 0) {
				for(let comment of map.comment) {
				$("a#morecomments[data-no='"+comment.drNo+"']").removeClass("hidden");
				$("a#morecomments[data-no='"+comment.drNo+"']").addClass("show")
				var html = "";
					html += '<li class="comment" data-drno="'+comment.drNo+'" data-drc="'+comment.drcNo+'">'
					html += '<a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Kasper"></a>'
					html += '<div class="meta">'+comment.drcWriter
					if(comment.friendsId == comment.drcWriter) {						
						html += '<span class="small-label label-friend">친구</span>'
					} else if (comment.drcWriter == "${user.id}") {
						html += '<span class="small-label label-me">나</span>' 
					}
					html += '| '+ comment.drcRegDate
					html += '<a href="#1" class="update" id ="editBtn" data-drc="'+comment.drcNo+'">수정 </a> <a href="#1" class="delete" data-drc="'+comment.drcNo+'"> 삭제</a></div>'
					html += '<div class="body">'+comment.drcContent+'</div></li>'
				$("div.diary[data-no='"+comment.drNo+"'] > .aboutcomments > .commentList > ul").append(html);
				} //comment for 문..
			} // comment 있으면 뿌리기..
			
			$("a#morecomments").click(function(){
				$("div.commentList[data-no='"+$(this).data("no")+"']").toggleClass("hidden")
				$("div.commentList[data-no='"+$(this).data("no")+"']").toggleClass("show")
				if($(this).html() =="댓글 더보기"){
					$(this).html("댓글 숨기기")				
				} else {
					$(this).html("댓글 더보기")
				}
			})//click
			
			
			
	})//done
}//showdetaildiary

function writecomment(drNo) {
	$.ajax({
		url : "<c:url value='/diary/share/comment/write.mn' />",
		data : {
			"drNo" : drNo,
			"drcWriter" : "${user.id}",
			"drcContent" : $("input#drcContent[data-no='"+drNo+"']").val()
		},
		type : "POST"
	}).done(function(){
		showdetailDiary(drNo)
	})
	
} //writecomment

//무한 스크롤...
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
			//console.log(map.list1)
			//console.log("${user.id}")
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
						str += '<div class="writer dropdown show">'
						str += '<div class="image"></div>'
						if(diary.friendsId != null) {
							str += '<a href="#1" class="btn-secondary dropdown-toggle" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> '
							str += diary.drWriter + '</a><span class="label label-friend">친구</span>'
							str += '<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenuLink">'
							str += '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>'
							str += '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>'
							str += '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>'
							str += '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li></ul>'
						} else if(diary.drWriter == "${user.id}") {
							str += ' '+diary.drWriter + '<span class="label label-me">나</span>'
						} else {
							str += ' '+diary.drWriter
						}
						str += '</div>'
						str += '<div class="date">'+diary.drRegDateTime+'</div>'
						str += '</div><div class="dr-content">'+diary.drContent+'</div>'
						str += '<div class="dr-comments"> 댓글없음</div></li>'
						
					} // 친구꺼인데 2 일때랑 내 일기랑 공개 일기만 보여주기..
					
				} // for
				} // 로그인 했을시..
			
			$("ul#stickies").append(str);	
			showImage();
				
		}) //done
	}
});
</script>