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
                                        <td>조회수</td>
                                        <td>작성일</td>
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                </tbody>
                            </table>
            
                            <div id="paging">
                                <c:if test="${pageResult.count != 0}">
                                    <nav>
                                    <ul class="pagination">
                                        <li
                                            <c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
                                            <a href="${pageResult.beginPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                        	</a>
                                        </li>
                                        <c:forEach var="i" begin="${pageResult.beginPage}"
                                            end="${pageResult.endPage}">
                                            <li <c:if test="${i eq pageResult.pageNo}">class="active"</c:if>>
                                                <a href="${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li
                                            <c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
                                            <a href="${pageResult.endPage + 1}" aria-label="Next"> 
                                            	<spanaria-hidden="true">&raquo;</span>
                                        	</a>
                                        </li>
                                    </ul>
                                    </nav>
                                </c:if>
                            </div>
                        </div>
                        <form action="gb_search.cf" method="POST" id="searchForm" class="navbar-form navbar" role="search">
                            <div id="search">
                                <div class="form-group">
                                    <select id="searchType" name="searchType" class="form-control">
                                        <option value="0">선택</option>
                                        <option value="1">제목</option>
                                        <option value="2">내용</option>
                                        <option value="3">제목+내용</option>
                                    </select> <input type="text" id="keyword" name="keyword"
                                        class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" id="searchBtn" class="btn btn-default">검색</button>
                            </div>
                        </form>
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
		ajaxNoticeList(1);
	})
	
	// 공지사항 리스트
	var ajaxNoticeList = function(pageNo) {
		$.ajax({
			url: "<c:url value='/admin/notice/noticeList.mn' />",
			type: "POST",
			data: "pageNo=" + pageNo,
		}).done(function(result) {
			console.log(result)
			
			var html = ""
			for(var i in result.noticeList) {
				html += "<tr>"
							+ "<td>"+ result.noticeList[i].ntcNo +"</td>"
							+ "<td>"+ result.noticeList[i].ntcTitle +"</td>"
							+ "<td>"+ result.noticeList[i].ntcWriter +"</td>"
							+ "<td>"+ result.noticeList[i].ntcViewCnt +"</td>"
							+ "<td>"+ result.noticeList[i].ntcRegDate +"</td>"
						+"</tr>"
			}
			$("tbody").append(html);
		});
	} // ajaxNoticeList()
	
	// 페이지 이동
	 $("nav > ul.pagination > li > a").click(function(e) {
        		// 기본 이벤트 막기...
        		e.preventDefault();
        		
        		var pageNo = $(this).attr("href");
//         		alert(pageNo)
        		if (pageNo == 0 || pageNo == '${pageResult.lastPage+1}') return false;
        		
//         	 	location.href = "gb_board.cf?pageNo=" + pageNo;
        	});
	</script>
</body>
</html>