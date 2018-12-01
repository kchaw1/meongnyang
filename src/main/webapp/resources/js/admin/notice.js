


$("#listButton").click(function() {
    location.href = "gb_board.cf"
})

$("nav > ul.pagination > li > a").click(function(e) {
    // 기본 이벤트 막기...
    e.preventDefault();
    
    var pageNo = $(this).attr("href");
//         		alert(pageNo)
    if (pageNo == 0 || pageNo == '${pageResult.lastPage+1}') return false;
    
     location.href = "gb_board.cf?pageNo=" + pageNo;
});

 $(document).on("click", "#searchBtn" ,function(e) {
     if($("#searchType").val() == 0 && $("#keyword").val() != "") {
        e.preventDefault()
        alert("카테고리를 선택하세요");
         return false;
    }
     
     if($("#searchType").val() != 0 && $("#keyword").val() == "") {
         e.preventDefault()
         alert("검색어를 입력해주세요");
         return false;
     }
 });
