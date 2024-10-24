package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class MemberDBUtils {

	private static String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	private static String id = "system";
	private static String pw = "1234";

	public static Connection conn;
	public static PreparedStatement pstmt;
	public static ResultSet rs;

	public static void conn() throws Exception {

		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
	}

	public static void insert() throws Exception {

	}

	public static void update() throws Exception {

	}

	public static void delete() throws Exception {

	}

	public static List<Object> select() throws Exception {
		return null;
	}

	public static List<Object> select(Object dto) throws Exception {
		return null;
	}

	public static int maxCustno() throws Exception {
		int maxCustno = 0;
		pstmt = conn.prepareStatement("select max(custno) from member_tbl_02");
		rs = pstmt.executeQuery();
		if (rs != null) {
			if (rs.next()) {
				maxCustno = rs.getInt(1);
			}
		}
		return maxCustno;
	}

}
