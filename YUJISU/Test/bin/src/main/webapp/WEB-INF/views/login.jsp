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

id : <input type="text" id="id" name="id">
pwd : <input type="password" id="pwd" name="pwd" required placeholder="Password">
<input type="submit" value="로그인" id="loginBtn">

<script type="text/javascript">
$("#loginBtn").click(function () {
	
	$.ajax({
		
		url : '${ctx}/login',
		type : 'post',
		data : "id="+document.getElementById("id").value+
				"&pwd="+document.getElementById("pwd").value,
		success : function(result) {
			if(result == "success"){
				location.href='${ctx}/'
			}else {
				alert("로그인 실패..");
			}
		}
});
	});
</script>

</body>
</html>