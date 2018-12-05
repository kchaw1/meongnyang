$(document).ready(
    function() {
        // 태그에 onchange를 부여한다.
        $('#file').change(function() {
                addPreview($(this)); //preview form 추가하기
        });
    });
 
    // image preview 기능 구현
    // input = file object[]
    function addPreview(input) {
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
                var file = input[0].files[fileIndex];
                var reader = new FileReader();
 
                reader.onload = function (img) {
                    //div id="preview" 내에 동적코드추가.
                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                    $(".img_wrap").html(
                        "<img src=\"" + img.target.result + "\"\/>"
                    );
                };
                
                reader.readAsDataURL(file);
            }
        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
    }
    
    
    $("input[name='name']").blur(function(){
    	if(isValidName($(this).val()) == false) {
    		 $("span#warnname").text("잘못된 형식의 이름입니다.")
    	} else {
    		$("span#warnname").text("")
    	}
    }) //이름 유효성에 따른 경고창
    
$("input[name='id']").blur(function(){
	$warnid = $("span#warnid");
	if(isValidId($(this).val()) == false) {
		$warnid.removeClass("green")
		$warnid.text("영문 대소문자, 숫자만 가능합니다.")
	} else if(isValidId($(this).val()) == true) {
		$.ajax({
			url : "<c:url value='/member/checkid.mn'/>",
			data : "id="+$(this).val(),
			type : "POST"
		}).done(function(result) {
			if(result) {
				$warnid.removeClass("green")
				$warnid.text("이미 등록되어있는 아이디 입니다.")
			} else {
				$warnid.addClass("green")
				$warnid.text("사용가능한 아이디 입니다.")
			}
		}) //done
	} else if(isValidId($(this).val()) == 0){
		$warnid.text("3글자 이상 입력해주세요.")
	}  
	//if-else
})
  