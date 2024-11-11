<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp选课系统</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");
			;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
		$("#topAD").click(function() {
			$("#topA").toggleClass(" glyphicon-triangle-right");
			$("#topA").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topBD").click(function() {
			$("#topB").toggleClass(" glyphicon-triangle-right");
			$("#topB").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topCD").click(function() {
			$("#topC").toggleClass(" glyphicon-triangle-right");
			$("#topC").toggleClass(" glyphicon-triangle-bottom");
		});
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		})
	})
</script>

<!-- 时间显示 -->
<script>
$(function(){
	showTime();
});
function showTime(){ 
  var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
  var show_zn=new Array("大自然处于竞争之中。","那么多问题的原因不在星期一，很可能是你自己有问题。","倾听不是为了理解，倾听是为了回答。",
		  "大家都希望你过得好，但不希望比他们自己过得更好。","我们抱怨这个社会，别忘了自己也是社会的一部分。 ",
		  "是时候该起床了。","如果你与众不同，你肯定会感觉孤独。");
  var time=new Date(); 
  var year=time.getFullYear(); 
  var month=time.getMonth(); 
  var date=time.getDate(); 
  var day=time.getDay(); 
  var hour=time.getHours(); 
  var minutes=time.getMinutes(); 
  var second=time.getSeconds(); 
  month<10?month='0'+month:month; 
  if(month > 12){
	  month = 0;
  }
  month++; 
  hour<10?hour='0'+hour:hour; 
  minutes<10?minutes='0'+minutes:minutes; 
  second<10?second='0'+second:second; 
  var now_time=year+'年'+month+'月'+date+'日'+' '+show_day[day]+' '+hour+':'+minutes+':'+second; 
  var now_zn=show_zn[day]; 
  document.getElementById('showtime').innerHTML=now_time;
  document.getElementById('zn').innerHTML=now_zn;
  setTimeout("showTime();",1000); 
}
</script>


<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.nouislider.css">
</head>
<body>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
			<%
			//获取传过来的id
			int oldId = Integer.parseInt(request.getParameter("oldId"));
			String oldName = request.getParameter("oldName");
			%>
				<p id="logoP">
					<img id="logo" src="${pageContext.request.contextPath}/images/logo1.png"><span><%=oldName %>(管理员)</span>
				</p>
			</div>
			<div id="personInfor">
				<p id="showtime"></p>
				<p id="zn"></p>
				<p>
					<a href="${pageContext.request.contextPath}/exit.jsp">退出登录</a>
				</p>
			</div>
			<div class="meun-title">系统管理</div>
			<div class="meun-item" >
				<a href="adminMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">管理员信息</a>
			</div>
			<div class="meun-item">
				<a href="adminEdi.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_rule_grey.png">修改密码</a>
			</div>
			<div class="meun-title">课程管理</div>
			<div class="meun-item">
				<a href="kechengMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_user_grey.png">课程信息</a>
			</div>
			<div class="meun-item  ">
				<a href="kechengAdd.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_change_grey.png">课程录入</a>
			</div>
			<div class="meun-title">教师管理</div>
			<div class="meun-item">
				<a href="laoshiMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">教师信息</a>
			</div>
			<div class="meun-item meun-item-active">
				<img src="${pageContext.request.contextPath}/images/icon_change_grey.png">教师录入
			</div>
			<div class="meun-title">课表管理</div>
			<div class="meun-item">
				<a href="kebiaoMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">课表信息</a>
			</div>
			<div class="meun-item">
				<a href="kebiaoAdd.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_change_grey.png">课表录入</a>
			</div>
			<div class="meun-title">学生管理</div>
			<div class="meun-item">
				<a href="xueshengMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">学生信息</a>
			</div>
			<div class="meun-item">
				<a href="xueshengAdd.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>"><img src="${pageContext.request.contextPath}/images/icon_change_grey.png">学生录入</a>
			</div>
		</div>
		
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
            <a class="toggle-btn" id="nimei">
            	<i class="glyphicon glyphicon-align-justify"></i>
        	</a>
        	<!-- Tab panes -->
            <div class="tab-content">
            	<!-- 头 -->
            	<div role="tabpanel" class="tab-pane active" id="sour">
					<div class="check-div form-inline">
						<center>
							<span style="font-size: 48px;">学生选课系统</span>
						</center>
					</div>
					<div style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
						<form class="form-horizontal" name="addForm" id="addForm" action="${pageContext.request.contextPath}/AddLaoShi" method="post">
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">教师号：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" name="bianhao" id="bianhao" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">姓&nbsp;&nbsp;名：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" name="xingming" id="xingming" id="sKnot" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">性&nbsp;&nbsp;别：</label>
								<div class="col-xs-5 text-left">
									<label class="control-label" for="2"> <input type="radio" name="xingbie" id="xingbie" value="男" checked="checked"> 男
									</label> &nbsp;&nbsp;&nbsp; 
									<label class="control-label" for="3"> <input type="radio" name="xingbie" id="xingbie" value="女"> 女
									</label> 
									<input type="hidden" class="form-control input-sm duiqi" name="oldId" id="oldId" id="sKnot" value="<%=oldId %>" style="margin-top: 7px;">
									<input type="hidden" class="form-control input-sm duiqi" name="oldName" id="oldName" id="sKnot" value="<%=oldName %>" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">年&nbsp;&nbsp;龄：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" name="nianling" id="nianling" id="sKnot" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">职&nbsp;&nbsp;称：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" name="zhicheng" id="zhicheng" id="sKnot" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">登陆帐号：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" name="loginname" id="loginname" id="sKnot" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">登陆密码：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" name="loginpw" id="loginpw" id="sKnot" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<button type="reset" class="btn btn-xs btn-white">取 消</button>
									<button type="button" onclick="Add();" class="btn btn-xs btn-green">保存</button>
								</div>
							</div>
						</form>
					</div>

				</div>
           	</div>
        </div>
        
	</div>
</body>
<script>
//判断输入是否为空
//注意:为预防页面加载不完全,放在body后
function Add() {
	//获取输入框的内容
	var bianhao = $('#bianhao').val();
	var xingming = $('#xingming').val();
	var xingbie = $('#xingbie').val();
	var nianling = $('#nianling').val();
	var zhicheng = $('#zhicheng').val();
	var loginname = $('#loginname').val();
	var loginpw = $('#loginpw').val();

	if (bianhao == '' || xingming == '' || nianling == '' || zhicheng == '' || loginname == '' || loginpw == '') {
		alert('请填写完整！！！');
	}else {
		document.getElementById("addForm").submit();
	}

}
</script>
</html>