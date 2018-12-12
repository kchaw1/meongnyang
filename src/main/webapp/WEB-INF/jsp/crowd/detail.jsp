<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp" />
<c:import url="../admin/adminCommonCSSJS.jsp" />
<c:import url="detailCSSJS.jsp" />

</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../common/header.jsp" />
	</div>
	<fmt:formatNumber var="goalMoney" value="${detail.crGoalMoney}" pattern="#,###,###,###"/>
	<fmt:formatNumber var="nowMoney" value="${detail.crNowMoney}" pattern="#,###,###,###"/>
	<!-- start -->
	  <div id="detail-container">
      
      <!-- 우측 콘텐츠 영역-->
          <div id="content-container">
	          <div class="main-title"><h1><a href="<c:url value='/crowd/list.mn'/>">크라우드 펀딩</a></h1></div>
	          	<div id="content-wrapper">
	          		<div id="cf-img"><img style="border-radius: 10%;" src="<c:url value='/common/download.mn?sysName=${detail.crFileName}&path=${detail.crFilePath}&oriName=${detail.crFileOriName}'/>" /></div>
	          			<div id="content-area1">
		           			<div id="cf-title" style="margin-bottom:30px;"><h1>${detail.crTitle}</h1></div>
		            	    <div id="content1">
		              			<span><h2>현재: <span id="now-money">${nowMoney} 원</span></h2></span>
		             			<span id="goal-span">(목표: <span id="goal-money">${goalMoney}</span>원)</span>
		             			<button type="button" id="heart-btn" class="btn btn-default btn-lg">
		             				<c:choose>
		             					<c:when test="${likeCheck eq 0 || likeCheck eq null}">
		             						<i class="far fa-heart"></i>
		             					</c:when>
		             					<c:otherwise>
		             						<i class="fas fa-heart"></i>
		             					</c:otherwise>	
		             				</c:choose>
			                  		<span id="like-count">${detail.crLikeCnt}</span>
		              			</button>
		              		</div>
				            <div class="progress">
		                      <fmt:parseNumber var="progress" value="${(detail.crNowMoney/detail.crGoalMoney*100)-((detail.crNowMoney/detail.crGoalMoney*100)%1)}" integerOnly="true"/>
				                <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" 
				                <c:choose>
				                	<c:when test="${progress gt 100}">style="width: 100%;"</c:when>
				                	<c:otherwise>style="width: ${progress}%;"</c:otherwise>
				                </c:choose>> <!-- /div -->
				                      <c:choose>
					                      <c:when test="${progress eq 0}">
					                      </c:when>
					                      <c:otherwise>
					                      	${progress} %
					                      </c:otherwise>
				                      </c:choose>
				                 </div>
				            </div>
		              		<div id="remain-days">
		                		<h2>남은일시:</h2>&nbsp;&nbsp;&nbsp;<span id="countDown"></span>
