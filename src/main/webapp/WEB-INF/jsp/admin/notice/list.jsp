<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="listCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<!-- start -->
	<div class="top-section">
                    <div class="main-image">
                    </div>
                    <div class="main-title">
                        <a href="<c:url value='/admin/notice/list.mn' />"><h1>공지사항</h1></a>
                    </div>
                </div>
                <div class="bottom-section">
                    <div class="section-one">
                        <div id="list-area">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td>글 번호</td>
                                        <td>제목</td>
                                        <td>작성자</td>
                                        <td>작성일</td>
                                        <td>조회수</td>
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                </tbody>
                            </table>
            
                            <div id="paging">
                               
                            </div>
                        </div>
                        
                            <div id="search">
                                 <select id="search-type" class="form-control">
                                     <option value="0">선택</option>
                                     <option value="1">제목</option>
                                     <option value="2">내용</option>
                                     <option value="3">제목+내용</option>
                                     <option value="4">작성일</option>
                                 </select> 
                                 <input type="text" id="keyword" class="form-control" placeholder="Search">
                                 <button type="button" id="search-button" class="btn btn-default">검색</button>
                            </div>
                        
                        <div id="button-area">
                            <div id="list-button-area"><button type="button" id="list-button" class="btn btn-default">전체글</button></div>
                            <c:if test="${user.type eq 3}">
                            	<div id="write-button-area"><button type="button" id="write-button" class="btn btn-default">글쓰기</button></div>
                            </c:if>
                        </div>
                    </div>
            
                </div>
	
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
	
	$(document).ready(function() {
		ajaxNoticeList(1, 0, "");
	})
	
	// 공지사항 리스트
	var ajaxNoticeList = function(pageNo, searchType, keyword) {
		$.ajax({
			url: "<c:url value='/admin/notice/noticeList.mn' />",
			type: "POST",
			data: {
					"pageNo": pageNo,	
					"searchType": searchType,	
					"keyword": keyword
				  }
		}).done(function(result) {
			console.log(result)
			
			var html = ""
			if(result.noticeList.length != 0) {
				for(var i in result.noticeList) {
					html += "<tr>"
								+ "<td>"+ result.noticeList[i].ntcNo +"</td>"
								+ "<td><a href='detail.mn?ntcNo="+ result.noticeList[i].ntcNo +"'>"+ result.noticeList[i].ntcTitle +"</a></td>"
								+ "<td>"+ result.noticeList[i].ntcWriter +"</td>"
								+ "<td>"+ result.noticeList[i].ntcRegDate +"</td>"
								+ "<td>"+ result.noticeList[i].ntcViewCnt +"</td>"
							+"</tr>"
				} // for
			} else {
				html +=   "<tr>"
					   	+ "<td colspan='5' style='font-size: 30px; color:gray;'>검색결과가 없습니다.</td>"
					   	+ "</tr>"
			}
			
			var paging = ""
			if(result.pageResult.count != 0) {
					paging += 	"<nav>"
								+ "<ul class='pagination'>"
					
					if(result.pageResult.prev == false) {
						paging += "<li class='disabled'>"
					} else {
						paging += "<li>"
					} // if-else
					paging += 	  "<a href='"+ (result.pageResult.beginPage-1) +"' aria-label='Previous'>"
								+ "<span aria-hidden='true'>&laquo;</span>"
								+ "</a>"
								+ "</li>"
					for(var i=result.pageResult.beginPage; i<=result.pageResult.endPage; i++) {
						if(i == result.pageResult.pageNo) {
							paging += "<li class='active'>"
						} else {
							paging += "<li>"
						} // if-else
						paging += "<a href='"+ i +"'>" + i + "</a>"
								  "</li>"
					} // for
					if(result.pageResult.next == false) {
						paging += "<li class='disabled'>"
					} else {
						paging += "<li>"
					} // if-else
					if(result.pageResult.endPage+1 == result.pageResult.lastPage+1) {
						paging += "<a href='last' aria-label='Next'>"		
					} else {
						paging += "<a href='"+ (result.pageResult.endPage+1) +"' aria-label='Next'>"						
					} // if-else	
					paging +=     "<span aria-hidden='true'>&raquo;</span>"
								+ "</a>"
								+ "</li>"
								+ "</ul>"
								+ "</nav>"
				} // if
			
			$("tbody").append(html);
			$("#paging").append(paging)
		}); // done();
	} // ajaxNoticeList()
	
	
	// 페이지 이동
	 $(document).on("click", "nav > ul.pagination > li > a", function(e) {
	   		e.preventDefault();
	   
	   		var pageNo = $(this).attr("href");
	   		var searchType = $("#search-type").val()
	   		var keyword = $("#keyword").val()
	   
	   		if (pageNo == 0 || pageNo == 'last') return false;
	   		
	   		console.log(pageNo)
	   		
	   		$("tbody").html("")
	   		$("div#paging").html("")
	   		
	   		ajaxNoticeList(pageNo, searchType, keyword)
   	 });
	
	// 검색버튼 클릭
	$(document).on("click", "#search-button", function () {
		
		var $searchType = $("#search-type").val()
   		var $keyword = $("#keyword").val()
   		
   		// 검증코드
		
		if($searchType == 0 && $keyword != "") {
    		swal("카테고리를 선택하세요","" ,"error");
 			return false;
    	}
 		if($searchType != 0 && $keyword  == "") {
 			swal("검색어를 입력해주세요","","error");
 			return false;
 		}
   		
   			$("tbody").html("")
	   		$("div#paging").html("")
		ajaxNoticeList(1, $searchType, $keyword)
	});
	
	// 전체글 버튼 클릭
	$("#list-button").click(function() {
		$("tbody").html("")
   		$("div#paging").html("")
		ajaxNoticeList(1, 0, "");
	})
	
	// 글쓰기 버튼 클릭
	$("#write-button").click(function() {
		if('${user.type}' != 3) {
			swal("관리자만 작성할 수 있습니다.", "" , "error")
		}
		location.href = "<c:url value='/admin/notice/writeForm.mn' />"
	})
	</script>
</body>
</html>