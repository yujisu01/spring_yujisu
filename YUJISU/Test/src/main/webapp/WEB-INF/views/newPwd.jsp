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
<h1>새 비밀번호를 등록해 주세요</h1>
<form action="${ctx}/newPwd" name="frm" method="post">
새 비밀번호: <input type="text" id="newPwd" name="newPwd">
새 비밀번호 확인: <input type="text" id="newPwdAgain" name="newPwdAgain">
<input type="button" value="확인" onclick="newPwd();">
</form>

<script type="text/javascript">
	function newPwd() {
		if(document.getElementById("newPwd").value==document.getElementById("newPwdAgain").value)){
			document.frm.submit();
		}else{
			alert("비밀번호가 일치하지 않습니다~");
		}
		
	}
</script>
</body>
</html>