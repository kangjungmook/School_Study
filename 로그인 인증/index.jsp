<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String inputId = "abc";
	String inputPassword = "1234";
	String userId = "abc";
	String password = "5678";

	String msg = null;
	if (inputId == userId) {
		if (inputPassword == password) {
			msg = "환영합니다.";
		} else {
			msg = "비밀번호를 확인하세요";
		}
	} else {
		msg = "회원가입을 후 방문해주세요.";
	}
	%>

	<b>사용자ID : <%=inputId%> 사용자 비밀번호 : <%=inputPassword%>
	</b>
	<b>사용자ID : <%=userId%> 사용자 비밀번호 : <%=password%>
	</b>
	<b>로그인 인증 : <%=msg%></b>
</body>
</html>
