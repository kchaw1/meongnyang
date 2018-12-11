<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="statisticsCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<!-- start -->
	<div id="container">
        <div class="panel">
            <!-- 좌측 메뉴 -->
            <div class="aside">
                <div class="avatar"><a href="<c:url value='/admin/main.mn' />"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a></div>
                <br>
                <div class="seperator"></div>
                <div class="list">
			         <div id="board" class="item">게시판</div>
			         <div class="board-hidden notice"><a href="<c:url value="/admin/notice/list.mn" />">공지사항</a></div>
			         <div class="board-hidden youtube"><a href="<c:url value="/admin/youtube/youtube.mn" />">유튜브</a></div>
			         <div class="board-hidden crowd-fund"><a href="<c:url value="/admin/crowd/list.mn" />">크라우드펀딩</a></div>
			         <div id="management" class="item">관리</div>
			         <div class="mgm-hidden abs-member"><a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a></div>
			         <div class="mgm-hidden gen-member"><a href="<c:url value="/admin/general/list.mn" />">일반회원</a></div>
			         <div id="statistics" class="item"><a href="<c:url value="/admin/statistics/day.mn" />" style="color:black;">통계</a></div>
                </div>

            </div>
            <!-- /좌측 메뉴 -->

            <!-- 우측 콘텐츠 영역-->
            <div class="view">
                <div class="sub-title">Statistics</div>
                <div class="main-title">통계</div>
                <div class="seperator"></div>
                <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                         		 일별
                          <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="day.mn">일별</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="week.mn">주별</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="month.mn">월별</a></li>
                        </ul>
                </div>
                <div class="clear-fix"></div>
               
                    <div style="width:29%; margin:20px; float: left;">
                            <h2 style="float: left;">가입자</h2>
                            <div>
                                <canvas id="myChart" width="100%" height="100%"></canvas>
                            </div>
                        </div>
                   
                    <!-- 게시글수 Chart -->
                <div style="width:29%; margin:20px; float: left;">
                        <h2 style="float: left;">방문자</h2>
                        <div>
                            <canvas id="myChart1" width="100%" height="100%"></canvas>
                        </div>
                    </div>
                    
                    <!-- 게시글수 Chart -->
                    <div style="width:29%; margin:20px; float: left;">
                        <h2 style="float: left;">게시글</h2>
                        <div>
                            <canvas id="myChart2" width="100%" height="100%"></canvas>
                        </div>
                    </div>
                    <div class="clear-fix"></div>
                    <!-- 댓글수 Chart -->
                    <div style="width:29%; margin:20px; float: left;">
                        <h2 style="float: left;">댓글</h2>
                        <div>
                            <canvas id="myChart3" width="100%" height="100%"></canvas>
                        </div>
                    </div>
                    <div style="width:29%; margin:20px; float: left;">
                        <h2 style="float: left;">포인트사용</h2>
                        <div>
                            <canvas id="myChart4" width="100%" height="100%"></canvas>
                        </div>
                    </div>
                    
                    <div style="width:29%; margin:20px; float: left;">
                        <h2 style="float: left;">평균접속시간</h2>
                        <div>
                            <canvas id="myChart5" width="100%" height="100%"></canvas>
                        </div>
                    </div>
                    <div class="clear-fix"></div>        
                    
                
            </div>
            <!-- /우측 콘텐츠 영역-->
        </div>
        <div class="clear-fix"></div>

    </div>
	
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
	 $(document).ready(function () {
            $("#statistics").addClass("selected");
        })

        //좌측 메뉴 스크립트
        $("#board").hover(function () {
            $(this).addClass("selected");
        })

        $("#board").click(function () {
            $(".board-hidden").slideToggle(500);
        })

        $("#board").hover(function () {
            $(this).addClass("selected");
        })

        $("#management").hover(function () {
            $(this).addClass("selected");
        })

        $("#management").click(function () {
            $(".mgm-hidden").slideToggle(500);
        })

        $(".item").mouseleave(function () {
            $(this).removeClass("selected");
        })
    </script>

    <script>
    function comma(str) { 
        str = String(str); 
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
    } 
    
    	console.log('${dateArr[0]}');
    	console.log('${newMemberArr[0]}');
    
        var ctx = $("#myChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['${dateArr[0]}', '${dateArr[1]}', '${dateArr[2]}', '${dateArr[3]}', '${dateArr[4]}'],
                datasets: [{
                    label: '가입자수',
                    data: ['${newMemberArr[0]}', '${newMemberArr[1]}', '${newMemberArr[2]}', '${newMemberArr[3]}', '${newMemberArr[4]}'],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	tooltips: {
      			  callbacks: {
      					label: function(tooltipItem, data) {
      						var value = data.datasets[0].data[tooltipItem.index];
      						value = value.toString();
      						value = value.split(/(?=(?:...)*$)/);
      						value = value.join(',');
      						return value;
      					}
      			  } // end callbacks:
      			}, //end tooltips
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            userCallback: function(value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            },
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }]
                }
            }
        });
    </script>

    <script>
        var ctx1 = $("#myChart1");
        var myChart1 = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ['${dateArr[0]}', '${dateArr[1]}', '${dateArr[2]}', '${dateArr[3]}', '${dateArr[4]}'],
                datasets: [{
                    label: '방문자',
                    data: ['${visitorArr[0]}', '${visitorArr[1]}', '${visitorArr[2]}', '${visitorArr[3]}', '${visitorArr[4]}'],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	tooltips: {
      			  callbacks: {
      					label: function(tooltipItem, data) {
      						var value = data.datasets[0].data[tooltipItem.index];
      						value = value.toString();
      						value = value.split(/(?=(?:...)*$)/);
      						value = value.join(',');
      						return value;
      					}
      			  } // end callbacks:
      			}, //end tooltips
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            userCallback: function(value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            },
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }]
                }
            }
        });
    </script>

    
    <script>
        var ctx2 = $("#myChart2");
        var myChart2 = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['${dateArr[0]}', '${dateArr[1]}', '${dateArr[2]}', '${dateArr[3]}', '${dateArr[4]}'],
                datasets: [{
                    label: '게시글',
                    data: ['${postArr[0]}', '${postArr[1]}', '${postArr[2]}', '${postArr[3]}', '${postArr[4]}'],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	tooltips: {
      			  callbacks: {
      					label: function(tooltipItem, data) {
      						var value = data.datasets[0].data[tooltipItem.index];
      						value = value.toString();
      						value = value.split(/(?=(?:...)*$)/);
      						value = value.join(',');
      						return value;
      					}
      			  } // end callbacks:
      			}, //end tooltips
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            userCallback: function(value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            },
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }]
                }
            }
        });
    </script>


    <script>
        var ctx3 = $("#myChart3");
        var myChart3 = new Chart(ctx3, {
            type: 'line',
            data: {
                labels: ['${dateArr[0]}', '${dateArr[1]}', '${dateArr[2]}', '${dateArr[3]}', '${dateArr[4]}'],
                datasets: [{
                    label: '댓글',
                    data: ['${commentArr[0]}', '${commentArr[1]}', '${commentArr[2]}', '${commentArr[3]}', '${commentArr[4]}'],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	tooltips: {
      			  callbacks: {
      					label: function(tooltipItem, data) {
      						var value = data.datasets[0].data[tooltipItem.index];
      						value = value.toString();
      						value = value.split(/(?=(?:...)*$)/);
      						value = value.join(',');
      						return value;
      					}
      			  } // end callbacks:
      			}, //end tooltips
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            userCallback: function(value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            },
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }]
                }
            }
        });
    </script>


    <script>
        var ctx4 = $("#myChart4");
        var myChart4 = new Chart(ctx4, {
            type: 'line',
            data: {
                labels: ['${dateArr[0]}', '${dateArr[1]}', '${dateArr[2]}', '${dateArr[3]}', '${dateArr[4]}'],
                datasets: [{
                    label: '포인트사용량',
                    data: ['${pointArr[0]}', '${pointArr[1]}', '${pointArr[2]}', '${pointArr[3]}', '${pointArr[4]}'],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	tooltips: {
      			  callbacks: {
      					label: function(tooltipItem, data) {
      						var value = data.datasets[0].data[tooltipItem.index];
      						value = value.toString();
      						value = value.split(/(?=(?:...)*$)/);
      						value = value.join(',');
      						return value;
      					}
      			  } // end callbacks:
      			}, //end tooltips
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            userCallback: function(value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            },
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }]
                }
            }
        });
    </script>


    <script>
        var ctx5 = $("#myChart5");
        var myChart5 = new Chart(ctx5, {
            type: 'line',
            data: {
                labels: ['${dateArr[0]}', '${dateArr[1]}', '${dateArr[2]}', '${dateArr[3]}', '${dateArr[4]}'],
                datasets: [{
                    label: '평균접속시간(단위 분)',
                    data: ['${timeArr[0]}', '${timeArr[1]}', '${timeArr[2]}', '${timeArr[3]}', '${timeArr[4]}'],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	tooltips: {
      			  callbacks: {
      					label: function(tooltipItem, data) {
      						var value = data.datasets[0].data[tooltipItem.index];
      						value = value.toString();
      						value = value.split(/(?=(?:...)*$)/);
      						value = value.join(',');
      						return value;
      					}
      			  } // end callbacks:
      			}, //end tooltips
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            userCallback: function(value, index, values) {
                                value = value.toString();
                                value = value.split(/(?=(?:...)*$)/);
                                value = value.join(',');
                                return value;
                            },
                            fontSize: 15,
                            fontFamily: 'Jua'
                        }
                    }]
                }
            }
        });
    </script>
</body>
</html>