<%-- 		                		<h2><span class="remain-days">${remainDays} 일</span></h2> --%>
		              		</div>
		              		<div id="end-day">
		               			 <h2>마감 날짜:</h2>
		               			 <h2><span class="end-day">${detail.crEndDay}</span></h2>
		             		</div>
		             		
		            		<div id="my-point">
		            		  <span>
		            		  	<c:if test="${myPoint ne null}">
		            		  		<fmt:formatNumber var="myPoint" value="${myPoint}" pattern="#,###,###,###"/>
		            		   		보유포인트: ${myPoint} 원
		            		   	</c:if>	
		            		  </span>
		            		</div>
		              		<div id="donate-area">
		            		  <input class="form-control" type="text" placeholder="기부 금액을 입력하세요"  id="recycle_result_amt" value="" onkeyup="inputNumberFormat(this)" />
		            		  <button type="button" id="initialize" class="btn btn-default btn-default">초기화</button>
		            		</div>
		            		 
	            		</div>
	          </div>
	          <div class="clear-fix"></div>
	          <hr>
	          <div id="content-area2">
	             ${detail.crContent}
	              <div style="width:10%; margin:0 auto;">
           		  	<button id="donate" type="button" class="btn btn-default btn-lg">기부하기</button>
           		  </div>
	          </div>
	          <div id="button-area">
	          		<button type="button" id="list-btn" class="btn btn-default btn-default">목록</button>
	          		<c:if test="${user.type eq 3}">
	                <button type="button" id="update-btn" class="btn btn-default btn-default">수정</button>
	                <button type="button" id="delete-btn" class="btn btn-default btn-default">삭제</button>
	                </c:if>
	          </div>
	          <div class="panel-footer">댓글 목록</div>
	          <div class="panel-body">
	              <div id="cmt_container">
	                  <ul id="cmt_list">
	                    <!-- 댓글 들어가는부분 -->
	                  </ul> 
	              </div>
	          </div>
	    </div>
	</div>
      
    <!-- /우측 콘텐츠 영역-->
    <div class="clear-fix"></div>
    <!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../common/footer.jsp" />
	</div>
	
	<script>
	// 금액 쉼표
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
		$(document).ready(function() {
			commentList();	
			parse('${detail.crEndDay}')
		})
	
		// 초기화 버튼 클릭
		$("#initialize").click(function() {
			$("#recycle_result_amt").val("");
		});
		
		// 기부하기 버튼 클릭
		$("#donate").click(function() {
			var donateMoney = parseInt(removeComma($("#recycle_result_amt").val()))
			// 비로그인이면 return false;
			if('${user.id}' == '') {
				swal("로그인을 먼저 해주세요.", "", "error")
				return;
			}
			// if 보유포인트가 부족하면 return false;
			if('${myPoint}' < donateMoney) {
				swal("보유포인트가 모자랍니다.", "", "error")
				return;
			}
			// 값을 입력안했을시 
			if($("#recycle_result_amt").val()=="") {
				swal("기부금액을 입력해주세요","","error")
				return;
			}
			
		    swal("기부되었습니다.", "", "success");
		    
		    commentList();
		    
		    setTimeout(function() {
		    	location.href="donate.mn?donateMoney=" + donateMoney + "&crNo=" + ${detail.crNo} + "&no=" + ${user.no} + "&crcWriter=" + '${user.id}' + "&crcContent=" + '${user.id}' + "님이 후원합니다." 
			}, 1000)
		    
		});
		
		 // 댓글 리스트 함수
        var commentList = function() {
        	  $.ajax({
	            	url: "<c:url value='/crowd/commentList.mn'/>",
	            	type: "POST",
	            	data: "crNo=${detail.crNo}"
	            }).done(function (result) {
	            	console.log(result)
	            	
	            	var commentList = result.commentList;
	            	
	            	$("ul#cmt_list").html("");
	            	for(let i in commentList) {
		            	$("ul#cmt_list").append(
		            		 "<li>"
                            +      "<div class='cmt_nickbox'>" + commentList[i].crcWriter + "</div>"
		            		+	   "<div class='cmt_box'>" 
                            +      "<div class='cmt_txtbox' data-writer=" + commentList[i].crcWriter + " data-no=" + commentList[i].crNo + ">" + commentList[i].crcContent + "</div>"
                            +	   "</div>"	
                            +	   "</div>" 
                            +      "<div class='cmt_reg'>" + commentList[i].crcRegDate + "</div>"
                            +"</li>"
		            	);
	            	}
	            });
        };
	
		// 좋아요 버튼 클릭
		$(document).on("click", "#heart-btn", function() {
			if('${user.id}' == '') {
				swal("로그인을 먼저 해주세요", "", "error")
				return;
			}
			
			console.log($(this).children().eq(0))
			
			  if($(this).children().eq(0).attr("class")=="far fa-heart") {
		        $("i.far").removeClass();
		        $(this).children().eq(0).addClass("fas fa-heart");
		        ajaxLike(false)
		        swal("좋아요")
		      } else {
		        $("i.fas").removeClass();
		        $(this).children().eq(0).addClass("far fa-heart");
		        ajaxLike(true)
		        swal("좋아요 취소")
		      }
	    });
		
		// 수정 버튼 클릭
		$("#list-btn").click(function() {
			location.href = "list.mn"
		});
		
		// 수정 버튼 클릭
		$("#update-btn").click(function() {
			location.href = "updateForm.mn?crNo=" + '${detail.crNo}'
		});
		
		// 삭제 버튼 클릭
		$("#delete-btn").click(function() {
			location.href = "delete.mn?crNo=" + '${detail.crNo}'
		});
		
		// 좋아요 ajax
		ajaxLike = function(check) {
			var url=""
			if(check==false) {
				url = "likeUp.mn"
			} else {
				url = "likeDown.mn"
			}
			
			$.ajax({
				url: url,
				type: "POST",
				data: {
						"crNo": '${detail.crNo}',
						"crId": '${user.id}'
					  } 
			}).done(function(result){
				console.log(result)
				$("#like-count").text(result)
			});
		}
	</script>
	
	<script>
	function parse(str) {
	    var y = str.substr(0, 4);
	    var m = str.substr(5, 2);
	    var d = str.substr(8, 2);
	    var h = str.substr(11, 2);
	    var mm = str.substr(14, 2);
	    
	      $('#countDown').revolver({
	         year : y,
	         month : m,
	         day : d,
	         hours: h,
	         minutes: mm
	       });
	}
	
	
	
	</script>
</body>
</html>