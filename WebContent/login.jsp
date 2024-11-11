<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">

<script>
	//判断输入是否为空
	function Login() {
		//获取输入框的内容
		var userName = $('#userName').val();
		var userPw = $('#userPw').val();

		if (userName == '' || userPw == '') {
			alert('用户名或密码不能为空！！！');
		} else {
			document.getElementById("loginForm").submit();
		}

	}
</script>

</head>
<body>
<div id="wrap">
<div class="modal-body">
	<div style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
		<form class="form-horizontal" action="Login" method="post" id="loginForm" name="loginForm">
    	<center><h4 class="modal-title" id="gridSystemModalLabel">jsp选课系统</h4></center>
    	<br>
			<div class="form-group">
				<label for="sKnot" class="col-xs-4 control-label">用户名：</label>
				<div class="col-xs-5">
					<input type="" class="form-control input-sm duiqi" id="userName" name="userName" placeholder="输入用户名" style="margin-top: 7px;">
				</div>
			</div>
			<div class="form-group">
				<label for="sKnot" class="col-xs-4 control-label">密&nbsp;&nbsp;码：</label>
				<div class="col-xs-5">
					<input type="password" class="form-control input-sm duiqi" id="userPw" name="userPw" placeholder="输入密码" style="margin-top: 7px;">
				</div>
			</div>
			<div class="form-group">
				<label for="sKnot" class="col-xs-4 control-label">身&nbsp;&nbsp;份：</label>
				<div class="col-xs-8 text-left">
					<label class="control-label" for="1"> <input type="radio" name="chose" value="1" checked="checked">管理员</label> 
					&nbsp;&nbsp;&nbsp;
					<label class="control-label" for="2"> <input type="radio" name="chose" value="2"> 教师</label>
					&nbsp;&nbsp;&nbsp;
					<label class="control-label" for="3"> <input type="radio" name="chose" value="3"> 学生</label>
				</div>
			</div>
			<div>
				<span style="color:red;">${message }</span>
			</div>
			<div class="form-group text-right">
				<div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
					<button type="reset" class="btn btn-xs btn-white">重置</button>
					<button type="button" onclick="Login();" class="btn btn-xs btn-green">登录</button>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>