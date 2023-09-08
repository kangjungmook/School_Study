```java
Connection conn = null
```
> Connection(연결객체) 변수conn 선언.
```java
String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "1234";
```
> url : 주소 <br>
id : 계정 아이디<br> 
pw : 계정 비번<br>
```java
try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
```
> Class.forName("oracle.jdbc.OracleDriver") : 이것은 Oracle 데이터베이스와 연결하기 위해 필요한 단계입니다.
conn = DriverManager.getConnection(url, id, pw) :  연결이 성공하면 "DB연결 성공" 메시지가 출력됩니다.
