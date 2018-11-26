<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var now = new Date();
var today = now.getFullYear()+""+(now.getMonth()+1)+""+now.getDate();
var year, month, date;
var days = new Array(31,28,31,30,31,30,31,31,30,31,30,31);

$(function(){
  $('[data-toggle="tooltip"]').tooltip()
  $('#summernote').summernote({
    height: 350,                 // set editor height
    minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
    focus: true,
    tabsize : 2,
    placeholder : '내용을 입력하여 주세요',                  // set focus to editable area after initializing summernote
  });
  $("input[name='drDate']").val(now.getFullYear()+"."+(now.getMonth()+1)+"."+now.getDate())
  
  $.ajax({
		url : "<c:url value='/diary/listall.mn' />",
		data : {
			"today" : today
		},
		type : "POST"
		}).done(function(map) {
			makeCalendar(now, map);
	}) //ajax
})


function makeCalendar(now, map){
  //alert(today)
  year = now.getFullYear();
  month = now.getMonth(); // 0~11 이기 때문에 +1 해야한다.
  date = now.getDate();
  var setDate = new Date(year, month, 1);
  var firstDay = setDate.getDay(); //매월의 1일의 요일 0~6으로 나온다.
  var daysNo = 0;

  //마지막 날짜를 12개 만큼 배열에 넣어준다. 
  
    
  //윤년 체크
  if(year % 4 === 0 & year % 100 !== 0 || year % 400 === 0) {
        days[1] = 29;
  }

  daysNo = days[month];
  month = month + 1; //진짜 월

  //날짜 채우기..
  let no = 1;
  let currentCell = 0;

  // 해당 월의 마지막 날짜 와 첫째날의 요일 index를 더하고 7을 나누고 
  // 올림하면 몇 주 인지 나옴..?
  let weekNo = Math.ceil((daysNo + firstDay) / 7);
  let yearMonth = year + "" + month ;
  let pointdate = 0;
  var str = "<table>";
  for(let r=0; r<weekNo; r++){
    str += "<tr class='week"+(r+1)+"'>";
    for(let col=0; col<7; col++){
      pointdate = no;
      if(currentCell < firstDay || no > daysNo){
        str += "<td></td>"
        currentCell++;
      } else{
        if(no > 0 & no < 10) {
          pointdate = "0"+no;
        }
        let specificDate = yearMonth+""+pointdate;
        str+= "<td>";
        str+= "<a href='#1' data-val='"+specificDate+"'";
        let keyArray = Object.keys(map); //json map 객체의 키 값을 배열로 꺼내는 함수
        for(let key of keyArray) {
        	if(key==specificDate){
        		str+= "data-toggle='modal'";
        	} 
        } //
        str+= "id='setDate' data-target='#diary'>" + no +"<br>";
        for(let key in map){
        	if(specificDate===key) {
        		for(let i=0; i<map[key]; i++) {
	        		str+= "<span class='diary' value="+key+"></span>"        			
        		} //일기 수만큼 span 추가
        	} //a 태그에 있는날짜와 key 값이 같으면 span 태그 만들기
        	
        } //map 에서 key 꺼내오기
        str+= "</a></td>";
        no ++;
      }
    }
    // str += "<td>&nbsp;</td>"
    str += "</tr>"
  }
  str += "</table>";
  $("div.date").html(str);
  $("div.year").html(year)
  $(".months li").find("a[data-value="+month+"]").addClass("selected") //월 표시
  
  //alert(today.getFullYear()+""+today.getMonth()+""+today.getDate())
  $("tr[class^='week'] td").find("a[data-val="+today+"]").parent().addClass("today") //오늘 표시
  
  $("a#setDate").click(function() {
	  let setdate = $(this).data("val").toString();
	  //alert(setdate)
	  //alert(setdate.substr(0,4)+"." +setdate.substr(4,2)+"."+setdate.substr(6,2))
	  $("input[name='drDate']").val(setdate.substr(0,4)+"." +setdate.substr(4,2)+"."+setdate.substr(6,2))
  }) // disabled input 에 날짜 삽입..
  
  $("a[data-toggle='modal']").click(function() {
	  let setdate = $(this).data("val").toString();
	  $("span#setdate").html(setdate.substr(0,4)+"." +setdate.substr(4,2)+"."+setdate.substr(6,2))  
	  /* $.ajax({
		  url : 
	  }) */
  }) //일기가 있는 날짜 눌렀을 때 일기제목에 날짜 넣기 ..
  
  $("a[title]").click(function(){
    // alert($(this).data("value"))
    $(".months li").find("a[data-value="+month+"]").removeClass("selected")
    now = new Date(now.getFullYear(), $(this).data("value")-1, now.getDate())
    makeCalendar(now)
  })
  
  $("a.prev").click(function(){
    $(".months li").find("a[data-value="+month+"]").removeClass("selected")
    now = new Date(now.getFullYear(), now.getMonth()-1, now.getDate())
    prevCalendar(now)
  }) //이전 달
  
  $("a.next").click(function(){
    $(".months li").find("a[data-value="+month+"]").removeClass("selected")
    now = new Date(now.getFullYear(), now.getMonth()+1, now.getDate())
    nextCalendar(now)
  }); // 다음 달
//  $("a.")
}

function prevCalendar(now){
  makeCalendar(now)
}
function nextCalendar(now){
  makeCalendar(now)
}
  
</script>