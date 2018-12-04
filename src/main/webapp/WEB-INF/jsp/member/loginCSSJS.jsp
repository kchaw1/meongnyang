<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="<c:url value="/resources/css/member/login.css"/>">
<%-- <script src="<c:url value="/resources/js/member/sweetalert2.all.min.js"/>"></script> --%>
<link rel="stylesheet" href="<c:url value="/resources/css/common/sweetalert2.min.css"/>">
<%-- <script src="<c:url value="/resources/js/member/login.js" />"></script> --%>
<script src="<c:url value="https://unpkg.com/sweetalert/dist/sweetalert.min.js"/>"></script>

<style>
	#sendMail {
  	position: relative;
    width: calc(16% - 8px);
    float: left;
  }
  
  .file {
  	visibility: hidden;
  	position: absolute;
  }
  
  .u-form-group button{
    width:50%;
    height: 70px;
    background-color: #1CB94E;
    border: none;
    outline: none;
    color: #fff;
    font-size: 21px;
    font-weight: normal;
    padding: 14px 0;
    border-radius: 2px;
    margin-top: 15px;
    text-transform: uppercase;
  }
</style>