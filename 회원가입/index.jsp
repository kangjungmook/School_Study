<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link>
<title>회원가입</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 100%;
}

th,
td {
    padding: 10px;
    border-bottom: 1px solid #ccc;
}

th {
    text-align: right;
    width: 30%;
}

input[type="text"],
input[type="password"],
input[type="username"],
input[type="radio"],
input[type="checkbox"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}

input[type="radio"],
input[type="checkbox"] {
    margin-right: 5px;
}

button {
    display: inline-block;
    margin: 10px 5px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:last-child {
    background-color: #f44336;
}

button:hover {
    opacity: 0.8;
   	
}
</style>
</head>
<body>
    <div class="container">
        <h1>회원가입</h1>
        <form name="customer" action = "register_p.jsp" method="post" >
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="pw"></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <label><input type="radio" name="gender" value="M" checked> 남성</label>
                        <label><input type="radio" name="gender" value="F"> 여성</label>
                    </td>
                </tr>
                <tr>
                    <th>취미</th>	
                    <td>
                        <input type="checkbox" name="hobby" value="댄스" checked> 댄스
                        <input type="checkbox" name="hobby" value="게임"> 게임
                        <input type="checkbox" name="hobby" value="노래"> 노래
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">전송</button>
                        <button type="button" onclick="alert('회원가입 취소했습니다.')">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
