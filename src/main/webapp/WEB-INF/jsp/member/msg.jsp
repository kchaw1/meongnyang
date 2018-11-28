<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<c:import url="../common/header.jsp" />
<div style="margin-top: 120px;">
    <div class="Tmemo">
        <span id="submemo">쪽지함</span>
    </div>
    <br>
    <div id="tabs">
        <ul style="border: 1px solid #dddddd; background:none;">
            <li><a href="#tabs-1">받은쪽지함</a></li>
            <li><a href="#tabs-2">보낸쪽지함</a></li>
        </ul>
        <div id="tabs-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th><input id="checkall" type="checkbox" name="checkall" value="1" /></th>
                        <th>번호</th>
                        <th>보낸이</th>
                        <th>제목</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input id="check1" type="checkbox" name="check" value="1" /></td>
                        <td>1</td>
                        <td>김병관</td>
                        <td>~~안녕하세요</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check2" type="checkbox" name="check" value="1" /></td>
                        <td>2</td>
                        <td>김차원</td>
                        <td>환영합니다.</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check3" type="checkbox" name="check" value="1" /></td>
                        <td>3</td>
                        <td>이현규</td>
                        <td>환영합니다.</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check4" type="checkbox" name="check" value="1" /></td>
                        <td>4</td>
                        <td>박아란</td>
                        <td>환영합니다.</td>
                        <td>2018.11.21</td>
                    </tr>
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
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input id="check5" type="checkbox" name="check" value="1" /></td>
                        <td>1</td>
                        <td>관리자</td>
                        <td>안녕하세요.</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check6" type="checkbox" name="check" value="1" /></td>
                        <td>2</td>
                        <td>김병관</td>
                        <td>~~안녕하세요</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check7" type="checkbox" name="check" value="1" /></td>
                        <td>3</td>
                        <td>김차원</td>
                        <td>환영합니다.</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check8" type="checkbox" name="check" value="1" /></td>
                        <td>4</td>
                        <td>이현규</td>
                        <td>환영합니다.</td>
                        <td>2018.11.21</td>
                    </tr>
                    <tr>
                        <td><input id="check9" type="checkbox" name="check" value="1" /></td>
                        <td>5</td>
                        <td>박아란</td>
                        <td>환영합니다.</td>
                        <td>2018.11.21</td>
                    </tr>
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
    <div class="memowriter">
        <input type="button" id="memowriter" value="쪽지쓰기" onclick="showmemo();">
    </div>
</div>
<c:import url="../common/footer.jsp"/>
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
})

function showmemo() { 
    window.open("msgpop.mn", "쪽지쓰기", "width=620, height=400, left=100, top=50, resizable=no, toolbars=no, menubar=no"); 
}
</script>
</body>
</html>