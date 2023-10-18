<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DB.DBconnect" %>
<%@ page import="java.sql.*" %>
<%
Connection conn = DBconnect.getConnection();

String sql = "SELECT tm.m_no, tm.m_name, COUNT(tv.m_no) AS total"
        + " FROM tbl_member_202005 tm, tbl_vote_202005 tv"
        + " WHERE tm.m_no = tv.m_no AND tv.v_confirm = 'Y'"
        + " GROUP BY tm.m_no, tm.m_name"
        + " ORDER BY total DESC";

PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>후보자 등수</title>
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
    <h2>회원매출조회</h2>
    <table class="table_style">
        <tr>
            <th>후보번호</th>
            <th>성명</th>
            <th>총투표건수</th>
        </tr>

        <%
        while (rs.next()) {
        %>
        <tr class="center">
            <td><%= rs.getString("m_no") %></td>
            <td><%= rs.getString("m_name") %></td>
            <td><%= rs.getString("total") %></td>
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
