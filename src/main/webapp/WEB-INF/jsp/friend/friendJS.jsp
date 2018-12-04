<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- sweetalert -->
<script src="<c:url value="/resources/js/common/sweetalert2.all.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/sweetalert2.min.css"/>">
<script>
/* $(function () {
   	showFriendList(1);	
}) //$function */

function showFriendList(pageNo){
	$.ajax({
		url : "<c:url value='/friend/showallfriend.mn'/>",
		data : {"pageNo" : pageNo,
				"userId" : "${user.id}"
				},
		type : "POST"
	}).done(function(map) {
		console.dir(map)
		let str = "";
		for(let i=1; i <= map.lineNo; i++){
			str += '<div class="line'+i+'">'
			let friendArray = Object.keys(map);
			let list = null;
			
			for(let key of friendArray) {
				if(key == "list"+i){
					list = map[key];
					console.log(list)
					break;
				}
			} // list + i 값 꺼내오기....
			
			for(let friend of list) {
				str += '<div class="users" name="users">'
				str += '<div class="profile"><div class="image">'
				str += '<i class="fas fa-user-circle fa-7x"></i>'
				str += '</div><div class="text">'
				str += '<span class="id">'+friend.id+'</span></div></div>'
				str += '<div class="info"><div class="grade">';
				str += '<i class="fas fa-trophy fa-2x"></i>'
				str += friend.gradeName + '</div>';
				str += '<div class="icons">'
				str += '<a href="#1" data-toggle="tooltip" data-placement="bottom" id="dochat" title="채팅 하기"'
				str += 'data-id="'+friend.id+'">';
				str += '<i class="far fa-comments fa-2x"></i></a>'
				str += '<a href="#1" data-toggle="tooltip" data-placement="bottom" id="goDiary" title="다이어리 보기"';
				str += 'data-id="'+friend.id+'">';
				str += '<i class="fas fa-address-book fa-2x"></i></a>'
				str += '<a href="#1" data-toggle="tooltip" data-placement="bottom" id="sendmsg" title="쪽지 쓰기"';
				str += 'data-id="'+friend.id+'">';
				str += '<i class="far fa-envelope fa-2x" ></i></a>'
				str += '</div></div></div>'
				
			} // list for 문
			str += '</div>'
		} // line for 문
		
		$("div#friend div.list").html(str);
		
		showPaging(map);

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
		showFriendList($(this).data("pageno"));
	})
	
}//showpaging function

</script>