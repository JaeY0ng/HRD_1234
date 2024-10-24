<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body{
		margin:0;
		padding: 0;
	}
	section{
		height: calc(100vh - 259px);
	}
</style>
</head>
<body>
		<div class="wrapper">
			<!-- header -->
			<%@include file="layout/header.jsp"%>
			<section>
			 <div>
			 	쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원
			 </div>
			 <div>
			 	프로그램 작성 순서
			 </div>
			 <ul>
			 	<li>1 회원정보 테이블을 생성한다.</li>
			 	<li>2 매출정보 테이블을 생성한다.</li>
			 	<li>3 회원정보, 매출정보 테이블에 제시된 문제제의 참조데이터를 추가 생성한다.</li>
			 	<li>4 회원정보 입력 화면프로그램을 작성한다.</li>
			 	<li>5 회원정보 조회 프로그램을 작성한다.</li>
			 	<li>6 회원매출정보 조회 프로그램을 작성한다.</li>
			 </ul>
			 
			 
			</section>
			
			<!-- footer -->
			<%@include file = "layout/footer.jsp" %>
			
		</div>
</body>
</html>