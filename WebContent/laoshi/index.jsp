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
				<p id="logoP">
					<img id="logo" src="${pageContext.request.contextPath}/images/logo2.png"><span>${xingming }(教师)</span>
				</p>
			</div>
			<div id="personInfor">
				<p id="showtime"></p>
				<p id="zn"></p>
				<p>
					<a href="${pageContext.request.contextPath}/exit.jsp">退出登录</a>
				</p>
			</div>
			<div class="meun-title">个人信息</div>
			<div class="meun-item" >
				<a href="laoshi/laoshiMes.jsp?oldId=${id }&oldName=${xingming }"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">我的信息</a>
			</div>
			<div class="meun-item">
				<a href="laoshi/laoshiEdi.jsp?oldId=${id }&oldName=${xingming }"><img src="${pageContext.request.contextPath}/images/icon_rule_grey.png">修改密码</a>
			</div>
			<div class="meun-title">课表信息</div>
			<div class="meun-item">
				<a href="laoshi/kebiaoMes.jsp?oldId=${id }&oldName=${xingming }"><img src="${pageContext.request.contextPath}/images/icon_user_grey.png">查看课表</a>
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
                    	<center><span style="font-size: 48px;">学生选课系统</span></center>
                	</div>
                	<div>
                		&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用学生选课系统!
                	</div>
            	</div>
           	</div>
        </div>
        
	</div>
</body>
</html>