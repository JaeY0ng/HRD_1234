package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class MoneyDBUtils {

	private static String url="jdbc:oracle:thin:@//localhost:1521/xe";
	private static String id="system";
	private static String pw="1234";
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public static void conn()  throws Exception{
		 Class.forName("oracle.jdbc.OracleDriver");
		 conn = DriverManager.getConnection(url,id,pw);
	}
	public static void insert() throws Exception {}
	public static void update() throws Exception {}
	public static void delete()  throws Exception{}
//	public static List<Object> select() throws Exception{}
//	public static List<Object> select(Object dto) throws Exception{}
	
	
	public void freeConnection(PreparedStatement pstmt) throws Exception {
		pstmt.close();
	}
	public void freeConnection(ResultSet rs,PreparedStatement pstmt)throws Exception {
		rs.close();
		pstmt.close();
	}
	public void freeConnection(Connection conn,ResultSet rs,PreparedStatement pstmt) throws Exception{
		rs.close();
		pstmt.close();
		conn.close();
	}
}
