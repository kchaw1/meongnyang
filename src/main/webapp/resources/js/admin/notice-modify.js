
$(document).ready(function () {
    $('#summernote').summernote({
        height: 330,                 // set editor height
        placeholder: "내용을 입력해주세요",
        focus: true,                  // set focus to editable area after initializing summernote
        callbacks: {
            onImageUpload: function(files, editor, welEditable) {
              for (var i = files.length - 1; i >= 0; i--) {
                sendFile(files[i], this);
              }
            }
          } // callbacks
    });
});

function sendFile(file, ele) {
    var form_data = new FormData();
    console.log("form_data", form_data)
    form_data.append('file', file);
    $.ajax({
        data : form_data, 
        type : "POST",
        url : "<c:url value='/groupbuy/uploadfile.cf'/>",
        cache : false,
        contentType : false,
        enctype : "multipart/form_data",
        processData : false,
        success : function(gbFile) {
            console.log(gbFile.url);
            $(ele).summernote("editor.insertImage", gbFile.url);
        }
    })//ajax
}

$("#writeButton").click(function() {
    if($("input[name='gbTitle']").val()=="") {
        alert("제목을 입력해주세요")
        return false;
    }
    if($("#summernote").val()=="") {
        alert("내용을 입력해주세요")
        return false;
    }
})

