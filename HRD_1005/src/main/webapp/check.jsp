<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.DBconnect"%>
<%@ page import="java.sql.*"%>
<%
Connection conn = DBconnect.getConnection();
String sql = "";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

int total = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>

	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>

	</nav>
	<section class="section">
		<h2>투표검수 조회</h2>
		<table class="table_style">
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>

			</tr>
			<%
			while (rs.next()) {
			%>
			<tr class="center">
			</tr>


			<%
			}
			%>

		</table>
	</section>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>

</body>
</html>