<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- sweetalert -->
<script src="<c:url value="/resources/js/common/sweetalert2.all.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/sweetalert2.min.css"/>">
<script>
var friendws = new WebSocket('wss://localhost:443/nmcat/alarm.mn');
//var friend = new WebSocket('wss://192.168.0.63:443/nmcat/alarm.mn');
//var friend = new WebSocket('wss://10.0.1.5:443/nmcat/alarm.mn');
$(function () {
	friendws.onopen = function() {
		console.log("바디 웹소켓 서버 접속 성공");
	}
	friendws.onerror = function(evt) {
   	   console.log('바디 웹소켓 에러 발생 : ' + evt.data)
    };
    friendws.onclose = function() {
   	    console.log("바디 웹소켓 연결 종료.");
    };
    
    showFriendList(1);	
}) //$function
$("a[href='#search']").click(function(){
	showMemberList(1);	
}) //search tab 클릭...

function showMemberList(pageNo){
	$.ajax({
		url : "<c:url value='/friend/memberlist.mn'/>",
		data : "pageNo="+pageNo
	}).done(function(map) {
		let str = "";
		for(let i=1; i <= map.lineNo; i++){
			str += '<div class="line'+i+'">'
			let memberArray = Object.keys(map);
			let list = null;
			
			for(let key of memberArray) {
				if(key == "list"+i){
					list = map[key];
					//alert(list)
					break;
				}
			} // list + i 값 꺼내오기....
			
			for(let member of list) {
				str += '<div class="users" name="users">'
				str += '<div class="profile"><div class="image">'
				str += '<i class="fas fa-user-circle fa-7x"></i>'
				str += '</div><div class="text">'
				str += '<span class="id">'+member.id+'</span></div></div>'
				str += '<div class="info"><div class="grade">';
				str += '<i class="fas fa-trophy fa-2x"></i>'
				str += member.gradeName + '</div>';
				str += '<div class="icons">'
				str += '<a href="#1" data-toggle="tooltip" data-placement="bottom" id="plusfriend" title="친구 신청"'
				str += 'data-id="'+member.id+'">';
				str += '<i class="fas fa-user-plus fa-2x"></i></a>'
				str += '<a href="#1" data-toggle="tooltip" data-placement="bottom" id="sendmsg" title="쪽지 쓰기"';
				str += 'data-id="'+member.id+'">';
				str += '<i class="fas fa-envelope fa-2x"></i></a>'
				str += '<a href="#1" data-toggle="tooltip" data-placement="bottom" id="blockuser" title="회원 차단"';
				str += 'data-id="'+member.id+'">';
				str += '<i class="fas fa-user-slash fa-2x"></i></a>'
				str += '</div></div></div>'
				
			} // list for 문
			str += '</div>'
		} // line for 문
		
		$("div#search div.list").html(str);
		
		showPaging(map);
		
		$('[data-toggle="tooltip"]').tooltip()
		   
	    $("a.tab").click(function(){
	      var id = $(this).attr("href").substring(1)
	       // alert(id)
	      /* $("div#"+id).siblings().css("display", "none")
	      $("div#"+id).css("display", "block") */
	      $("div#"+id).siblings().addClass("fade").removeClass("active")
	      $("div#"+id).removeClass("fade").addClass("active")
	    })
	     
	    $("i.fa-lock").mouseenter(function(){
	      $(this).attr("id", "hidden")
	      $("i.fa-lock-open").attr("id", "show");
	    })
	     
	    $("i.fa-lock-open").mouseleave(function(){
	      $("i.fa-lock-open").attr("id", "hidden")
	      $("i.fa-lock").removeAttr("id");
	    })
	   
	   $("a#plusfriend").click(function() {
		   	console.log("calleeId:", $(this).data("id"))
		   	console.log("${user.id}")
		   	
   			swal({
			  type: 'success',
			  title: '친구 신청이 완료되었습니다.',
			  showConfirmButton: false,
			  timer: 2000
			})
			
		   	friendws.send("friend:"+$(this).data("id"))
		   	$.ajax({
		   		url : "<c:url value='/friend/requestfriend.mn'/>",
		   		data : {
		   			"callerId" : "${user.id}",
		   			"calleeId" : $(this).data("id")
		   		},
		   		type : "POST"
		   	}) // 웹소켓 send
		   	
	   })//친구 추가 클릭..
	}) //done
} //showMemberList

function showPaging(map) {
	let pageStr = "";
	if(map.pageResult.count !=0) {
		pageStr += '<div class="pagination"><a ';
		if(map.pageResult.prev == false){
			pageStr += 'class="disabled" href="#1"'
		} else {
			pageStr += 'href="#" data-pageno="1"';
		} //previousAll if 문
		
		pageStr += 'aria-label="PreviousAll">';
		pageStr += '<span aria-hidden="true"> << </span></a>';
		pageStr += '<a ';
		if(map.pageResult.prev == true){
			pageStr += 'href="#" data-pageno="'+(map.pageResult.pageNo-1)+'"';
		} else {
			pageStr += 'href="#'+map.pageResult.beginPage+'" class="disabled"'
		}//previous if 문
		
		pageStr += 'aria-label="Previous">'
		pageStr += '<span aria-hidden="true"> < </span></a>'
		
		for(let i=map.pageResult.beginPage; i<=map.pageResult.endPage; i++){
			if(i == map.pageResult.pageNo){
				pageStr += '<a href="#'+i+'" id="now">'+i+'</a>'
			} else {
				pageStr += '<a href="#'+i+'" data-pageno="'+i+'">'+i+'</a>'
			}
		} // 페이지 for 문
		
		pageStr += '<a ';
		if(map.pageResult.next == true){
			pageStr += 'href="#'+(map.pageResult.pageNo+1)+'" data-pageno="'+(map.pageResult.pageNo+1)+'"';
		} else {
			pageStr += 'href="#'+map.pageResult.endPage+'" class="disabled"';
		}
		pageStr += 'aria-label="Next">';
		pageStr += '<span aria-hidden="true"> > </span></a>';
		pageStr += '<a ';
		if(map.pageResult.next == false) {
			pageStr += 'class="disabled" href="#'+map.pageResult.lastPage+'"';
		} else {
			pageStr += 'href="#'+map.pageResult.lastPage+'" data-pageno="'+map.pageResult.lastPage+'"';
		}
		pageStr += 'aria-label="NextAll">';
		pageStr += '<span aria-hidden="true"> >> </span></a></div>'
	} // if count != 0
	
	$("div#paging").html(pageStr);
	
	$("a[data-pageno]").click(function() {
		//alert($(this).data("pageno"))
		showMemberList($(this).data("pageno"));
	})
	
}//showpaging function

</script>