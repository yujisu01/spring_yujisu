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
	<h2>비밀번호 찾기</h2>
	아이디 : <input type="text" id="id" name="id"><br>
	전화번호 : <input type="text" id="phone" name="phone"><br>
	<input type="button" id="findPwd" name="findPwd" onclick="findPwd();" value="비밀번호찾기">
	
	<script type="text/javascript">
		function findPwd() {
			$.ajax({
				url : "${ctx}/findPwd",
				type : "post",
				data : "id="+document.getElementById("id").value+
						"&phone="+document.getElementById("phone").value,
				success : function(result) {
					if(result==""){
						
					alert(result);
					}else{
						location.href="${ctx}/newPwd";
					}
				}
						
			});
		}
		
	</script>
</body>
</html>