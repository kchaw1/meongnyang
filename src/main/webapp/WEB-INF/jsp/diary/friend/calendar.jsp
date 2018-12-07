<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp"/>
<c:import url="./friendcalendarCSSJS.jsp"/>
</head>
<body>
<c:import url="../../common/header.jsp"/>
  <div id="title">
  <div class="kuro">
  <div class="head">
    <div class="eyes">
      <div class="eye"></div>
      <div class="eye"></div>
    </div>
  </div> <!-- !.head -->
  <div class="ears">
    <div class="ear"></div>
    <div class="ear"></div>
  </div>
  <div class="body"></div>
  <div class="tail"></div>
</div> <!-- !.kuro -->
  	<!-- <span id="userid">victory </span> <span class="s">'s</span></span> <span class="fixdiary">Diary</span> -->
  </div>
  <div class="top-section">
    <div id="calendar">
      <div class="year"></div>
      <div class="month">
        <ul class="months">
          <li><a href="#1" class="prev"> << </a></li>
          <li><a href="#1" title="Jan" data-value="01">Jan</a></li>
          <li><a href="#1" title="Feb" data-value="02">Feb</a></li>
          <li><a href="#1" title="Mar" data-value="03">Mar</a></li>
          <li><a href="#1" title="Apr" data-value="04">Apr</a></li>
          <li><a href="#1" title="May" data-value="05">May</a></li>
          <li><a href="#1" title="Jun" data-value="06">Jun</a></li>
          <li><a href="#1" title="Jul" data-value="07">Jul</a></li>
          <li><a href="#1" title="Aug" data-value="08">Aug</a></li>
          <li><a href="#1" title="Sep" data-value="09">Sep</a></li>
          <li><a href="#1" title="Oct" data-value="10">Oct</a></li>
          <li><a href="#1" title="Nov" data-value="11">Nov</a></li>
          <li><a href="#1" title="Dec" data-value="12">Dec</a></li>
          <li><a href="#1" class="next"> >> </a></li>
        </ul>
      </div>
      <div id="calendarContent">
        <div class="yoil">
          <ul class="yoils">
            <li>일</li>
            <li>월</li>
            <li>화</li>
            <li>수</li>
            <li>목</li>
            <li>금</li>
            <li>토</li>
          </ul>
        </div>
        <hr>
        <div class="date">
          
        </div>
      </div>
    </div> 

    </div> 
  </div>
  <!-- 다이어리 모달-->
  <c:import url="../list.jsp"/>
  <!--모달-->
  <c:import url="../../common/footer.jsp"/>
<c:import url="../calendarJS.jsp"/>
<script>
	$("button#submit").click(function (){
		let drDate = $("input[name='drDate']").val().toString()
		drDate = drDate.replace(".","").replace(".","");
		let drYear = drDate.substr(0,4);
		let drMonth = drDate.substr(4,2);
		let drDay = drDate.substr(6,2);
		let now = new Date(drYear, (drMonth-1), drDay);
		console.log(now)
		let checked = $("input[type='radio']:checked");
		let title = $("input[name='drTitle']");
		let content = $("textarea[name='drContent']");
		//alert(content)
		//alert(radio)
		//alert($("input[type='radio']:checked").val())
		//alert($("input[name='drDate']").val())
	 	$.ajax({
			url : "<c:url value='/diary/write.mn' />",
			data : {
				"drDate" : drDate,
				"drShare" : checked.val(),
				"drTitle" : title.val(),
				"drContent" : content.val()
			},
			type : "POST"
	 	}).done(function(map){
	 		swal({
				  type: 'success',
				  title: '일기가 저장되었습니다.',
				  showConfirmButton: false,
				  timer: 1500
			})
	 		
	 		title.val("");
	 		$("div.note-editable").html("");
	 		$("input#all").prop("checked", true)
	 		checked.attr("checked", false);
	 		$(".months li").find("a[data-value="+drMonth+"]").removeClass("selected")
	 		makeCalendar(now, map)
	 	})
	})//click
</script>
</body>
</html>