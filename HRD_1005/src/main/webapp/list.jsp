<%@ page import="DB.DBconnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Connection conn = DBconnect.getConnection();
String sql = "SELECT V_NAME AS 성명, " +
        "'19' || SUBSTR(V_JUMIN, 1, 2) || '년' || SUBSTR(V_JUMIN, 3, 2) || '월' || SUBSTR(V_JUMIN, 5, 2) || '일생' AS 생년월일, " +
        "'만 ' || TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('19' || SUBSTR(V_JUMIN, 1, 6), 'yyyymmdd'))/12) || '세' AS 나이, " +
        "CASE WHEN SUBSTR(V_JUMIN, 7, 1) = '1' THEN '남' ELSE '여' END AS 성별, " +
        "M_NO AS 후보번호, " +
        "SUBSTR(V_TIME, 1, 2) || ':' || SUBSTR(V_TIME, 3, 2) AS 투표시간, " +
        "CASE WHEN V_CONFIRM = 'Y' THEN '확인' ELSE '미확인' END AS 유권자확인 " +
        "FROM tbl_vote_202005 " +
        "WHERE V_AREA = '제1투표장'";

PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
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
		<h2>투표 검수 조회</h2>
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
				<td><%=rs.getString("성명")%></td>
				<td><%=rs.getString("생년월일")%></td>
				<td><%=rs.getString("나이")%></td>
				<td><%=rs.getString("성별")%></td>
				<td><%=rs.getString("후보번호")%></td>
				<td><%=rs.getString("투표시간")%></td>
				<td><%=rs.getString("유권자확인")%></td>
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
