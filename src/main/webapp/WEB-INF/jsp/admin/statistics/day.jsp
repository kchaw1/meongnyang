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
                <div class="avatar"><a href="admin1.html"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a></div>
                <br>
                <div class="log-out">LOG OUT</div>
                <div class="seperator"></div>
                <div class="list">
                    <div id="board" class="item">게시판</div>
                    <div class="board-hidden youtube"><a href="youtube.html">유튜브</a></div>
                    <div class="board-hidden crowd-fund"><a href="crowd-funding.html">크라우드펀딩</a></div>
                    <div class="board-hidden notice"><a href="notice.html">공지사항</a></div>
                    <div id="management" class="item">관리</div>
                    <div class="mgm-hidden abs-member"><a href="mgm-ABS.html">행동전문가</a></div>
                    <div class="mgm-hidden gen-member"><a href="mgm-general.html">일반회원</a></div>
                    <div id="statistics" class="item"><a href="statistics.html" style="color:black;">통계</a></div>
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
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="statistics.html">일별</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="statistics1.html">주별</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="statistics2.html">월별</a></li>
                        </ul>
                </div>
                <div class="clear-fix"></div>
               
                    <div style="width:29%; margin:20px; float: left;">
                            <h2 style="float: left;">신규가입자</h2>
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
        var ctx = $("#myChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["11-16", "11-17", "11-18", "11-19", "11-20", "11-21"],
                datasets: [{
                    label: '접속자수',
                    data: [12, 10, 3, 5, 2, 3],
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
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15,
                            fontFamily: 'Jua'
                        },
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
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
                labels: ["11-16", "11-17", "11-18", "11-19", "11-20", "11-21"],
                datasets: [{
                    label: '방문자',
                    data: [12, 10, 3, 5, 2, 3],
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
                labels: ["11-16", "11-17", "11-18", "11-19", "11-20", "11-21"],
                datasets: [{
                    label: '게시글',
                    data: [12, 10, 3, 5, 2, 3],
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
                labels: ["11-16", "11-17", "11-18", "11-19", "11-20", "11-21"],
                datasets: [{
                    label: '댓글',
                    data: [12, 10, 3, 5, 2, 3],
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
                labels: ["11-16", "11-17", "11-18", "11-19", "11-20", "11-21"],
                datasets: [{
                    label: '기타1',
                    data: [12, 10, 3, 5, 2, 3],
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
                labels: ["11-16", "11-17", "11-18", "11-19", "11-20", "11-21"],
                datasets: [{
                    label: '기타2',
                    data: [12, 10, 3, 5, 2, 3],
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