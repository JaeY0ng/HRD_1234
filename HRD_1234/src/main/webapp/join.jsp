<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DTO.*,utils.*,java.time.*,java.time.format.*"%>
<%
MemberDBUtils.conn(); //db연결
int maxCustno = MemberDBUtils.maxCustno();

//제거
MemberDBUtils.rs.close();
MemberDBUtils.pstmt.close();
MemberDBUtils.conn.close();

LocalDateTime today = LocalDateTime.now();

DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd"); //yy MM dd HH mm ss
String fmtToday = today.format(formatter);
System.out.println(fmtToday);
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
			<form action="${pageContext.request.contextPath}" method="post"
				name="joinForm" onSubmit="return false">
				<table border="1" align="center" width="800px">
					<caption>
						<h2>쇼핑몰 회원등록</h2>
					</caption>
					<tr>
						<th>회원번호(자동발생)</th>
						<td><input type="text" name="custno" value="<%=maxCustno + 1%>"></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname"></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="date" name="joindate"
							value="<%=today.toString()%>"></td>
					</tr>
					<tr>
						<th>고객등급[A:VIP,B:일반,C:직원]</th>
						<td><input type="text" name="grade"></td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td><input type="text" name="city"></td>
					</tr>
					<tr>
						<td colspan=2 style="text-align: center;">
							<button onClick="reqJoin()">등록</button>
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
		function reqJoin() {
			var form = document.joinForm;
			if (isValid(form))
				form.submit();
		}

		function isValid(form) {

			if (form.custname.value.trim() == "") {
				alert("회원성명이 입력되지 않았습니다.")
				form.custname.focus();
				return false;
			}
			if (form.phone.value.trim() == "") {
				alert("전화번호가 입력되지 않았습니다.")
				form.phone.focus();
				return false;
			}
			if (form.address.value.trim() == "") {
				alert("주소가 입력되지 않았습니다.")
				form.address.focus();
				return false;
			}
			if (form.joindate.value.trim() == "") {
				alert("가입일자가 입력되지 않았습니다.")
				form.joindate.focus();
				return false;
			}
			if (form.grade.value.trim() == "") {
				alert("고객등급이 입력되지 않았습니다.")
				form.grade.focus();
				return false;
			}
			if (form.city.value.trim() == "") {
				alert("도시코드가 입력되지 않았습니다.")
				form.city.focus();
				return false;
			}
			return true;
		}
	</script>

</body>
</html>





