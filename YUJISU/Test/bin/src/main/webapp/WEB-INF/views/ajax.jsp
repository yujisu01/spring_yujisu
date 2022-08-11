<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
아이디 :	<input type="text" id="ajaxid" name="ajaxid">
비밀번호 :	<input type="text" id="ajaxpwd" name="ajaxpwd">
<button type="button" id="ajaxbtn" name="ajaxbtn">로그인</button>

<script type="text/javascript">

/* 쿼리스트링으로 보내는 방법 (비동기방식 ajax) */
	$("#ajaxbtn").click(function(){
		var dataObj = new Object();
		dataObj = {
				"ajaxid" : document.getElementById("ajaxid").value,
				"ajaxpwd" : document.getElementById("ajaxpwd").value
		}
		console.log(dataObj);

		
		$.ajax({
			type : 'post',
			url : '${ctx}/ajax/ajaxhome3',
			data : JSON.stringify(dataObj),
			contentType : "application/json; charset=UTF-8",
			success : function(result){
				alert(result);
			}
		});
	});
</script>
</body>
</html>