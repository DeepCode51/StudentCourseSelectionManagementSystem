package com.xuanke.servlet;
/**
 * 登陆操作
 */

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuanke.util.DB;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	//判断登陆情况
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 处理登陆事件
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 获取页面传过来的值
		String userName = request.getParameter("userName");
		String userPw = request.getParameter("userPw");
		String chose = request.getParameter("chose");
		
		//创建数据库操作对象
		DB db = new DB();
		PreparedStatement ps;//创建ps对象
		ResultSet rs;//创建rs对象,结果集
		
		//判断身份radio的值
		//1为管理员,1写前面的好处是防止空指针异常
		if("1".equals(chose)) {
			int userId = 0;
			//调用查找方法getPs(String sql),写入sql语句
			String sql = "select * from admin where userName = '" + userName + "' and userPw = '" + userPw +"'";
			ps = db.getPs(sql);//返回的是ps对象
			try {
				rs = ps.executeQuery();//执行sql语句,获得结果集
				//遍历以下结果,因为管理员的名称要传过去
				while(rs.next()) {
					userId = rs.getInt("userId");
					userName = rs.getString("userName");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//userId > 0表示存在该用户
			if(userId > 0) {
				request.setAttribute("userId", userId);
				request.setAttribute("userName", userName);
				db.closed();//关闭数据库操作
				RequestDispatcher dispatcher = request.getRequestDispatcher("admin/index.jsp");    // 跳转到管理员首页
			    dispatcher.forward(request, response);	
			    return;
			}else { //如果不存在,则提示用户错误信息
				db.closed();//关闭数据库操作
				request.setAttribute("message", "请检查你的用户名或密码是否正确,必要时可练习管理员233333!");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");    // 使用req对象获取RequestDispatcher对象
			    dispatcher.forward(request, response);
			    return;
			}
			
		}
		
		// 2为老师,2写前面的好处是防止空指针异常
		if ("2".equals(chose)) {
			int id = 0;
			String xingming ="";
			// 调用查找方法getPs(String sql),写入sql语句
			String sql = "select * from laoshi where loginname = '" + userName + "' and loginpw = '" + userPw + "'";
			ps = db.getPs(sql);// 返回的是ps对象
			try {
				rs = ps.executeQuery();// 执行sql语句,获得结果集
				// 遍历以下结果,因为管理员的名称要传过去
				while (rs.next()) {
					id = rs.getInt("id");
					xingming = rs.getString("xingming");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// userId > 0表示存在该用户
			if (id > 0) {
				request.setAttribute("id", id);
				request.setAttribute("xingming", xingming);
				db.closed();// 关闭数据库操作
				RequestDispatcher dispatcher = request.getRequestDispatcher("laoshi/index.jsp"); // 跳转到老师首页
				dispatcher.forward(request, response);
				return;
			} else { // 如果不存在,则提示用户错误信息
				db.closed();// 关闭数据库操作
				request.setAttribute("message", "请检查你的输入或选择是否正确,必要时可联系管理员!");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp"); // 使用req对象获取RequestDispatcher对象
				dispatcher.forward(request, response);
				return;
			}

		}
		// 3为老师,3写前面的好处是防止空指针异常
		if ("3".equals(chose)) {
			int id = 0;
			String xingming = "";
			// 调用查找方法getPs(String sql),写入sql语句
			String sql = "select * from xuesheng where loginname = '" + userName + "' and loginpw = '" + userPw + "'";
			ps = db.getPs(sql);// 返回的是ps对象
			try {
				rs = ps.executeQuery();// 执行sql语句,获得结果集
				// 遍历以下结果,因为管理员的名称要传过去
				while (rs.next()) {
					id = rs.getInt("id");
					xingming = rs.getString("xingming");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// userId > 0表示存在该用户
			if (id > 0) {
				request.setAttribute("id", id);
				request.setAttribute("xingming", xingming);
				db.closed();// 关闭数据库操作
				RequestDispatcher dispatcher = request.getRequestDispatcher("xuesheng/index.jsp"); // 跳转到老师首页
				dispatcher.forward(request, response);
				return;
			} else { // 如果不存在,则提示用户错误信息
				db.closed();// 关闭数据库操作
				request.setAttribute("message", "请检查你的用户名或密码是否正确,必要时可练习管理员233333!");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp"); // 使用req对象获取RequestDispatcher对象
				dispatcher.forward(request, response);
				return;
			}

		}
		
		
		
		doGet(request, response);
	}

}
