<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
    /* 카드형 div 
    .column {
      width: 50%;
      float: left;
      padding-bottom: 100px;
    }

    .portlet {
      margin: 0 1em 1em 0;
      padding: 0.3em;
    }

    .portlet-header {
      padding: 0.2em 0.3em;
      margin-bottom: 0.5em;
      position: relative;
    }

    .portlet-toggle {
      position: absolute;
      top: 50%;
      right: 0;
      margin-top: -8px;
    }

    .portlet-content {
      padding: 0.4em;
    }

    .portlet-placeholder {
      border: 1px dotted black;
      margin: 0 1em 1em 0;
      height: 50px;
    }
    */

    html,
    body {
      /* height: 100%; */
      margin: 0px;
      font-family: 'Jua', sans-serif;
    }

    .aside a { text-decoration: none; }
    .aside a:link {text-decoration: none; color: #7f8818;}
    .aside a:visited {text-decoration: none; color: #7f8818;}

    #container .panel {
      padding: 10px;
      background: white;
      border-radius: 10px;
      box-shadow: 0px 10px 50px 5px rgba(0, 0, 0, 0.1);
      z-index: 8;
      overflow: hidden;
    }

    #container .panel .aside {
      width: 15%;
      height: 1000px;
      float: left;
      margin-left: 5px;
      position: relative;
      border-right: 1px solid rgba(0, 0, 0, 0.1);
      box-sizing: border-box;
    }

    #container .panel .aside .avatar {
      width: 55px;
      height: 55px;
      border-radius: 50%;
      background-color: white;
      margin: auto;
      margin-top: 20px;
      overflow: hidden;
      transition: all 0.3s cubic-bezier(0.38, -0.9, 0.5, 2.5);
    }

    #container .panel .aside .avatar:hover {
      transform: scale(1.1);
    }

    #container .panel .aside .avatar img {
      position: relative;
      width: 55px;
      height: 55px;
    }

    #container .panel .aside .seperator {
      width: 50px;
      height: 1px;
      background: #7f8818;
      opacity: 0.25;
      margin: 18px auto 36px auto;
    }

    #container .panel .aside .list {
      width: 100%;
      height: auto;
      text-align: right;
      padding-right: 14px;
      box-sizing: border-box;
      font-size: 11px;
      /* font-family: "Lato"; */
      color: #7f8818;
    }

    #container .panel .aside .list .item {
      height: 23px;
      line-height: 23px;
      width: 100%;
      font-size: 20px;
      margin-top: 17px;
      color: black;
      font-weight: bold;
      position: relative;
      cursor: pointer;
      transition: all 0.1s ease-in-out;
    }

    /* #container .panel .aside .list .item:hover {
  color: #a7b320;
} */
    #container .panel .aside .list .item.selected {
      font-weight: bold;
    }

    #container .panel .aside .list .item.selected::after {
      content: "";
      display: block;
      position: absolute;
      top: 0;
      right: -14px;
      width: 3px;
      height: 23px;
      background: #e2d307;
    }

    /* #container .panel .aside .list .item.selected:hover {
  color: #7f8818;
} */
    #container .panel .aside .log-out {
      position: relative;
      /* margin-top: 500px; */
      font-size: 11px;
      color: #e53935;
      font-weight: bold;
      text-align: center;
      cursor: pointer;
    }

    #container .panel .aside .log-out:hover {
      color: #eb6562;
      text-decoration: underline;
    }

    #container .panel .aside::before {
      content: "";
      display: block;
      width: 5px;
      height: 100%;
      background: #e2d307;
      border-radius: 10px 0px 0px 10px;
      position: absolute;
      top: 0;
      left: -5px;
    }

    #container .panel .view {
      width: 80%;
      height: 100%;
      background: white;
      float: left;
      padding: 20px 77px;
      box-sizing: border-box;
      position: relative;
    }

    #container .panel .view .sub-title {
      position: absolute;
      font-size: 9px;
      letter-spacing: 5px;
      opacity: 0.4;
      color: #7f8818;
      font-weight: bold;
      top: 22px;
      right: 32px;
    }

    #container .panel .view .main-title {
      font-size: 32px;
      letter-spacing: 5px;
      /* color: #e2d307; */
      font-weight: light;
    }

    #container .panel .view .seperator,
    #container .panel .view .min-seperator {
      width: 100%;
      height: 1px;
      background: #7f8818;
      opacity: 0.25;
      margin-top: 10px;
      margin-bottom: 45px;
    }

    #container .panel .view .min-seperator {
      width: 380px;
      margin-left: 78px;
      margin-top: 80px;
      margin-bottom: 45px;
    }

    .clear-fix {
      clear: both;
    }

    ::selection {
      background: #FFF498;
    }

    ::-moz-selection {
      background: #FFF498;
    }

    img::selection {
      background: transparent;
    }

    img::-moz-selection {
      background: transparent;
    }

    body {
      -webkit-tap-highlight-color: #FFF498;
    }

    .board-hidden {
      display: none;
      margin: 10px;
      font-size: 15px;
    }

    .board-hidden:hover {
      font-weight: bold;

    }

    .mgm-hidden {
      display: none;
      margin: 10px;
      font-size: 15px;
    }

    .mgm-hidden:hover {
      font-weight: bold;

    }

    
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
  border: #e2d307;
  background: #e2d307;
  font-weight: normal;
  color: #ffffff;
}

.ui-widget {
  font-family: 'Jua', sans-serif;
}


/* 탭 */
.tabs {
  clear: both;
}

/* 부트스트랩 버튼 폰트적용 */
button.btn{
  font-family: 'Jua', sans-serif;
}


#container {
  margin-top: 130px;
  height: auto;
}
</style>