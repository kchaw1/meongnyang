
    // 헤더푸터
      // $("#header").load("./header.html"); 
      // $("#footer").load("./footer.html");
      // $("#donate-area > button").click(function() {
      //   alert($(this).siblings().val());
        
      // })

    
    // 금액 쉼표
    function inputNumberFormat(obj) { 
      obj.value = comma(uncomma(obj.value)); 
    } 

    function comma(str) { 
        str = String(str); 
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
    } 

    function uncomma(str) { 
        str = String(str); 
        return str.replace(/[^\d]+/g, ''); 
    }

