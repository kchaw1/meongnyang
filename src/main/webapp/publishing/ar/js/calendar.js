var now = new Date();
$(function(){
  $('#summernote').summernote({
    height: 350,                 // set editor height
    minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
    focus: true,
    tabsize : 2,
    placeholder : '내용을 입력하여 주세요',                  // set focus to editable area after initializing summernote
  });
  $("input[name='date']").val(now.getFullYear()+"."+(now.getMonth()+1)+"."+now.getDate())
  makeCalendar(now);
})

var today = now.getFullYear()+""+(now.getMonth()+1)+""+now.getDate();

function makeCalendar(now){
  //alert(today)
  var year = now.getFullYear();
  var month = now.getMonth(); // 0~11 이기 때문에 +1 해야한다.
  var date = now.getDate();
  var setDate = new Date(year, month, 1);
  var firstDay = setDate.getDay(); //매월의 1일의 요일 0~6으로 나온다.
  var daysNo = 0;

  //마지막 날짜를 12개 만큼 배열에 넣어준다. 
  var days = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
    
  //윤년 체크
  if(year % 4 === 0 & year % 100 !== 0 || year % 400 === 0) {
        days[1] = 29;
  }

  daysNo = days[month];
  month = month + 1; //진짜 월

  //날짜 채우기..
  var no = 1;
  var currentCell = 0;

  // 해당 월의 마지막 날짜 와 첫째날의 요일 index를 더하고 7을 나누고 
  // 올림하면 몇 주 인지 나옴..?
  var weekNo = Math.ceil((daysNo + firstDay) / 7);
  var yearMonth = year + "" + month ;
  var pointdate = 0;
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
        str+= "<td>";
        str+= "<a href='#1' data-val='"+yearMonth+""+pointdate+"' data-toggle='modal'";
        str+= "data-target='#diary'>" + no +"</a></td>";
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
  $(".months li").find("a[data-value="+month+"]").addClass("selected")
  //alert(today.getFullYear()+""+today.getMonth()+""+today.getDate())
  $("tr[class^='week'] td").find("a[data-val="+today+"]").parent().addClass("today")
  
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
  })
  $("a.next").click(function(){
    $(".months li").find("a[data-value="+month+"]").removeClass("selected")
    now = new Date(now.getFullYear(), now.getMonth()+1, now.getDate())
    nextCalendar(now)
  });
  $("a.")
}

function prevCalendar(now){
  makeCalendar(now)
}
function nextCalendar(now){
  makeCalendar(now)
}
  