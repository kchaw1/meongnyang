<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#create-user {
    margin: 15px 0 0 152px;
    margin-bottom: 20px;
    width: 60px;
    height: 30px;
    border-radius: 5px;
    font-size: 16px;
    color: white;
    background-color: rgb(65, 192, 142, 0.7);
    border-color: rgb(65, 192, 142, 0.7);
    font-family: 'Jua', sans-serif;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- activity css -->
<link rel="stylesheet" href="<c:url value="/resources/css/member/memo.css"/>">

<!--------------------------------- 아래부터 tab -------------->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<!-- hederfooter css -->
<link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">

</head>
<body>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div style="margin-top: 120px;">
    <div class="Tmemo">
        <span id="submemo">쪽지함</span>
    </div>
    <br>
    <div id="tabs">
        <ul style="border: 1px solid #dddddd; background:none;">
            <li id="recv"><a href="#tabs-1">받은쪽지함</a></li>
            <li><a href="#tabs-2">보낸쪽지함</a></li>
        </ul>
        <div id="tabs-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th><input id="checkall" type="checkbox" name="checkall" value="1"/></th>
                        <th>번호</th>
                        <th>보낸이</th>
                        <th>제목</th>
                        <th>받은날짜</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="msg" items="${msgrecvlist}">
                    <tr>
                        <td><input id="check1" type="checkbox" name="checkRow" value="1" /></td>
                        <td>${msg.msgNo}</td>
                        <td>${msg.sendId}</td>
                        <td>${msg.msgTitle}</td>
                        <td><fmt:formatDate value="${msg.readDate}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                   </c:forEach>
                </tbody>
            </table>
            <form id="searchForm">
                <div id="search">
                    <div class="search-group">
                        <select id="serchType" name="serchType" class="form-search">
                            <option value="0">선택</option>
                            <option value="1">제목</option>
                            <option value="2">내용</option>
                            <option value="3">제목+내용</option>
                        </select> <input type="text" id="keyword" name="keyword" class="form-search" placeholder="검색하세요" />
                        <button type="submit" id="searchBtn" class="searchBtn btn-default">검색</button>
                    </div>
                </div>
            </form>
            <div class="deleteBtn">
                <button type="button" id="delBtn">삭제</button>
            </div>
        </div>
        <div id="tabs-2">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th><input id="checkall2" type="checkbox" name="checkall2" value="1" /></th>
                        <th>번호</th>
                        <th>받는이</th>
                        <th>제목</th>
                        <th>보낸날짜</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="msg" items="${msgsendlist}">
                    <tr>
                        <td><input id="check5" type="checkbox" name="check" value="1" /></td>
                        <td>${msg.msgNo}</td>
                        <td>${msg.recvId}</td>
                        <td>${msg.msgTitle}</td>
                        <td><fmt:formatDate value="${msg.sendDate}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
            <form id="searchForm">
                <div id="search">
                    <div class="search-group">
                        <select id="serchType" name="serchType" class="form-search">
                            <option value="0">선택</option>
                            <option value="1">제목</option>
                            <option value="2">내용</option>
                            <option value="3">제목+내용</option>
                        </select> <input type="text" id="keyword" name="keyword" class="form-search" placeholder="검색하세요" />
                        <button type="submit" id="searchBtn" class="searchBtn btn-default">검색</button>
                    </div>
                </div>
            </form>
            <div class="deleteBtn">
                <button type="button" id="delBtn">삭제</button>
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>
    </div>
    <button id="create-user">쪽지쓰기</button>
		 <div id="dialog-form" title="Create new user">
			<form action="<c:url value="/msg/msgwrite.mn"/>" method="post">
				<fieldset>
					<div class="contents">
						<div class="memopop">
							<div id=sendId>${user.id}</div>
        					<input type="hidden" name="sendId" value="${user.id}" />
							<span>받는사람 : </span> <input type="text" name=recvId id="name" />
						</div>
						<hr>
						<span>제목 : </span> <input type="text" name="MsgTitle" id="title" />
						<hr>
						<div class="content">
							<textarea name="msgContent" placeholder="내용을 입력하세요." rows="15" cols="80" value=""></textarea>
						</div>
						<!-- <div class="check">
							<input id="check" type="checkbox" name="check" value="1" />
							<span id="check1">보낸 쪽지함에 저장<span id="check2">(보낸쪽지함에 저장하면수신 확인이 가능합니다.) </span></span>
						</div> -->
					</div>
				</fieldset>
			</form>
		</div> 
<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
<!-- <script>
$(document).ready(function(){
    //체크박스 전체 선탣&해제
    $('#checkall').click(function(){
         if($("#checkall").prop("checked")){
            $("input[name=check]").prop("checked",true); 
        }else{
            $("input[name=check]").prop("checked",false); 
        }
    });
</script> -->
<script>
$( function() {
    $( "#tabs" ).tabs({
    	collapsible: true
    });
  } );

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
})

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall2").click(function(){
        //클릭되었으면
        if($("#checkall2").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
    
    $('#delBtn').button().on("click", function(){
    	alert("안됨");
        if(confirm("삭제하시겠습니까?")){
            $("input[name=check]:checked").each(function(){
                var tr_value =$(this).val();
                var tr=$("tr[data-tr_value='"+tr_value+"']");
                tr.remove();
            });
        }else{
            return false;
        }
    });
})
</script>
<script>
  $( function() {
    var dialog, form;

 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 550,
      width: 650,
      modal: true,
      buttons: {
        "보내기": addmsg,
                    닫기: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
		//alert("1");
      }
    });
    
    function addmsg() {
    	alert("쪽지를 보냈습니다.");
    	$( "#dialog-form form" ).submit();
        dialog.dialog( "close" );
    }
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
});
  
  $("#recv").click(function () {
		$.ajax({
			url: "<c:url value='msgrecv.mn'/>",
			type: "post",
			success:function(result){
				console.log(result);
			}
			
		});
	});
</script>
</body>
</html>