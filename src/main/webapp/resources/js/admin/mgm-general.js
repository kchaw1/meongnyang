

    $(document).ready(function () {
      $("#management").addClass("selected");
      $(".mgm-hidden").toggle();
      $(".gen-member").css("font-weight", "bold");
    })

    //좌측 메뉴 스크립트
    $("#board").hover(function () {
      $(this).addClass("selected");
    })

    $("#board").click(function () {
      $(".board-hidden").slideToggle(500);
    })

    $("#management").click(function () {
      $(".mgm-hidden").slideToggle(500);
    })
    $("#management").hover(function () {
		$(this).addClass("selected");
	})

    $("#statistics").hover(function () {
      $(this).addClass("selected");
    })

    $(".item").mouseleave(function () {
      $(this).removeClass("selected");
    })
 
    //탭
    $(function () {
      var tabs = $(".tabs").tabs();
      tabs.find(".ui-tabs-nav").sortable({
        axis: "x",
        stop: function () {
          tabs.tabs("refresh");
        }
      });
    });
