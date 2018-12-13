<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp" />
<c:import url="../admin/adminCommonCSSJS.jsp" />
<c:import url="listCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../common/header.jsp" />
	</div>
	
	<!-- start -->

  <div id="container">
    <div class="panel">
      

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">Board > Youtube</div>
        <div class="main-title">최신동영상</div>
        <div class="seperator"></div>
        
        <ul class="todo-list" style="display:none;">
        </ul>

        <div id="youtube-area" style="margin-top:10px; width:100%;">
        
        </div>

      </div>
      <!-- /우측 콘텐츠 영역 view-->
    </div>
    <!-- /pannel-->
    <div class="clear-fix"></div>
  </div>
  <!-- /pannel-->
  
	
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../common/footer.jsp" />
	</div>
  <script>
    $(document).ready(function () {
      ajaxList();
    })
    
    var ajaxList = function() {
    	 $.ajax({
       	  url: "<c:url value='/youtube/keywordList.mn'/>",
       	  type: "POST",
         }).done(function(result) {
        	 console.log(result)
        	 
        	 var randomArr = new Array();
        	 
        	 for(var i in result) {
       	  		  var html = ""; 
       	  		  var randomStr = randomString();
       	  		  
       	  		  if($('li.todo').text().indexOf(result[i].ytbKeyword) == -1) {
	       	  		  
	       	  		  randomArr.push(randomStr);
	       	  		  
	       	  		  console.log(randomStr)
	       	  		  
	       	  		  var $newListItem = $('<li class="todo">' + result[i].ytbKeyword + '</li>');
					  
	       	          // Add list item to end of list
	      	          $('.todo-list').append($newListItem);
       	  		  }
      	          
       	  		  
       	  		if($('div.content-title').text().indexOf(result[i].ytbKeyword) == -1) {
		         	html =  "<div class="+ randomStr +" style='margin-bottom: 50px;'>"
				              + "<div class='content-title'><h1>" + result[i].ytbKeyword + "</h1></div>" 
				              + "</div>"
				              
       	  		}
       	  		
       	  	 	$("#youtube-area").append(html);
			       
       	  	} // for
       	  		
       	  	for(var j=0; j<=randomArr.length; j++) {
       	  		
       	  	console.log($('div.' + randomArr[j]).text())
       	  		
       	  		for(var i in result) {
       	  			console.log(result[i].ytbKeyword)
       	  			
       	  			if($('div.' + randomArr[j]).text() == result[i].ytbKeyword) {
		        	 	var html = "<iframe type='text/html' style='padding:10px; margin-right:10px; border:5px dotted red;' width='24%' height='240' src='"+ result[i].ytbURL +"' allowfullscreen='allowfullscreen' frameborder='0'>"
		    	  		
		    	  		$("div." + randomArr[j]).append(html);
       	  			}
       	  		} // inner for	
       	  	} // for
    	});
    }

  </script>

  <script>
  // 랜덤 문자열 생성
    function randomString() {
        var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
        var string_length = 8;
        var randomstring = '';
        for (var i=0; i<string_length; i++) {
        var rnum = Math.floor(Math.random() * chars.length);
        randomstring += chars.substring(rnum,rnum+1);
      }
      //document.randform.randomfield.value = randomstring;
      return randomstring;
    }
  </script>
</body>
</html>