<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DTO.*,utils.*"%>
<%
String custnoParam = request.getParameter("custno");
if (custnoParam == null || custnoParam.isEmpty()) {
	// 고객 번호가 없을 경우 처리
	response.sendError(HttpServletResponse.SC_BAD_REQUEST, "custno is required.");
	return;
}
int custno;
try {
	custno = Integer.parseInt(custnoParam);
} catch (NumberFormatException e) {
	// 숫자로 변환할 수 없을 경우 처리
	response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid custno format.");
	return;
}

MemberDBUtils.conn();
MemberDTO dto = MemberDBUtils.select(custno);
System.out.println(dto);
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
	height: calc(100vh - 250px);
}
</style>

</head>
<body>

	<div class="wrapper">
		<!-- header -->
		<%@include file="layout/header.jsp"%>
		<section>
			<form
				action="${pageContext.request.contextPath}/proc/memberUpdateProc.jsp"
				method="post" name="memberUpdateForm" onSubmit="return false">
				<table border="1" align="center" width="800px">
					<caption>
						<h2>쇼핑몰 회원 정보 수정</h2>
					</caption>
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="custno"
							value="<%=dto.getCustno()%>"></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname"
							value="<%=dto.getCustname()%>"></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name="phone"
							value="<%=dto.getPhone()%>"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address"
							value="<%=dto.getAddress()%>"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="date" name="joindate"
							value="<%=dto.getJoinDate()%>"></td>
					</tr>
					<tr>
						<th>고객등급[A:VIP,B:일반,C:직원]</th>
						<td><input type="text" name="grade"
							value="<%=dto.getGrade()%>"></td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td><input type="text" name="city" value="<%=dto.getCity()%>"></td>
					</tr>
					<tr>
						<td colspan=2 style="text-align: center;">
							<button onClick="reqUpdate()">수정</button>
							<button onClick="location.href='memberInfo.jsp'">조회</button>
						</td>

					</tr>
				</table>
			</form>
		</section>

		<!-- footer -->
		<%@include file="layout/footer.jsp"%>
	</div>
	<script>
		function reqUpdate() {
			const form = document.memberUpdateForm;
			form.submit();
		}
	</script>
	
</body>
</html>