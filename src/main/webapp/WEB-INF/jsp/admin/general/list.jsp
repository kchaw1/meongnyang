<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="generalListCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>

	<div id="container">
		<div class="panel">
			<!-- 좌측 메뉴 -->
			<div class="aside">
				<div class="avatar">
					<a href="admin1.html"><img
						src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a>
				</div>
				<br>
				<div class="seperator"></div>
				<div class="list">
					<div id="board" class="item">게시판</div>
					<div class="board-hidden youtube">
						<a href="youtube.html">유튜브</a>
					</div>
					<div class="board-hidden crowd-fund">
						<a href="crowd-funding.html">크라우드펀딩</a>
					</div>
					<div class="board-hidden notice">
						<a href="notice.html">공지사항</a>
					</div>
					<div id="management" class="item">관리</div>
					<div class="mgm-hidden abs-member">
						<a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a>
					</div>
					<div class="mgm-hidden gen-member">
						<a href="<c:url value="/admin/general/list.mn" />">일반회원</a>
					</div>
					<div id="statistics" class="item">
						<a href="statistics.html" style="color: black;">통계</a>
					</div>
				</div>
			</div>
			<!-- /좌측 메뉴 -->

			<!-- 우측 콘텐츠 영역-->
			<div class="view">
				<div class="sub-title">Management > General Membership</div>
				<div class="main-title">일반 회원</div>
				<div class="seperator"></div>

				<!-- 탭 -->
				<div class="tabs">
					<ul>
						<li><a href="#tabs-1">일반 회원</a></li>
					</ul>
					<div id="tabs-1">
						<h2>목록</h2>
						<div class="search-area">
							<div class="select-area">
								<select id="searchType" class="form-control">
									<option value="0">선택</option>
									<option value="1">아이디</option>
									<option value="2">이름</option>
									<option value="3">가입일</option>
									<option value="4">최근접속일</option>
									<option value="5">활동점수</option>
									<option value="6">포인트</option>
									<option value="7">등급</option>
								</select>
							</div>
							<div class="search">
								<input type="text" id="keyword" name="name"
									class="form-control" placeholder="검색어를 입력하세요">
							</div>
							&nbsp;
							<div class="btn-area">
								<button type="button" id="searchBtn" class="btn btn-default">검색</button>
							</div>
						</div>
						<br>
						<div class="clear-fix"></div>
						<div class="header-area">
							<div class="no-area">회원번호 <a href="#"><i class="fas fa-sort no" data-sort="1" data-flag="1" data-search="n"></i></a></div>
			                <div class="id-area">아이디 <a href="#"><i class="fas fa-sort id" data-sort="2" data-flag="1" data-search="n"></i></a></div>
			                <div class="name-area">이름 <a href="#"><i class="fas fa-sort name" data-sort="3"  data-flag="1" data-search="n"></i></a></div>
			                <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort sign_up_date" data-sort="4"  data-flag="1" data-search="n"></i></a></div>
			                <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort login_date_time" data-sort="5" data-flag="1" data-search="n"></i></a></div>
			                <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort score" data-sort="6" data-flag="1" data-search="n"></i></a></div>
			                <div class="point-area">포인트 <a href="#"><i class="fas fa-sort point" data-sort="7" data-flag="1" data-search="n"></i></a></div>
			                <div class="grade-area">등급 <a href="#"><i class="fas fa-sort grade" data-sort="8" data-flag="1" data-search="n"></i></a></div>
							<div class="clear-fix">
							<hr>
						</div>
						</div>
					</div>
					<!-- /우측 콘텐츠 영역-->
				</div>
				<div class="clear-fix"></div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
