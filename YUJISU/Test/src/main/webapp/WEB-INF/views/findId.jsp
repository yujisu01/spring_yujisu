<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디찾기!!</h1>
이름:<input type="text" id="name" name="name">
휴대폰번호: <input type="text" id="phone" name="phone">
<input type="button" id="findId" name="findId" value="아이디찾기" onclick="findId();">

<script type="text/javascript">
	function findId(){
	$.ajax({
		url : "${ctx}/findId",
		type : "post",
		data : "name="+document.getElementById("name").value+
				"&phone="+document.getElementById("phone").value,
		success : function (result) {
			if(result==""){
				alert("가입된 아이디가 없습니다");
			}
			else{
				alert("아이디 : " + result);
			}
		}
	});
		
	}
</script>
</body>
</html>