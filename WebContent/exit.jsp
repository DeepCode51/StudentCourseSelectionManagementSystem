<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp选课系统</title>
</head>
<body>
<!-- 首先让其注销session，然后跳转到登录页面 -->
<% session.invalidate(); %>
<jsp:forward page="login.jsp"></jsp:forward>
</body>
</html>