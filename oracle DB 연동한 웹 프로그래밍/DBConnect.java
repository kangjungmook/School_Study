package DB;

import java.sql.*;

public class DBConnect {

	public static Connection getConnection() {

		Connection conn = null;// Connection(연결객체) 변수conn 선언

		String url = "jdbc:oracle:thin:@localhost:1521:xe";// 주소
		String id = "system"; // 계정 아이디
		String pw = "1234";// 계정 비번

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
