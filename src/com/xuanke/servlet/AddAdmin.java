package com.xuanke.servlet;
/**
 * 添加管理员
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuanke.util.DB;

/**
 * Servlet implementation class AddAdmin
 */
@WebServlet("/AddAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddAdmin() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//添加管理员信息
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 获取页面传过来的值
		String userName = request.getParameter("userName");
		String userPw = request.getParameter("userPw");
		String oldName = request.getParameter("oldName");
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		
		//创建数据库操作对象
		DB db = new DB();
		PreparedStatement ps;//创建ps对象
		String sql = "insert into admin(userName,userPw) values(?,?)";
		
		//调用db中的方法
		ps = db.getPs(sql);
		//添加数据
		try {
			ps.setString(1, userName);
			ps.setString(2, userPw);
			ps.executeUpdate();//执行sql语句
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closed();//关闭数据流
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/adminMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
		/*request.setAttribute("oldName", oldName);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminMes.jsp");    // 使用req对象获取RequestDispatcher对象
	    dispatcher.forward(request, response);*/
		
		
		doGet(request, response);
	}

}