<script>
	$(document).ready(function () {
	    ajaxList(1, 1);
	})
	
	var ajaxList = function(sort, flag) { 
	$.ajax({
			url: "<c:url value='/admin/general/printGeneralList.mn'/>",
			type: "POST",
			data: {
					"sort" : sort,
					"flag" : flag
				  }
	}).done(function (result) {
		   console.log(result)
		   
		   var html ="";
		   for(var i in result.list) {
		     html +=   "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.list[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.list[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.list[i].name +"</div>"
			            +  "<div class='sign-area'>"+ result.list[i].signUpDate +"</div>"
			            +  "<div class='recent-area'>"+ result.list[i].loginDateTime + "</div>"
			            +  "<div class='active-area'>"+ result.list[i].score +"</div>"
			            +  "<div class='point-area'>"+ result.list[i].point +"</div>"
			            +  "<div class='grade-area'>"+ result.list[i].codeName +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no=" + result.list[i].no + " data-id='" + result.list[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.list[i].no + " data-id='" + result.list[i].id + "'>탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
		   }
			$("#tabs-1").append(html);			          
		});
	} // ajaxList
	
	var ajaxSearchList = function(searchType, keyword, sort, flag) { 
		$.ajax({
       		url: "<c:url value='/admin/general/search.mn'/>",
    	   type: "POST",
   		   data: {
	   				"searchType" : searchType,
			   		"keyword" : keyword,
			   		"sort" : sort,
			   		"flag" : flag
   		   		 }
        }).done(function (result) {
	    	   console.log(result)
	    	   var html ="";
	    	   for(var i in result.searchList) {
	    		   
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.searchList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.searchList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.searchList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ result.searchList[i].signUpDate +"</div>"
			            +  "<div class='recent-area'>"+ result.searchList[i].loginDateTime + "</div>"
			            +  "<div class='active-area'>"+ result.searchList[i].score +"</div>"
			            +  "<div class='point-area'>"+ result.searchList[i].point +"</div>"
			            +  "<div class='grade-area'>"+ result.searchList[i].codeName +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no=" + result.searchList[i].no + " data-id='" + result.searchList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.searchList[i].no + " data-id='" + result.searchList[i].id + "'>탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-1").append(html);			          
        });
	} // ajaxYSearchList
	
	// 검색
	$("#searchBtn").click(function() {
		if($("#searchType").val() == 0 && $("#keyword").val() != "") {
    		swal("카테고리를 선택하세요","" ,"error");
 			return false;
    	}
 		if($("#searchType").val() != 0 && $("#keyword").val() == "") {
 			swal("검색어를 입력해주세요","","error");
 			return false;
 		}
		
		var $searchType = $("#searchType option:selected").val()
		var $keyword = $("#keyword").val()
		
		console.log($searchType)
		console.log($keyword)
		
		if($searchType == 0) { // 셀렉트가 '선택' 으로 되어있을경우
			$("#tabs-1 > .content-area").remove();
			ajaxList(1,1)
			$("#tabs-1 i").data("search", "n")
			return;
		}
		
		$("#tabs-1 > .content-area").remove();
		ajaxSearchList($searchType, $keyword, 1,1);
		$("#tabs-1 i").data("search", "y")
	})
	
	
	// 정렬
	$(".no").click(function() { // 번호순
		console.log($(this).data("search"))
		if ($(this).data("search")== 'y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".id").click(function() { // 아이디순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".name").click(function() { // 이름순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".sign_up_date").click(function() { // 가입일순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".login_date_time").click(function() { // 최근접속일순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".score").click(function() { // 활동점수순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".point").click(function() { // 포인트순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	$(".grade").click(function() { // 포인트순
		if ($(this).data("search")=='y') {
			searchSort(this)
			return;
		} 
		sort(this)
	})
	
	// 정렬 함수 
	var sort = function(call) {
		var $sort = $(call).data("sort");
		
		console.log("현재호출의 flag", $(call).data("flag"))
		console.log("현재호출형제의 flag", $(call).parent().parent().siblings().children().children().data("flag"));
		
			 if ($(call).data("flag") == 1) {
				 $(call).data("flag", 2)
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 } else {
				 $(call).data("flag", 1)
				 // 다른 flag를 전부 1로
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 }
			 $("#tabs-1 > .content-area").remove();
			 ajaxList($sort, $(call).data("flag"));
	}
	
	// 정렬 함수 (검색)
	var searchSort = function(call) {
		var $sort = $(call).data("sort");
		
			 var $searchType = $("#y-searchType option:selected").val()
			 var $keyword = $("#y-keyword").val()
			 
			 if ($(call).data("flag") == 1) {
				 $(call).data("flag", 2)
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 } else {
				 $(call).data("flag", 1)
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
				 // 다른 flag를 전부 1로
			 }
			 $("#tabs-1 > .content-area").remove();
			 ajaxSearchList($searchType, $keyword, $sort, $(call).data("flag"));
	}
	

	// 상세 버튼 클릭
	$(document).on("click", ".move-detail", function() {
	    var windowW = 1000;  // 창의 가로 길이
	    var windowH = 700;  // 창의 세로 길이
	    var left = Math.ceil((window.screen.width - windowW)/2);
	    var top = Math.ceil((window.screen.height - windowH)/2);
		
		 window.open("detail.mn?no="+$(this).data("no")+ "&id=" + $(this).data("id"), "Detail", "top="+top+", left="+left+", height="+windowH+", width="+windowW);
	});
	
	// 삭제 버튼 클릭
	$(document).on("click", ".delete", function() {
		if (confirm($(this).data("id") + "회원을 탈퇴처리 하시겠습니까?") == true){ //확인
			location.href = "delete.mn?no=" + $(this).data("no");
			swal("탈퇴처리되었습니다.", "", "success")
		}else{   //취소
		    return;
		}
		//ajaxDeleteMember($(this).data("no"));
	});
</script>
</body>
</html>