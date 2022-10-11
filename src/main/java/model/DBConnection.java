package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	private DBConnection() {} //생성자. 접근제한자가 private이므로 객체 생성 불가
	//호출시 DBConnection.getConnection()
	public static Connection getConnection() { 
		Connection conn = null; 
		try {
			//Class.forName : 클래스를 메모리에 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","kic","1234");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void close
		(Connection conn, Statement stmt, ResultSet rs) {
		try {
			//close를 사용하기 위해서는 예외처리를 해줘야한다.
			//connection을 하면 close를 해줘야한다. 
			//close를 안하고 대용량 데이터를 받으면 데이터베이스가 죽는다.
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
