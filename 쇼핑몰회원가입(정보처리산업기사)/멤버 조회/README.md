# 파일 : member_search.jsp 

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 입력</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
    function check() {
        if (!document.data.custno.value) {
            data.custno.focus();
            alert("회원번호를 입력하세요.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
    <!-- 헤더 및 내비게이션 -->
    
    <!-- 회원 검색 폼 -->
    
    <!-- 푸터 -->
</body>
</html>
```
* 첫 번째 파일은 HTML 페이지로 내장된 JavaScript 및 JSP 태그를 가지고 있습니다.
* 회원 ID로 회원을 검색하기 위한 양식을 포함하고 있습니다.
* 스타일링을 위해 외부 CSS 파일을 사용합니다.
* JavaScript 함수 check()은 양식 입력을 유효성 검사합니다.

* # 파일 : member_search_list.jsp 
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBconect" %>
<%@ page import="java.sql.*" %>
<% 
Connection conn = DBconect.getConnection();
String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
        + " case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,"
        + " city from member_tbl_02"
        + " where custno=?"
        + " order by custno";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, request.getParameter("custno"));
ResultSet rs = ps.executeQuery();

int num = Integer.parseInt(request.getParameter("custno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 입력</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <!-- 헤더 및 내비게이션 -->
    
    <!-- 회원 검색 결과 -->
    
    <!-- 푸터 -->
</body>
</html>

```
* 두 번째 파일도 HTML 페이지로, JSP 태그를 사용한 Java 코드가 내장되어 있습니다.
* JDBC를 사용하여 데이터베이스에 연결하여 제공된 회원 ID를 기반으로 회원 데이터를 검색합니다.
* 회원을 찾았을 경우 회원 정보를 HTML 테이블에 표시하고, 찾지 못한 경우 "찾을 수 없음" 메시지를 표시합니다.

# 파일 : member_list.jsp
```jsp
<%@page import="DB.DBconect"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Connection conn = DBconect.getConnection();
String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
        + " case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade,"
        + " city from member_tbl_02"
        + " order by custno";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <!-- 헤더 및 내비게이션 -->
    
    <!-- 회원 목록 -->
    
    <!-- 푸터 -->
</body>
</html>
```
* 세 번째 파일은 데이터베이스에서 회원 목록을 가져와 HTML 테이블 형식으로 표시하기 위해 내장된 Java 코드를 사용한 HTML 페이지입니다.
* JDBC를 사용하여 데이터를 검색하고 HTML 테이블에 표시합니다.
