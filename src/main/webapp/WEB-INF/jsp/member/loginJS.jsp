<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="<c:url value="/resources/js/member/login.js" />"></script>
<script>
$("button#loginform").click(function(){
	var f = document.login;
	//alert(f.loginid.value)
	//alert(f.loginpass.value)
	$.ajax({
		url : "<c:url value='/member/loginform.mn'/>",
		data : {
				"id" : f.loginid.value,
				"pass" : f.loginpass.value
				},
		type : "POST"
	}).done(function(result){
		if(result == false) {
			swal({
			  type: 'error',
			  title: '아이디와 비밀번호를 다시 입력해주세요.',
			  timer : 3000
			}) //sweetalert
			setTimeout(function() {
				f.loginpass.value = "";
				f.loginid.focus();
				f.loginid.select();
			}, 1500)
		} else {
			location.href = "<c:url value='/main.mn'/>"
		}
	}) //done
})


</script>