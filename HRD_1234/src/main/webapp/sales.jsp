<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DTO.*,utils.*,java.util.*"%>

<%
SalesDBUtils.conn();
List<SalesDTO> list = SalesDBUtils.join();
list.forEach(System.out::println);

SalesDBUtils.rs.close();
SalesDBUtils.pstmt.close();
SalesDBUtils.conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 0;
	padding: 0;
}

section {
	height: clac(100vh - 250px);
}

td{
	text-align : center;
}
</style>

</head>
<body>
	<div class="wrapper">
		<!-- header -->
		<%@include file="layout/header.jsp"%>
		<section>
			<table border="1" align="center" width="800px">
				<caption>
					<h2>회원매출조회</h2>
				</caption>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>

				</tr>
				<%
				for (SalesDTO dto : list) {
				%>
				<tr>
					<td><%=dto.getCustno()%></td>
					<td><%=dto.getCustname()%></td>
					<%
					if (dto.getGrade() == 'A')
						out.write("<td>VIP</td>");
					else if (dto.getGrade() == 'B')
						out.write("<td>일반</td>");
					else
						out.write("<td>직원</td>");
					%>
					<td><%=dto.getTotalPrice()%></td>
				</tr>
				<%
				}
				%>
			</table>

		</section>
	</div>
</body>
</html>