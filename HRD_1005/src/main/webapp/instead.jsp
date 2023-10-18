<%@ page import = "DB.DBconnect" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    Connection conn = DBconnect.getConnection();
    String sql = "SELECT M.M_NO, M.M_NAME, P.P_NAME, " +
        "CASE M.P_SCHOOL " +
        "WHEN '1' THEN '고졸' " +
        "WHEN '2' THEN '학사' " +
        "WHEN '3' THEN '석사' " +
        "WHEN '4' THEN '박사' " +
        "END AS M_SCHOOL, " +
        "SUBSTR(M.M_JUMIN, 1, 6) || '-' || SUBSTR(M.M_JUMIN, 7, 13) AS B_JUMIN, " +
        "M.M_CITY, " +
        "P.P_TEL1 || '-' || P.P_TEL2 || '-' || P.P_TEL3 AS P_TEL " +
        "FROM TBL_MEMBER_202005 M, TBL_PARTY_202005 P " +
        "WHERE M.P_CODE = P.P_CODE";

    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
    <jsp:include page = "layout/header.jsp"></jsp:include>
</header>

<nav>
    <jsp:include page = "layout/nav.jsp"></jsp:include>

</nav>
<section class = "section">
    <h2> 후보조회 </h2>
    <table class = "table_style">
        <tr>
            <th>후보번호</th>
            <th>성명</th>
            <th>소속정당</th>
            <th>학력</th>
            <th>주민번호</th>
            <th>지역구</th>
            <th>대표전화</th>
        </tr>
        
        <% while(rs.next()) { %>
        <tr class="center">
        	<td><%=rs.getString("M_NO") %></td>
        	<td><%=rs.getString("M_NAME") %></td>
        	<td><%=rs.getString("P_NAME") %></td>
        	<td><%=rs.getString("M_SCHOOL") %></td>
        	<td><%=rs.getString("B_JUMIN") %></td>
        	<td><%=rs.getString("M_CITY") %></td>
        	<td><%=rs.getString("P_TEL") %></td>
        </tr>
        <%} %>
        
    </table>
</section>

<footer>
    <jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>