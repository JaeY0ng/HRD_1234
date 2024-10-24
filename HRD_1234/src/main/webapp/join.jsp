<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@page import = "DTO.*,utils.*" %>
	
	<%
		MemberDBUtils.conn();	// db연결
		int maxCustno = MemberDBUtils.maxCustno();
		
		//제거
		MemberDBUtils.rs.close();
		MemberDBUtils.pstmt.close();
		MemberDBUtils.conn.close();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="wrapper">
		<!-- header -->
		<%@include file="layout/header.jsp"%>
		<section>
			<table border="1" align="center;" width="800px;">
				<caption>쇼핑몰 회원 등록</caption>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" /></td>
				</tr>
				<tr colspan=2 style="text-align: center;">
					<td>
						<button>등록</button>
						<button>조회</button>
					</td>
				</tr>
			</table>
		</section>

		<footer>
			<%@include file="layout/footer.jsp"%>
		</footer>
	</div>


</body>
</html>