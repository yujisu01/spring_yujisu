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
<title>Join</title>
</head>
<body>
 <form action="${ctx}/join" method="post">
		아이디: <input type="text" id="id" name="id">
		 <button type="button" value="중복체크" id="idcheck" name="idcheck" onclick="idCheck();">중복체크</button><br>
		 비번: <input type="password" id="pwd" name="pwd"><br>
		이름: <input type="text" id="name" name="name"><br>
		이메일: <input type="text" id="email" name="email"><br>
		번호: <input type="text" id="phone" name="phone"> <br>
		<button type="button" value="확인" id="Btn" name="Btn">확인</button>
		
		
	</form> 
	
	<script type="text/javascript">
	$("#Btn").on("click", function () {
		$.ajax({
			url : "${ctx}/join",
			type : "POST",
			data : "id="+document.getElementById("id").value+
					"&pwd="+document.getElementById("pwd").value+
					"&name="+document.getElementById("name").value+
					"&email="+document.getElementById("email").value+
					"&phone="+document.getElementById("phone").value, 
			success : function () {
				alert('회원가입 완료..');
				location.href='${ctx}/';
			}
		});
	});
	
	function idCheck(){
		$.ajax({
			url : "${ctx}/idcheck",
			type : "post",
			data : "id="+document.getElementById("id").value,
			success : function (result) {
				if(result > 0){
					alert("중복 아이디");
				}
				else{
					alert("사용가능 아이디");
				}
			}
		});
	}</script>
</body>
</html>