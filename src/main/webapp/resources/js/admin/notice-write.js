

$("#write-button").click(function() {
    if($("input[name='notice-title']").val()=="") {
        alert("제목을 입력해주세요")
        return false;
    }
    if($("#summernote").val()=="") {
        alert("내용을 입력해주세요")
        return false;
    }
})
