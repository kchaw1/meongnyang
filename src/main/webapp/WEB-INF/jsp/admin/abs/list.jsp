<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="absListCSSJS.jsp" />
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
        <div class="avatar"><a href="<c:url value='/admin/main.mn' />"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a></div>
        <br>
        <div class="log-out">A D M I N</div>
        <div class="seperator"></div>
        <div class="list">
	         <div id="board" class="item">게시판</div>
	         <div class="board-hidden notice"><a href="<c:url value="/notice/list.mn" />">공지사항</a></div>
	         <div class="board-hidden youtube"><a href="<c:url value="/youtube/youtube.mn" />">유튜브</a></div>
	         <div class="board-hidden crowd-fund"><a href="<c:url value="/crowd/list.mn" />">크라우드펀딩</a></div>
	         <div id="management" class="item">관리</div>
	         <div class="mgm-hidden abs-member"><a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a></div>
	         <div class="mgm-hidden gen-member"><a href="<c:url value="/admin/general/list.mn" />">일반회원</a></div>
	         <div id="statistics" class="item"><a href="<c:url value="/admin/statistics/day.mn" />" style="color:black;">통계</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">Management > ABS</div>
        <div class="main-title">행동전문가</div>
        <div class="seperator"></div>
        <div class="tabs">
          <ul>
            <li><a href="#tabs-1">행동전문가</a></li>
            <li><a href="#tabs-4">승인대기중</a></li>
          </ul>
          <div id="tabs-1">
            <h2>목록</h2>
            <div class="search-area">
            	<div class="select-area">
              	  	<select id="y-searchType" class="form-control">
							<option value="0">선택</option>
							<option value="1">아이디</option>
							<option value="2">이름</option>
							<option value="3">가입일</option>
							<option value="4">최근접속일</option>
							<option value="5">활동점수</option>
							<option value="6">포인트</option>
					</select>
              	  </div>	 
                <div class="search">
                  <input type="text" id="y-keyword" name="name" class="form-control" placeholder="검색어를 입력하세요">
                </div>
                &nbsp;
                <div class="btn-area">
                  <button type="button" id="searchYBtn" class="btn btn-default">검색</button>
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
            </div>
            <div class="clear-fix"><hr></div>
             
          </div>
          <div id="tabs-4">
            <div>
              <h2>목록</h2>
              <div class="search-area">
              	  <div class="select-area">
              	  	<select id="n-searchType" class="form-control">
							<option value="0">선택</option>
							<option value="1">아이디</option>
							<option value="2">이름</option>
							<option value="3">가입일</option>
							<option value="4">최근접속일</option>
							<option value="5">활동점수</option>
							<option value="6">포인트</option>
					</select>
              	  </div>	 
                  <div class="search">
                  	<input type="text" id="n-keyword" name="name" class="form-control" placeholder="검색어를 입력하세요">
                  </div>
                  &nbsp;
                  <div class="btn-area">
                  	<button type="button" id="searchNBtn" class="btn btn-default">검색</button>
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
              <div class="clear-fix"><hr></div>
                  
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
	// 쉼표
    function inputNumberFormat(obj) {
      obj.value = comma(uncomma(obj.value));
    }

    function comma(str) { 
        str = String(str); 
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
    } 

    function uncomma(str) { 
        str = String(str); 
        return str.replace(/[^\d]+/g, ''); 
    }
	</script>
	
	<script>
	
	$(document).ready(function () {
		      ajaxYList(1, 1);
		      ajaxNList(1, 1);
		      $("#management").addClass("selected");
			  $(".mgm-hidden").toggle();
			  $(".abs-member").css("font-weight", "bold");
	})

	//좌측 메뉴 스크립트
	$("#board").hover(function () {
	  $(this).addClass("selected");
	 })
	
	$("#board").click(function () {
	  $(".board-hidden").slideToggle(500);
	})
	
	$("#management").hover(function () {
		$(this).addClass("selected");
	})
	$("#management").click(function () {
	  $(".mgm-hidden").slideToggle(500);
	})
	
	$("#statistics").hover(function () {
	  $(this).addClass("selected");
	})
	
	$(".item").mouseleave(function () {
	  $(this).removeClass("selected");
	})
	
	var ajaxYList = function(sort, flag) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/printYList.mn'/>",
       		type: "POST",
       		data: {
       				"sort" : sort,
       				"flag" : flag
       			  }
        }).done(function (result) {
	    	   console.log(result)
	    	   
	    	   var html ="";
	    	   for(var i in result.yList) {
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.yList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.yList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.yList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ moment(result.yList[i].signUpDate).format("YY.MM.DD HH:mm:ss") +"</div>"
			            +  "<div class='recent-area'>" 
			            if(result.yList[i].loginDateTime==null) {
			            	html +=	"로그인 내역 없음."
			            } else {
				            html += moment(result.yList[i].loginDateTime).format("YY.MM.DD HH:mm:ss") 
			            }
			   html +=     "</div>"
			            +  "<div class='active-area'>"+ comma(result.yList[i].score) +"</div>"
			            +  "<div class='point-area'>"+ comma(result.yList[i].point) +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no=" + result.yList[i].no + " data-id='" + result.yList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.yList[i].no + " data-id='" + result.yList[i].id + "'>탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-1").append(html);			          
        });
	} // ajaxYList
	
	var ajaxNList = function(sort, flag) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/printNList.mn'/>",
    	   type: "POST",
      		   data: {
	       				"sort" : sort,
	       				"flag" : flag
	       			  }
        }).done(function (result) {
	    	   console.log(result)
	    	   var html ="";
	    	   for(var i in result.nList) {
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.nList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.nList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.nList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ moment(result.nList[i].signUpDate).format("YY.MM.DD HH:mm:ss") +"</div>"
			            +  "<div class='recent-area'>"
			            if(result.nList[i].loginDateTime==null) {
			            	html +=	"로그인 내역 없음."
			            } else {
				            html += moment(result.nList[i].loginDateTime).format("YY.MM.DD HH:mm:ss") 
			            }
			   html +=     "</div>"
			            +  "<div class='active-area'>"+ comma(result.nList[i].score) +"</div>"
			            +  "<div class='point-area'>"+ comma(result.nList[i].point) +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no=" + result.nList[i].no + " data-id='" + result.nList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.nList[i].no + " data-id='" + result.nList[i].id + "'>탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-4").append(html);			          
        });
	} // ajaxNList
	
	var ajaxYSearchList = function(searchType, keyword, sort, flag) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/ySearch.mn'/>",
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
	    	   for(var i in result.searchYList) {
	    		   
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.searchYList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.searchYList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.searchYList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ moment(result.searchYList[i].signUpDate).format("YY.MM.DD HH:mm:ss") +"</div>"
			            +  "<div class='recent-area'>"
			            if(result.searchYList[i].loginDateTime==null) {
			            	html +=	"로그인 내역 없음."
			            } else {
				            html += moment(result.searchYList[i].loginDateTime).format("YY.MM.DD HH:mm:ss") 
			            }
			   html +=     "</div>"
			            +  "<div class='active-area'>"+ comma(result.searchYList[i].score) +"</div>"
			            +  "<div class='point-area'>"+ comma(result.searchYList[i].point) +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no=" + result.searchYList[i].no + " data-id='" + result.searchYList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.searchYList[i].no + " data-id='" + result.searchYList[i].id + "'>탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-1").append(html);			          
        });
	} // ajaxYSearchList
	
	var ajaxNSearchList = function(searchType, keyword, sort, flag) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/nSearch.mn'/>",
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
	    	   for(var i in result.searchNList) {
	    		   
		       html +=     "<div class='content-area'>"
		    	    +  "<div class='no-area'>"+ result.searchNList[i].no +"</div>"
		    	    +  "<div class='id-area'>"+ result.searchNList[i].id +"</div>"
		            +  "<div class='name-area'>"+ result.searchNList[i].name +"</div>"
		            +  "<div class='sign-area'>"+ moment(result.searchNList[i].signUpDate).format("YY.MM.DD HH:mm:ss") +"</div>"
		            +  "<div class='recent-area'>"
			            if(result.searchNList[i].loginDateTime==null) {
			            	html +=	"로그인 내역 없음."
			            } else {
				            html += moment(result.searchNList[i].loginDateTime).format("YY.MM.DD HH:mm:ss") 
			            }
		   html +=     "</div>"
		            +  "<div class='active-area'>"+ comma(result.searchNList[i].score) +"</div>"
		            +  "<div class='point-area'>"+ comma(result.searchNList[i].point) +"</div>"
		            +  "<button class='btn btn-default btn-sm move-detail' data-no=" + result.searchNList[i].no + " data-id='" + result.searchNList[i].id + "'>상세</button> "
		            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.searchNList[i].no +">탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-4").append(html);			          
        });
	} // ajaxNSearchList
	
	/*
	var ajaxDeleteMember = function(no) {
				$.ajax ({
					url: "<c:url value='/admin/abs/delete.mn'/>",
			    	   type: "POST",
		       		   data: "no=" + no
				}).done(function(result) {
					ajaxYList(pageNo);
				})
	} // ajaxDeleteMember
	*/
	
	
	// 승인페이지에서 검색
	$("#searchYBtn").click(function() {
		if($("#y-searchType").val() == 0 && $("#y-keyword").val() != "") {
    		swal("카테고리를 선택하세요","" ,"error");
 			return false;
    	}
 		if($("#y-searchType").val() != 0 && $("#y-keyword").val() == "") {
 			swal("검색어를 입력해주세요","","error");
 			return false;
 		}
		
		
		var $searchType = $("#y-searchType option:selected").val()
		var $keyword = $("#y-keyword").val()
		
		console.log($searchType)
		console.log($keyword)
		
		if($searchType == 0) { // 셀렉트가 '선택' 으로 되어있을경우
			$("#tabs-1 > .content-area").remove();
			ajaxYList(1,1)
			$("#tabs-1 i").data("search", "n")
			return;
		}
		
		$("#tabs-1 > .content-area").remove();
		ajaxYSearchList($searchType, $keyword, 1,1);
		$("#tabs-1 i").data("search", "y")
	})
	
	// 미승인페이지에서 검색
	$("#searchNBtn").click(function() {
		if($("#n-searchType").val() == 0 && $("#n-keyword").val() != "") {
    		swal("카테고리를 선택하세요","" ,"error");
 			return false;
    	}
 		if($("#n-searchType").val() != 0 && $("#n-keyword").val() == "") {
 			swal("검색어를 입력해주세요","","error");
 			return false;
 		}
		
		var $searchType = $("#n-searchType option:selected").val()
		var $keyword = $("#n-keyword").val()
		
		if($searchType == 0) { // 셀렉트가 '선택' 으로 되어있을경우
			$("#tabs-4 > .content-area").remove();
			ajaxNList(1,1)
			$("#tabs-4 i").data("search", "n")
			return;
		}
		
		$("#tabs-4 > .content-area").remove();
		ajaxNSearchList($searchType, $keyword, 1,1);
		$("#tabs-4 i").data("search", "y")
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
	
	// 정렬 함수 
	var sort = function(call) {
		var $sort = $(call).data("sort");
		
		 if($(call).closest("div#tabs-1").length == 1) {
			 if ($(call).data("flag") == 1) {
				 $(call).data("flag", 2)
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 } else {
				 $(call).data("flag", 1)
				 // 다른 flag를 전부 1로
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 }
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList($sort, $(call).data("flag"));
		 } else {
			 if ($(call).data("flag") == 1) {
				 $(call).data("flag", 2)
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 } else {
				 $(call).data("flag", 1)
				 // 다른 flag를 전부 1로
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 }
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList($sort, $(call).data("flag"));
		 }
	}
	
	// 정렬 함수 (검색)
	var searchSort = function(call) {
		var $sort = $(call).data("sort");
		
		 if($(call).closest("div#tabs-1").length == 1) {
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
			 ajaxYSearchList($searchType, $keyword, $sort, $(call).data("flag"));
		 } else {
			 var $searchType = $("#n-searchType option:selected").val()
			 var $keyword = $("#n-keyword").val()
			 
			 if ($(call).data("flag") == 1) {
				 $(call).data("flag", 2)
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 } else {
				 $(call).data("flag", 1)
				 // 다른 flag를 전부 1로
				 $(call).parent().parent().siblings().children().children().data("flag", "1")
			 }
			 $("#tabs-4 > .content-area").remove();
			 ajaxNSearchList($searchType, $keyword, $sort, $(call).data("flag"));
		 }
	}
	
	// 상세 버튼 클릭
	$(document).on("click", ".move-detail", function() {
	    var windowW = 1200;  // 창의 가로 길이
        var windowH = 700;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		
		 window.open("detail.mn?no="+$(this).data("no")+ "&id=" + $(this).data("id"), "Detail", "top="+top+", left="+left+", height="+windowH+", width="+windowW);
	});
	
	// 삭제 버튼 클릭
	$(document).on("click", ".delete", function() {
		
		var no = $(this).data("no")
		
		swal({
			  title: "탈퇴 처리 하시겠습니까??",
			  text: "탈퇴된 회원정보는 복구할 수 없습니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			}).then((willDelete) => {
			  if (willDelete) {
			    swal("탈퇴처리되었습니다.", {
			      icon: "success",
			    });
				setTimeout(function() { location.href = "delete.mn?no=" + no; }, 1000)
			  } else {
			    swal("취소되었습니다.");
			  }
			});
	});
	</script>
</body>
</html>