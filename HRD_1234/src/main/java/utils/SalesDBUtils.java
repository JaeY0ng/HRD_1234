package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.SalesDTO;

public class SalesDBUtils {

	private static String url="jdbc:oracle:thin:@//localhost:1521/xe";
	private static String id="system";
	private static String pw="1234";
	
	public static Connection conn;
	public static PreparedStatement pstmt;
	public static ResultSet rs;
	
	public static void conn()  throws Exception{
		 Class.forName("oracle.jdbc.OracleDriver");
		 conn = DriverManager.getConnection(url,id,pw);
	}
	
	public static List<SalesDTO> join() throws Exception{
		List<SalesDTO> list = new ArrayList();
		SalesDTO dto = null;
		String sql = "select U.custno,custname,grade,sum(price)" // 다음 라인 으로 넘어가면 띄어쓰기가 X, 한칸 씩 띄워 줘야함
				+ " from member_tbl_02 U"
				+ " inner join money_tbl_02 M"
				+ " on U.custno=M.custno"
				+ " group by U.custno,custname,grade"
				+ " order by sum(price) desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs!=null) {
			while(rs.next()) {
				dto = new SalesDTO();
				dto.setCustno(rs.getInt(1));
				dto.setCustname(rs.getString(2));
				dto.setGrade(rs.getString(3).charAt(0));
				dto.setTotalPrice(rs.getInt(4));
				
				list.add(dto);
			}
		}
		return list;
	}
	
}
