<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="utils.*,DTO.*,java.time.*,java.time.format.*" %>
<%
	
	//문자셋 설정
	request.setCharacterEncoding("UTF-8");

	//파라미터 받기
	 int custno = Integer.parseInt(request.getParameter("custno"));
	 String custname = request.getParameter("custname");
	 String phone = request.getParameter("phone");
	 String address = request.getParameter("address");
	 
	 
	 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	 LocalDate joindate = LocalDate.parse(request.getParameter("joindate"),formatter);
	 System.out.println("Date : " + joindate);
	 
	 char grade = request.getParameter("grade").charAt(0);
	 String city = request.getParameter("city");	
	 
	 MemberDTO memberDto = new MemberDTO(custno,custname,phone,address,joindate,grade,city);
	 System.out.println("memberDto : " + memberDto);
	 
	 //유효성 체크 x
	
	//DB Insert
	MemberDBUtils.conn();
	MemberDBUtils.insert(memberDto);
	MemberDBUtils.pstmt.close();
	MemberDBUtils.conn.close();
	
	
	//뷰 이동 or 뷰에 내용 전달
%>

	<script>
		alert("회원등록이 완료되었습니다.");
		location.href="${pageContext.request.contextPath}/join.jsp";
	</script>

