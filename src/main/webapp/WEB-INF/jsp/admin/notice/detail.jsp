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
<c:import url="detailCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>

	<!-- start -->
	<div id="notice-area">
		<div class="top-section">
			<div class="main-title">
				<a href="<c:url value='/admin/notice/list.mn' />"><h1>공지사항</h1></a>
			</div>
		</div>

		<div class="bottom-section">
			<div class="section-one">
				<div class="panel panel-default" style="text-align: left;">
					<div class="panel-heading">
						<span class="panel-title" style="font-size:25px; margin-bottom:10px; text-align: left; font-weight: bold;">${ntc.ntcTitle}</span>
						<br>
						<div id="writer" style="display: inline-block;">
							<h3 class="panel-title">${ntc.ntcWriter}
								&nbsp&nbsp&nbsp<span id="reg_time"><fmt:formatDate value="${ntc.ntcRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
							</h3>
						</div>
						<div id="detail_info" style="float: right;">
							<span id="view_cnt">조회수 ${ntc.ntcViewCnt}</span>
						</div>
					</div>
					<div class="panel-body">
						<div id="file-list">
							<table>
								<tbody>
									<tr>
										<th>첨부 파일</th>
										<c:forEach var="f" items="${fileList}">
											<td><a href="<c:url value="/common/download.mn?sysName=${f.ntcfSysName}&path=${f.ntcfPath}&oriName=${f.ntcfOriName}"/>">${f.ntcfOriName}</a></td>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</div>
						<hr>
						${ntc.ntcContent}
					</div>
				</div>
				<div id="button-area">
					<div id="left-area">
						<button type="button" id="list-button" class="btn btn-default">목록</button>
					</div>
					<div id="right-area">
						<button type="button" id="update-button" data-writer="${ntc.ntcWriter}" class="btn btn-default">수정</button>
						&nbsp;
						<button type="button" id="delete-button" data-writer="${ntc.ntcWriter}" class="btn btn-default">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end -->

	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
		$("#list-button").click(function() {
			location.href = "list.mn";
		});
		
		$("#update-button").click(function() {
			if('${user.id}' != $(this).data("writer")) {
				swal("작성자만 수정할 수 있습니다", "", "error");
				return;
			}
			
			location.href = "updateForm.mn?ntcNo=" + '${ntc.ntcNo}';
		});
		
		$("#delete-button").click(function() {
			if('${user.id}' != $(this).data("writer")) {
				swal("작성자만 삭제할 수 있습니다", "", "error");
				return;
			}
			
			location.href = "delete.mn?ntcNo=" + '${ntc.ntcNo}';
		})
	</script>
</body>
</html>



