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
    window.open("memopop.html", "쪽지쓰기", "width=620, height=400, left=100, top=50, resizable=no, toolbars=no, menubar=no"); 
}









