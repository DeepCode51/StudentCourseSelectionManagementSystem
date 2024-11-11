<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.xuanke.util.*" %>
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
			//获取以下学生的名字
			int oldId = Integer.parseInt(request.getParameter("oldId"));
			String oldName = request.getParameter("oldName");
			%>
				<p id="logoP">
					<img id="logo" src="${pageContext.request.contextPath}/images/logo3.png"><span><%=oldName %>(学生)</span>
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
				<a href="xueshengMes.jsp?oldId=<%=oldId %>&oldName=<%=oldName %>"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">我的信息</a>
			</div>
			<div class="meun-item">
				<a href="xueshengEdi.jsp?oldId=<%=oldId %>&oldName=<%=oldName %>"><img src="${pageContext.request.contextPath}/images/icon_rule_grey.png">修改密码</a>
			</div>
			<div class="meun-title meun-item-active">课表信息</div>
			<div class="meun-item">
				<a href="kebiaoSelect.jsp?oldId=<%=oldId %>&oldName=<%=oldName %>"><img src="${pageContext.request.contextPath}/images/icon_user_grey.png">可选课程</a>
			</div>
			<div class="meun-item">
				<img src="${pageContext.request.contextPath}/images/icon_user_grey.png">我的选课
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
                	<!-- java代码 -->
                	<%
                	//创建rs,ps对象
                	PreparedStatement ps;
                	ResultSet rs;
                	
                	//创建数据库对象
                	DB db = new DB();
                	            	
                	//创建分页显示
                	int page_count;//总页数
                	int p;//当前页数
                	int size = 10;//每页记录数
                	int result_count;//总记录数
                	int begin;//当前页第一条记录索引号
                	//换页后获取
                	String page_s = request.getParameter("page");
                	if(page_s == null){
                		page_s = "1";//设置页码为1
                	}
                	p = Integer.parseInt(page_s);//转换成int类型
                	
                	//sql语句,遍历整个admin表的总数
                	String sql = "select count(*) from xuekebiao where xuesheng_id=" + oldId;
                	//调用DB里面的方法
                	ps = db.getPs(sql);       	               	
                	//执行sql语句,并获得返回的结果集
                	rs = ps.executeQuery();
                	rs.next();
                	result_count = rs.getInt(1);//总记录数
                	page_count = (result_count + size - 1)/size;//计算总页数
                	//多表联合查询
                	sql = "select k.id,c.bianhao,c.mingcheng,c.keshi,k.shijian,k.jieci,k.jiaoshi,l.xingming from kebiao k,kecheng c,laoshi l,xuekebiao xk where k.kecheng_id=c.id and k.laoshi_id=l.id and xk.kebiao_id=k.id and xk.xuesheng_id="+ oldId +" order by k.id asc";
                	begin = (p-1)*size;//当前索引
                	rs = db.getPage(sql, begin, size);//调用分页的方法               	
                	
                	%>

					<!-- 显示管理员信息 -->
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">序号</div>
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">课程编号</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">课程名称</div>
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">上课课时</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">上课时间</div>
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">上课节次</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">上课教室</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">授课老师</div>
						</div>
						
						<div class="tablebody">
						
						<% 
                		//遍历结果集
                		while(rs.next()){
                		
                		%>
							<div class="row">
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 levl3 ">
									<%=rs.getInt("id") %>
								</div>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
									<span class=""> &nbsp;</span><span><%=rs.getString("bianhao") %></span>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<%=rs.getString("mingcheng") %>
								</div>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
									<%=rs.getString("keshi") %>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<%=rs.getString("shijian") %>
								</div>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
									<span class=""> &nbsp;</span><span><%=rs.getString("jieci") %></span>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<%=rs.getString("jiaoshi") %>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<%=rs.getString("xingming") %>
								</div>
							</div>
						<%
					
                		}
                		db.closed();//每次取完数据要记得关闭数据流
					
						%>
						</div>
					</div>
					
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li class="gray">共<%=page_count %>页</li>
						<li>
							<%
								if(p > 1){
							%>
							
							<a href="kebiaoMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>&page=<%=(p-1)%>"><i class="glyphicon glyphicon-menu-left"> </i></a>
							<%
								}
							%>
						</li>
						<li>
							<%
								if(p < page_count){
							%>							
							<a href="kebiaoMes.jsp?oldName=<%=oldName %>&oldId=<%=oldId %>&page=<%=(p+1)%>"><i class="glyphicon glyphicon-menu-right"> </i></a>
							<%
								}
							%>
						</li>
					</ul>
					</footer>
            	</div>
           	</div>
        </div>
        
	</div>
</body>
</html>