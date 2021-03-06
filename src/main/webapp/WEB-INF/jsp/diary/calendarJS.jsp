<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	var now = new Date();
	var updatedMonth = now.getMonth()+1
	var updatedDate = now.getDate();
	if(updatedMonth < 10) {
		updatedMonth = "0" + updatedMonth;
	}
	if(updatedDate < 10) {
		updatedDate = "0" + updatedDate;
	}
	var today = now.getFullYear()+""+updatedMonth+""+updatedDate;
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
	    placeholder : '내용을 입력하여 주세요',
	    callbacks: {
      		onImageUpload : function(files, editor, welEditable) {
      			//console.log(files);
      			//console.log(this);
      			for(let i=files.length-1; i>=0; i--){
      				sendFile(files[i], this);
      			}  
      		}
      	} // callbacks
	  });

	  $("input[name='drDate']").val(now.getFullYear()+"."+updatedMonth+"."+updatedDate)
	  //console.log(today)
	  
	  //listall 가져오는 ajax..
	  listall("${user.id}");
	  
	}) //onready
	
	function listall(id){
		$.ajax({
			url : "<c:url value='/diary/listall.mn' />",
			data : {
				"drDate" : today,
				"drWriter" : id
			},
			type : "POST"
			}).done(function(map) {
				console.log(map)
				makeCalendar(now, map);
		}) //ajax
	}
	
	function makeCalendar(now, map){
	  //alert(today)
	  console.log("삭제후 : ")
	  console.log(map)
	  
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
	  if(month<10) {
		  month = "0" + month;
	  }
	  let yearMonth = year + "" + month ;
	  let pointdate = 0;
	  var str = "<table class='calendar'>";
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
	        
	        if(map!=null) {
		        let keyArray = Object.keys(map); //json map 객체의 키 값을 배열로 꺼내는 함수
		        for(let key of keyArray) {
		        	if(key==specificDate){
		        		str+= "data-toggle='modal'";
		        	} 
		        } //        	
	        } //if not null
	        
	        str+= "id='setDate' data-target='#diary'>" + no +"<br>";
	        if(map!=null) {
		        for(let key in map){
		        	if(specificDate===key) {
		        		for(let i=0; i<map[key]; i++) {
			        		str+= "<span class='diary' value="+key+"></span>"        			
		        		} //일기 수만큼 span 추가
		        	} //a 태그에 있는날짜와 key 값이 같으면 span 태그 만들기
		        	
		        } //map 에서 key 꺼내오기        	
	        }//if not null
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
		  detailDiary(setdate);
	  }) //일기가 있는 날짜 눌렀을 때 일기제목에 날짜 넣기 ..
	  
	  $("a[title]").click(function(){
	    // alert($(this).data("value"))
	    $(".months li").find("a[data-value="+month+"]").removeClass("selected")
	    now = new Date(now.getFullYear(), $(this).data("value")-1, now.getDate())
	    goMonth(now);
	  }) //원하는 월을 클릭했을때..
	  
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
	} // makeCalendar
	
	function showdetailDiary(map, setdate) {
		let str = "";
		for(let diary of map.diaryList){
			str += '<div class="diary" data-no="'+diary.drNo+'" >'
			str += '<div class="dr-title">'
			str += '<span class="title">'+diary.drTitle+'</span><br>'
			str += '<span class="date">'+diary.drRegDateTime+'</span>';
			if(diary.drShare =='1') {
				str += '<span class="label label-share">전체 공개</span>';					
			} else if (diary.drShare =='2'){
				str += '<span class="label label-friend">친구에게만 공개</span>';
			} else {
				str += '<span class="label label-noshare">나만 보기</span>';
			}
			if(diary.drContent ==null) {
				diary.drContent = "내용 없음..."
			}
			str += '</div><div class="dr-content">'+diary.drContent+'</div>';
			str += '<div class="buttons"><div class="button-box">'
			str += '<button class="dr-delete" data-value="'+diary.drNo+'" data-date="'+diary.drDate+'">삭제</button>'
			str += '<button class="dr-update" data-value="'+diary.drNo+'" data-date="'+diary.drDate+'">수정</button>'
			str += '</div></div>'
			str += '<div class="aboutcomments" data-no="'+diary.drNo+'">'
			str += '<div class="commentform form-group">'
			str += '<form id="commentform" name="comment" method="POST" >'
			str += '<input type="hidden" name="drcWriter" value="${user.id}"/>'
			str += '<input type="text" class="form-control" id="drcContent" data-no="'+diary.drNo+'" placeholder="댓글을 입력해주세요."/>'		
			str += '<div class="combuttonbox" data-no="'+diary.drNo+'">'
			str += '<a href="#1" id="morecomments" class="more hidden" data-no="'+diary.drNo+'">댓글 더보기</a><span class="comNo"></span>'
			str += '<button type="button" class="drc-write">등록</button>'
			str += '</div></form></div>'
			str += '<div class="commentList hidden" data-no="'+diary.drNo+'"><ul class="comments">'
			str += '</ul></div>'
			str += '</div></div>'
			
			
		} //for
		$("div.diaryList").html(str);
		var contentList = document.querySelectorAll(".dr-content");
		for(let content of contentList){
			$content = $(content);
			if($content.html().indexOf("img")!= -1) {
				$content.find("img").addClass("normal");
			}
		}

		$("button.drc-write").click(function(){
			writecomment($(this).parent().data("no"), setdate)
		})
		var keyArray = Object.keys(map); //json map 객체의 키 값을 배열로 꺼내는 함수
		
		//댓글 뿌려주기..
		if(map.commentList != null) {
			for(let comment of map.commentList) {
			console.log(map)
				for(let drNoKey of keyArray) {
					if(drNoKey == comment.drNo) {
						$("div.combuttonbox[data-no='"+drNoKey+"']").find("span").html("("+map[drNoKey]+")");
					}
				}
			//$("a#morecomments[data-no='"+comment.drNo+"']").find("span").html("("+map.get(comment.drNo)+")")
			$("a#morecomments[data-no='"+comment.drNo+"']").removeClass("hidden");
			$("a#morecomments[data-no='"+comment.drNo+"']").addClass("show")
			var html = "";
				html += '<li class="comment" data-drno="'+comment.drNo+'" data-drc="'+comment.drcNo+'">'
				html += '<a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Kasper"></a>'
				html += '<div class="meta">'+comment.drcWriter
				if(comment.friendsId != null) {						
					html += '<span class="small-label label-friend">친구</span>'
				} else if (comment.drcWriter == "${user.id}") {
					html += '<span class="small-label label-me">나</span>' 
				}
				html += '| '+ comment.drcRegDate
				html += '<a href="#1" class="update" id ="editBtn" data-drc="'+comment.drcNo+'">수정 </a>'
				html += '<a href="#1" class="delete" data-drc="'+comment.drcNo+'"> 삭제</a></div>'
				html += '<div class="body">'+comment.drcContent+'</div></li>'
			$("div[data-no='"+comment.drNo+"'] > .aboutcomments > .commentList > ul").append(html);
			} //comment for 문..
		} // comment 있으면 뿌리기..
		
		$("a#morecomments").click(function(){
			$("div.commentList[data-no='"+$(this).data("no")+"']").toggleClass("hidden")
			$("div.commentList[data-no='"+$(this).data("no")+"']").toggleClass("show")
			if($(this).html() =="댓글 더보기"){
				$(this).html("댓글 숨기기")				
			} else {
				$(this).html("댓글 더보기")
			}
		})
		
		
		$("button.dr-delete").click(function() {
			//alert($(this).data("date"));
			deleteDiary($(this).data("value"), $(this).data("date"));
		}) // 다이어리 삭제
		$("button.dr-update").click(function() {
			updateformDiary($(this).data("value"), $(this).data("date"));
		}) // 다이어리 삭제
		
		$("a.delete").click(function(){
			deleteComment($(this).data("drc"), setdate)
		})
	} //showDetail
	
	function deleteComment(drcNo, setdate){
		$.ajax({
			url : "<c:url value='/diary/comment/delete.mn' />",
			data : "drcNo="+drcNo,
			type : "POST"
		}).done(function(){
			detailDiary(setdate)
		})
	}
	function writecomment(drNo, setdate) {
		$.ajax({
			url : "<c:url value='/diary/comment/write.mn' />",
			data : {
				"drNo" : drNo,
				"drcWriter" : "${user.id}",
				"drcContent" : $("input#drcContent[data-no='"+drNo+"']").val(),
				"drDate" : setdate,
				"drWriter" : "${user.id}"
			},
			type : "POST"
		}).done(function(map){
			showdetailDiary(map, setdate)
		})
		
	} //writecomment
	
	function detailDiary(setdate) {
		$.ajax({
			url : "<c:url value='/diary/detail.mn' />",
			data : {
				"drDate" : setdate,
				"drWriter" : "${user.id}",
				"userId" : "${user.id}"
			},
			type : "POST"
		}).done(function(map){
			if(map!=null) {
				showdetailDiary(map, setdate)
			} // if not null
		})//done
	} //detailDiary
	
	function deleteDiary(drNo, setdate) {
		//alert(drNo)
		//alert(setdate)
		let drYear = setdate.toString().substr(0,4);
		let drMonth = setdate.toString().substr(4,2);
		let drDay = setdate.toString().substr(6,2);
		let now = new Date(drYear, (drMonth-1), drDay);
		var check = confirm("정말 일기를 삭제하시겠습니까?")
		if(check == true) {
			$.ajax({
				url : "<c:url value='/diary/delete.mn' />",
				data : {
						"drDate" : setdate,
						"drNo" : drNo,
						"drWriter" : "${user.id}",
						"userId" : "${user.id}"
					   },
				type : "POST"
			}).done(function(map) {
				if(map!=null) {
					showdetailDiary(map, setdate)
					makeCalendar(now, map)
				} // if not null
			}) //done
		}// 삭제 OK
	} //deleteDiary
	
	function updateformDiary(drNo, setdate) {
		let str = "";
		$.ajax({
			url : "<c:url value='/diary/updateform.mn' />",
			data : "drNo="+drNo,
			type : "POST"
		}).done(function(diary){
			str += '<div class="dr-title"><span class="title">'
			str += '<input type="text" name="drupdateTitle" class="form-control" value="'+diary.drTitle+'"/>'
			str += '</span><br>';
			str += '<span class="date">'+diary.drRegDateTime+'</span>';
			str += '<div class="updateform"><input type="radio" id="all1" name="drShareupdate" value="1" checked="checked"/>'
            str += '<label for="all1">모두 공개</label>'
            str += '<input type="radio" id="friend1" name="drShareupdate" value="2" />'
            str += '<label for="friend1">친구에게만 공개</label>'
            str += '<input type="radio" id="no1" name="drShareupdate" value="3" />'
            str += '<label for="no1">나만 보기</label></div></div>'
            str += '<div class="dr-content update">'
            str += '<textarea id="winternote" class="form-control" name="drupdateContent">'+diary.drContent+'</textarea>'
            str += '</div><div class="buttons"><div class="updatebutton-box">'
   			str += '<button class="dr-updatecancel">취소</button>'
   			str += '<button class="dr-updatecomplete" data-value="'+diary.drNo+'" data-date="'+diary.drDate+'">수정 완료</button>'
			str += '</div></div>'
            
			$("div[data-no="+diary.drNo+"]").html(str);
			
			$("button.dr-delete").attr("disabled", "disabled");
			$("button.dr-update").attr("disabled", "disabled");
			
		  $('#winternote').summernote({
		    height: 150,                 // set editor height
		    minHeight: null,             // set minimum height of editor
		    maxHeight: null,             // set maximum height of editor
		    focus: true,
		    tabsize : 1,
		    fontSize : 10
		  });
		  
			$("button.dr-updatecancel").click(function() {
				detailDiary(setdate)
			}) //수정 취소
			
			$("button.dr-updatecomplete").click(function() {
				//alert(drNo)
				updateDiary(drNo, setdate)
			})
		}) //done
		
	} //updateformDiary
	
	function updateDiary(drNo, setdate){
		//alert($("input[name='drupdateTitle']").val())
		$.ajax({
			url : "<c:url value='/diary/update.mn' />",
			data : {
				"drTitle" : $("input[name='drupdateTitle']").val(),
				"drContent" : $("textarea#winternote").val(),
				"drShare" : $("input[name='drShareupdate']:checked").val(),
				"drNo" : drNo
			},
			type : "POST"
		}).done(function() {
			detailDiary(setdate);
		})
	}
	
	function prevCalendar(now){
		let month = now.getMonth()+1
		if(month<10){
			month = "0"+month
		}
		let date = now.getDate();
		if(date <10) {
			date = "0" + date;
		}
		let day = now.getFullYear()+""+month+""+date;
		$.ajax({
			url : "<c:url value='/diary/listall.mn' />",
			data : {
				"drDate" : day,
				"drWriter" : "${user.id}"
			},
			type : "POST"
			}).done(function(map) {
				makeCalendar(now, map)			
		}) //ajax
	} //prevCalendar
	
	function nextCalendar(now){
		let month = now.getMonth()+1
		if(month<10){
			month = "0"+month
		}
		let date = now.getDate();
		if(date <10) {
			date = "0" + date;
		}
		let day = now.getFullYear()+""+month+""+date;
		$.ajax({
			url : "<c:url value='/diary/listall.mn' />",
			data : {
				"drDate" : day,
				"drWriter" : "${user.id}"
			},
			type : "POST"
			}).done(function(map) {
				makeCalendar(now, map)			
		}) //ajax
	} // nextCalendar
	
	function goMonth(now) {
		let month = now.getMonth()+1
		if(month<10){
			month = "0"+month
		}
		let date = now.getDate();
		if(date <10) {
			date = "0" + date;
		}
		let day = now.getFullYear()+""+month+""+date;
		$.ajax({
			url : "<c:url value='/diary/listall.mn' />",
			data : {
				"drDate" : day,
				"drWriter" : "${user.id}"
			},
			type : "POST"
			}).done(function(map) {
				//console.log(map)
				makeCalendar(now, map)			
		}) //ajax
	}
  
	function sendFile(file, ele) {
    	var form_data = new FormData();
    	//console.log("form_data", form_data)
    	form_data.append('file', file);
    	$.ajax({
    		data : form_data,
    		type : "POST",
    		url : "<c:url value='/diary/uploadfile.mn'/>",
    		cache : false,
    		contentType : false,
    		enctype : "multipart/form_data",
    		processData : false,
    		success : function(drFile) {
    			$("input#imagesysname").val(drFile.drfSysName)
    			$("input#imagepath").val(drFile.drfPath)
    			/* append('<li><img src="'+url+'" width="480" height="auto"/></li>') */
    			$(ele).summernote("editor.insertImage", drFile.url);
    		}
    	})//ajax
    } //sendFile
</script>