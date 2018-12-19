<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resources/css/ranking/ranking.css"/>">
<script src = "https://code.jquery.com/jquery-latest.min.js"></script>
<c:import url="../common/headerfooterCSSJS.jsp" />
</head>
<style>
     
.forTabha{
    padding-bottom: 40px;
    border: 1px solid #e5e5e5;
    margin-bottom: 31px;
}
.tabClass{
    width: 100%;
    height: 43px;
   
 
}
.forTabClass{
    border-top-left-radius: 7px;
    cursor: pointer;
    text-align: center;
    float: left;
    border-top: 1px solid #e5e5e5;
    border-left: 1px solid #e5e5e5;
    border-right: 1px solid #e5e5e5;
    font-size: 0.8125rem;
    line-height: 1.5rem;
    letter-spacing: 0.125rem;
    text-transform: uppercase;
    font-weight: 600;
    color: #7d97ad;
    width: 100px;
    height: 43px;
    padding-top: 9px;
}
.forTabClass2{
    cursor: pointer;
    text-align: center;
    float: left;
    
    border-right: 1px solid #e5e5e5;
    border-top: 1px solid #e5e5e5;
    font-size: 0.8125rem;
    line-height: 1.5rem;
    letter-spacing: 0.125rem;
    text-transform: uppercase;
    font-weight: 600;
    color: #7d97ad;
    width: 180px;
    height: 43px;
    padding-top: 9px;
}
.forTabClass3{
    cursor: pointer;
    text-align: center;
    float: left;
   border-right: 1px solid #e5e5e5;
   border-top: 1px solid #e5e5e5;
    font-size: 0.8125rem;
    line-height: 1.5rem;
    letter-spacing: 0.125rem;
    text-transform: uppercase;
    font-weight: 600;
    color: #7d97ad;
    width: 180px;
    height: 43px;
    padding-top: 9px;
}

.contain.text-center {
	margin-top: 50px;
}


.is-active{
background-color: #ededed;
}

.is-active2{
background-color: #ededed;
}
.fa-arrow-right {
    float: right;
    font-size: 23px;
    margin-top: 14px;
    cursor: pointer;
    color: #d6d1d1;
}
.ch

</style>

<script src="<c:url value="/resources/js/common/chat.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/chat2.css"/>">
<c:import url = "../common/chat.jsp"/>

	<c:import url="../common/header.jsp" />

    <body class="page-leaderboard">
    <div class = "forAjax">
           <section class="leaderboard-progress">
                <div class="contain text-center">
                    <img alt="Android Basics Leaderboard" class="mb-2" src="https://d125fmws0bore1.cloudfront.net/assets/svgs/icon_trophy_leaderboard-3442a4b2312e6cdd02aa9870e636dc082890277a6267c4ed986a750fef7cbb35.svg">
                    <h2 style="font-family: 'Jua'">금주의 전문가 랭킹</h2>
                    <p class="lead" style="font-family: 'Jua'">금주의 전문가랭킹 산출방식은 블라블라블라이고 누구에게 멀주겠씁니다.</p>
                </div>
            </section>
            <section class="ranking">
                <div class="contain">


                    <div  class= "tabClass">
                    <div class ="forTabClass">전체랭킹</div><div class ="forTabClass2 is-active2">금주의 일반인 랭킹</div><div class ="forTabClass3">금주의 전문가 랭킹</div>
                      <i class="fas fa-arrow-right"></i>
                    </div>

                   <div class = "forTabha">
                    <div class="ranking-table">
                        <div class="ranking-table-header-row">
                            <div class="ranking-table-header-data h6">Rank</div>
                            <div class="ranking-table-header-data h6">Name</div>
                            <div class="ranking-table-header-data h6">Score</div>
                        </div>
                        <div class="ranking-table-row-leader-1">
                            <div class="ranking-table-data-leader-1">
                                <div class="medal-gold"></div>
                            </div>
                            <div class="ranking-table-data" >
                                ${list2[0].id}
</div>
                            <div class="ranking-table-data">
                                <div class="complete1">${list2[0].sum}</div>
                            </div>
                        </div>
                        <div class="ranking-table-row-leader-2">
                            <div class="ranking-table-data-leader-2">
                                <div class="medal-silver"></div>
                            </div>
                            <div class="ranking-table-data">
                              ${list2[1].id}
