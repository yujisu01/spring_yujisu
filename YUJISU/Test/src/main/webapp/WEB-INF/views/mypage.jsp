<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>My Page</h1>
	아이디: 	<input type="text" disabled="disabled" value="${loginUser.id}" id="id"><br>
	 비밀번호: 	<input type="password"  value="${loginUser.pwd}" id="pwd"><br>
	이름: 	<input type="text" disabled="disabled" value="${loginUser.name}" id="name"><br>
	전화번호: 	<input type="text" disabled="disabled" value="${loginUser.phone}" id="phone"><br>
	이메일: 	<input type="text" disabled="disabled" value="${loginUser.email}" id="email"><br>
	<input type="button" id="updateA" name="updateA" value="정보수정" onclick="updateA();">
	<input type="button" id="deleteUser" name="deleteUser" value="회원탈퇴" onclick="deleteUser();">
	<input type="button" id="updateB" name="updateB" value="수정완료" onclick="updateB();" style="display: none;">
	<script type="text/javascript">
		function updateA() {
			 $("#pwd").attr("disabled",false); 
			$("#name").attr("disabled",false);			
			$("#phone").attr("disabled",false);			
			$("#email").attr("disabled",false);		
			$("#updateB").css("display", "inline-block");
			$("#updateA").css("display", "none");
			
		}
		function updateB() {
			$.ajax({
				url : "${ctx}/mypage",
				type : "post",
				data : "id="+document.getElementById("id").value+
			 	"&pwd="+document.getElementById("pwd").value+ 
				"&name="+document.getElementById("name").value+
				"&phone="+document.getElementById("phone").value+
				"&email="+document.getElementById("email").value,
				success : function (result){
					alert("수정이 완료되었습니다..");
					 $("#pwd").attr("disabled",true); 
					$("#name").attr("disabled",true);			
					$("#phone").attr("disabled",true);			
					$("#email").attr("disabled",true);		
					$("#updateA").css("display", "inline-block");
					$("#updateB").css("display", "none");
				}
			});
			
		}
		function deleteUser() {
			var json = new Object();
			json = {
				"id" : document.getElementById("id").value,
				"pwd" : document.getElementById("pwd").value
			}
			$.ajax({
				url : '${ctx}/deleteUser',
				type : 'post',
				data : JSON.stringify(json),
				contentType : 'application/json; charset=UTF-8',
				success : function (result) {
					alert("회원탈퇴가 완료되었습니다");
					location.href = "${ctx}/";
					
				}
			});
		}
	</script>
</body>
</html>