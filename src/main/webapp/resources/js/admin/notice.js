


$("#listButton").click(function() {
    location.href = "list.mn"
})

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
