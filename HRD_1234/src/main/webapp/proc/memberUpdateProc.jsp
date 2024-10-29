<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.*, DTO.*, java.util.*, java.time.*, java.time.format.*" %>
<%
	//문자셋 설정
	request.setCharacterEncoding("UTF-8");

	//파라미터 받기
	 int custno = Integer.parseInt(request.getParameter("custno"));
	 String custname = request.getParameter("custname");
	 String phone = request.getParameter("phone");
	 String address = request.getParameter("address");
	 
	 
	 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 LocalDate joindate = LocalDate.parse(request.getParameter("joindate"),formatter);
	 System.out.println("Date : " + joindate);
	 
	 char grade = request.getParameter("grade").charAt(0);
	 String city = request.getParameter("city");	
	 
	 MemberDTO memberDto = new MemberDTO(custno,custname,phone,address,joindate,grade,city);
	 System.out.println("memberDto : " + memberDto);
	
	 
	 //DB Update
	MemberDBUtils.conn();
	MemberDBUtils.update(memberDto);
	MemberDBUtils.pstmt.close();
	MemberDBUtils.conn.close();
%>


<script>
	alert("회원 정보수정이 완료되었습니다.")
	location.href="${pageContext.request.contextPath}/memberInfo.jsp";
</script>