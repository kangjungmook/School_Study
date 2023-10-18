<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.DBconnect"%>
<%@ page import="java.sql.*"%>

<%
Connection conn = DBconnect.getConnection();
String sql = "SELECT V_JUMIN, V_NAME, M_NO, V_TIME, V_AREA, V_CONFIRM FROM TBL_VOTE_202005 ";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="stylesheet" href="css/style.css">
</head>

<script type="text/javascript">
	function check() {
		if (!document.data.jumin.value) {
			document.data.jumin.focus();
			alert("주민번호가 입력되지 않았습니다.");
			return false;
		} else if (!document.data.name.value) {
			document.data.name.focus();
			alert("성명이 입력되지 않았습니다.");
			return false;
		} else if (!document.data.candidateNumber.value) {
			document.data.candidateNumber.focus();
			alert("투표번호가 선택되지 않았습니다");
			return false;
		} else if (!document.data.votingTime.value) {
			document.data.votingTime.focus();
			alert("투표시간이 입력되지 않았습니다");
			return false;
		} else if (!document.data.absenteeCheck.value) {
			alert("투표장소 확인이 선택되지 않았습니다");
			return false;
		} else {
			alert("투표가 완료되었습니다.");
			return true;
		}
	}
</script>

<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>

	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>

	<section class="section">
		<h2>투표하기</h2>
		<form name="data" action="#" method="post" onsubmit="return check()">
			<table class="table_style">
				<tr>
					<td><label for="jumin">주민번호</label></td>
					<td><input type="text" id="jumin" name="jumin" value=""></td>
				</tr>
				<tr>
					<td><label for="name">성명</label></td>
					<td><input type="text" id="name" name="name" value=""></td>
				</tr>
				<tr>
					<td><label for="candidateNumber">투표번호</label></td>
					<td><select id="candidateNumber" name="candidateNumber">
							<option value="1">후보 1</option>
							<option value="2">후보 2</option>
							<option value="3">후보 3</option>
							<option value="4">후보 4</option>
							<option value="5">후보 5</option>
					</select></td>
				</tr>

				<tr>
					<td><label for="votingTime">투표시간</label></td>
					<td><input type="text" id="votingTime" name="votingTime"
						value=""></td>
				</tr>

				<tr>
					<td><label for="votingTime">투표장소</label></td>
					<td><input type="text" id="voting location"	name="voting location" value=""></td>
				</tr>

				<tr>
					<td><label for="absenteeCheck">유권자확인 확인</label></td>
					<td><input type="radio" id="absenteeCheck"
						name="absenteeCheck" value="확인" checked> 확인 <input
						type="radio" id="absenteeCheck" name="absenteeCheck" value="미확인">
						미확인</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="투표하기"> <input
						type="button" onclick="location.href='vote.jsp'" value="다시하기"></th>
				</tr>


			</table>
		</form>
	</section>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
