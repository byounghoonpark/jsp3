package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	private DBConnection() {}  //생성자. 객체 생성 불가.
	//DBConnection.getConnection()
	public static Connection getConnection() {
		Connection conn = null;
		try {
			//클래스를 메모리에 로드 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection
			("jdbc:oracle:thin:@localhost:1521:xe","kic","1234");
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return conn;
	}
	public static void close
	    (Connection conn, Statement stmt,ResultSet rs ) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
