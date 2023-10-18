<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBconnect"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "insert into TBL_VOTE_202005 values(?, ?, ?, ?, ?, ?, ?)";
	Connection conn = DBconnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	
	 ps.setInt(1, Integer.parseInt(request.getParameter("jumin")));
	    ps.setString(2, request.getParameter("name"));
	    ps.setInt(3, Integer.parseInt(request.getParameter("candidateNumber")));
	    ps.setString(4, request.getParameter("votingTime"));
	    ps.setString(5, request.getParameter("votingLocation"));
	    ps.setString(6, request.getParameter("absenteeCheck"));
	
	ps.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>