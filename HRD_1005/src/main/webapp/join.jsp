<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.DBconnect"%>
<%@ page import="java.sql.*"%>
<%
String sql = "select max(custno) from member_tbl_02";

Connection conn = DBconnect.getConnection();

PreparedStatement pstmt = conn.prepareStatement(sql);

ResultSet rs = pstmt.executeQuery();

rs.next();

int num = rs.getInt(1) + 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<script type="text/javascript">
	function check() {
		if (!document.data.custname.value) {
			data.custname.focus();
			alert("회원성명을 입력하세요.");
			return false;
		} else if (!document.data.phone.value) {
			data.phone.focus();
			alert("전화번호를 입력하세요.");
			return false;
		} else if (!document.data.address.value) {
			data.address.focus();
			alert("주소를 입력하세요.");
			return false;
		} else if (!document.data.joindate.value) {
			data.joindate.focus();
			alert("가입날짜를 입력해주세요.");
			return false;
		} else if (!document.data.grade.value) {
			data.grade.focus();
			alert("등급을 입력해주세요.");
			return false;
		} else if (!document.data.city.value) {
			data.city.focus();
			alert("도시코드를 입력해주세요.");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>

	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>

	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>

	<section class="section">
		<form name="data" action="join_p.jsp" method="post"
			onsubmit="return check()">
			<h2>회원가입</h2>
			<table class="table_style">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%=num%>" readonly></td>
				</tr>

				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value=""></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value=""></td>
				</tr>

				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value=""></td>
				</tr>

				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value=""></td>
				</tr>

				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="grade" value=""></td>
				</tr>

				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value=""></td>
				</tr>

				<tr>
					<th colspan="2"><input type="submit" value="등록"> <input
						type="button" onclick="location.href = 'join.jsp'" value="취소"></th>
				</tr>


			</table>

		</form>
	</section>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>