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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${empty sessionScope.loginUser}">
			<li><a href="${ctx}/login">로그인</a>
			</li>
		</c:when>
		<c:otherwise>
			${sessionScope.loginUser.name}
			<li><a href="${ctx}/logout" style="cursor: pointer;">로그아웃</a></li>

			<!-- Large modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">마이페이지</button>
				
				<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				    아이디 : <input type="text" readonly="readonly" id="id" name="id" value="${loginUser.id}"><br>
				    비밀번호 :  <input type="password" id="pwd" name="pwd"><br>
				     비밀번호 재입력 : <input type="password" id="pwd2" name="pwd2">
				     <input type="button" value="확인" id="pwdBtn" name="pwdBtn" onclick="pwdBtn();">
				    </div>
				  </div>
				</div>
			
		</c:otherwise>
	</c:choose>

	<%-- <form action="${ctx}/loginjoin" method="get">
		아이디: <input type="text" id="id" name="id">
		 <button type="button" value="중복체크" id="idcheck" name="idcheck" onclick="idCheck();">중복체크</button><br>
		 비번: <input type="password" id="pwd" name="pwd"><br>
		이름: <input type="text" id="name" name="name"><br>
		이메일: <input type="text" id="email" name="email"><br>
		번호: <input type="text" id="phone" name="phone"> <br>
		<button type="button" value="확인" id="Btn" name="Btn">확인</button>
		
		
	</form> --%>
	
	<script type="text/javascript">
		$("#Btn").on("click", function () {
			$.ajax({
				url : "${ctx}/loginjoin",
				type : "get",
				data : "id="+document.getElementById("id").value+
						"&pwd="+document.getElementById("pwd").value+
						"&name="+document.getElementById("name").value+
						"&email="+document.getElementById("email").value+
						"&phone="+document.getElementById("phone").value, 
				success : function () {
					alert('ad');
				}
			});
		});
		
		function logout() {
			location.href="${ctx}/logout";
		}
		
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
		}
		function pwdBtn() {
			$.ajax({
				url : '${ctx}/pwdCheck',
				type : "post",
				data : "id="+document.getElementById("id").value+
						"&pwd="+document.getElementById("pwd").value,
				success : function (result) {
					if(result > 0){
						location.href='${ctx}/mypage';
					}else{
						alert("비밀번호가 다릅니다...")
					}
				}
			});
			
		}
	</script>
	
	<%-- <form action="${ctx}/moira/login" method="post">
		아이디: <input type="text" id="id" name="id">
		비밀번호: <input type="text" id="pwd" name="pwd">
		<input type="submit"> 
	</form>

	<!-- 코딩테스트 문제 -->
	<table class="healthTable" style="margin: 0px auto; text-align: center; user-select: auto;">
			<thead style="user-select: auto;">
				<tr style="user-select: auto;">
					<th style="user-select: auto;">성별</th>
					<th style="user-select: auto;">신체정보</th>
					<th style="user-select: auto;">비만도 결과</th>
				</tr>
			</thead>
			<tbody style="user-select: auto;">
				<tr style="user-select: auto;">
					<th style="background-color: rgb(255, 255, 255); border: 1px solid rgb(0, 0, 0); user-select: auto;">
						
					</th>
					<th style="background-color: rgb(255, 255, 255); border: 1px solid rgb(0, 0, 0); user-select: auto;">
						<input type="text" name="inputHeight" maxlength="3" placeholder="키를 입력해주세요(cm)" style="text-align: center; user-select: auto;"><br style="user-select: auto;">
						<input type="text" name="inputWeight" maxlength="3" placeholder="몸무게를 입력해주세요(kg)" style="text-align: center; user-select: auto;">
					</th>
					<th style="background-color: rgb(255, 255, 255); border: 1px solid rgb(0, 0, 0); user-select: auto;">
						<input type="text" name="bmi" size="25" maxlength="100" value="" id="bmi" readonly="" style="user-select: auto;"><br style="user-select: auto;">
						<input type="text" name="bmiTxt" size="25" maxlength="100" value="" id="bmiTxt" readonly="" style="user-select: auto;">
					</th>
				</tr>
			</tbody>
		</table>
		
		

	<form action="${ctx}/moira/dtoJoin" method="post">
		아이디: <input id="id2" name="id"  type="text">
		비밀번호: <input id="pwd2" name="pwd" type="password">
		전화번호: <input id="phone1" name="phone" type="text">
		이메일: <input id="email1" name="email" type="text">
		<input type="submit" value="제출">
	</form>
	

	
	<form action="${ctx}/moira/scriptJoin" method="post" name="frm" id="frm">
		아이디: <input id="id3" name="id3"  type="text" placeholder="id">
		비밀번호: <input id="pwd3" name="pwd3" type="text" placeholder="pwd">
		전화번호: <input id="phone2" name="phone2" type="text">
		이메일: <input id="email2" name="email2" type="text">
		<input type="button" name="joinBtn" id="joinBtn" value="제출">
	</form>
	
	
	<form action="${ctx}/moira/home" method="post" id="frm">
		아이디 : <input type="text" id="idid" name="idid">
		비밀번호 : <input type="text" id="pw" name="pw">
		<input type="submit" value="확인">
	</form>
	
	
	
	<script type="text/javascript">
		$("input[name='joinBtn']").on("click", function (){
			
			if(document.getElementById("id3").value==""){
				alert("아이디를 입력하세요");
			}
			else if($("#pwd3").val()==""){
				alert("비밀번호 입력");
			}else if($("input[name='phone2']").val()==""){
				alert("전화번호 입력")
			}else if($("input[name='email2']").val()==""){
				alert("이메일 입력")
			}
			else {
				document.frm.submit();
			}
		});
		
	</script> --%>
</body>
</html>