</div>
                            <div class="ranking-table-data">
                                <div class="complete1">${list2[1].sum}</div>
                            </div>
                        </div>
                        <div class="ranking-table-row-leader-3">
                            <div class="ranking-table-data-leader-3">
                                <div class="medal-bronze"></div>
                            </div>
                            <div class="ranking-table-data">
                                ${list2[2].id}
</div>
                            <div class="ranking-table-data">
                                <div class="complete1">${list2[2].sum}</div>
                            </div>
                        </div>
                        <div class="ranking-table-body">
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    4
</div>
                                <div class="ranking-table-data">
                                    ${list2[3].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[3].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    5
</div>
                                <div class="ranking-table-data">
                                    ${list2[4].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[4].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    6
</div>
                                <div class="ranking-table-data">
                                    ${list2[5].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[5].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    7
</div>
                                <div class="ranking-table-data">
                                   ${list2[6].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[6].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    8
</div>
                                <div class="ranking-table-data">
                                    ${list2[7].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[7].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    9
</div>
                                <div class="ranking-table-data">
                                    ${list2[8].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[8].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    10
</div>
                                <div class="ranking-table-data">
                                    ${list2[9].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[9].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    11
</div>
                                <div class="ranking-table-data">
                                    ${list2[10].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[10].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    12
</div>
                                <div class="ranking-table-data">
                                    ${list2[11].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[11].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    13
</div>
                                <div class="ranking-table-data">
                                    ${list2[12].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[12].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    14
</div>
                                <div class="ranking-table-data">
                                    ${list2[13].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[13].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    15
</div>
                                <div class="ranking-table-data">
                                   ${list2[14].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[14].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    16
</div>
                                <div class="ranking-table-data">
                                    ${list2[15].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[15].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    17
</div>
                                <div class="ranking-table-data">
                                    ${list2[16].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[16].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    18
</div>
                                <div class="ranking-table-data">
                                    ${list2[17].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[17].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    19
</div>
                                <div class="ranking-table-data">
                                    ${list2[18].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[18].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    20
</div>
                                <div class="ranking-table-data">
                                    ${list2[19].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[19].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    21
</div>
                                <div class="ranking-table-data">
                                    ${list2[20].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[20].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    22
</div>
                                <div class="ranking-table-data">
                                    ${list2[21].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[21].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    23
</div>
                                <div class="ranking-table-data">
                                    ${list2[22].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[22].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    24
</div>
                                <div class="ranking-table-data">
                                    ${list2[23].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[23].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    25
</div>
                                <div class="ranking-table-data">
                                    ${list2[24].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[24].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    26
</div>
                                <div class="ranking-table-data">
                                    ${list2[25].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[25].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    27
</div>
                                <div class="ranking-table-data">
                                    ${list2[26].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[26].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    28
</div>
                                <div class="ranking-table-data">
                                    ${list2[27].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[27].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    29
</div>
                                <div class="ranking-table-data">
                                    ${list2[28].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[28].sum}</div>
                                </div>
                            </div>
                            <div class="ranking-table-row">
                                <div class="ranking-table-data">
                                    30
</div>
                                <div class="ranking-table-data">
                                    ${list2[29].id}
</div>
                                <div class="ranking-table-data">
                                    <div class="complete1">${list2[29].sum}</div>
                                </div>
                            </div>
                           
              
                        </div>
                    </div>
                </div> <!--탭 줄무늬-->
                    <!--Use Date Formatter-->
                </div>
            </section>
 
    </div>
            
          
	<c:import url="../common/footer.jsp" />

<script>

$(".fa-arrow-right").click(function(){
	location.href = "<c:url value ='/main//mainPage.mn' />";
})

$(".forTabClass").click(function(){
    location.href = "<c:url value ='/ranking/ranking.mn' />";

})
$(".forTabClass2").click(function(){
    location.href = "<c:url value ='/ranking/rankingGen.mn' />";

})

$(".forTabClass3").click(function(){
    location.href = "<c:url value ='/ranking/rankingAbs.mn' />";

})



$(".forTabClass").mouseover(function(){
    $(this).addClass("is-active");

})
$(".forTabClass").mouseleave(function(){
    $(this).removeClass("is-active");

})

$(".forTabClass2").mouseover(function(){
    $(this).addClass("is-active");

})
$(".forTabClass2").mouseleave(function(){
    $(this).removeClass("is-active");

})

$(".forTabClass3").mouseover(function(){
    $(this).addClass("is-active");

})
$(".forTabClass3").mouseleave(function(){
    $(this).removeClass("is-active");

})

</script>
         

    
    
    
    

</body>
</html>