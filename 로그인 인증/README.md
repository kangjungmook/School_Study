이 코드의 알고리즘은 간단한 사용자 로그인 인증 절차를 수행하는 것입니다. 
사용자로부터 입력받은 아이디와 비밀번호를 미리 설정된 올바른 아이디와 비밀번호와 비교하여 인증 결과를 메시지로 표시합니다.


> inputId: 사용자가 입력한 아이디
inputPassword: 사용자가 입력한 비밀번호
userId: 올바른 사용자 아이디 (하드코딩)
password: 올바른 사용자 비밀번호 (하드코딩)
msg: 로그인 상태 메시지를 저장할 변수

```javascript
String inputId = "abc";
	String inputPassword = "1234";
	String userId = "abc";
	String password = "5678";
```

> inputId와 userId, 그리고 inputPassword와 password를 == 연산자로 비교하여 각각 일치 여부를 확인합니다.
> 입력한 아이디와 비밀번호가 올바른 경우: "환영합니다." 메시지를 msg에 할당합니다.
입력한 아이디는 올바르지만 비밀번호가 틀린 경우: "비밀번호를 확인하세요." 메시지를 msg에 할당합니다.
입력한 아이디가 올바르지 않은 경우: "회원가입을 후 방문해주세요." 메시지를 msg에 할당합니다.

```javascript
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
```

>마지막으로, msg와 사용자 입력 아이디(inputId) 및 비밀번호(inputPassword),
>그리고 올바른 사용자 아이디(userId)와 비밀번호(password)가 웹 페이지에 출력됩니다.

```javascript
	<b>사용자ID : <%=inputId%> 사용자 비밀번호 : <%=inputPassword%>
	</b>
	<b>사용자ID : <%=userId%> 사용자 비밀번호 : <%=password%>
	</b>
	<b>로그인 인증 : <%=msg%></b>
```
