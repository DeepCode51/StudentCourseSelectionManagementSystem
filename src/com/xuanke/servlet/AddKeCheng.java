package com.xuanke.servlet;
/**
 * 添加课程
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuanke.util.DB;

/**
 * Servlet implementation class AddKeCheng
 */
@WebServlet("/AddKeCheng")
public class AddKeCheng extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddKeCheng() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//添加课程操作
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 获取页面传过来的值
		String bianhao = request.getParameter("bianhao");
		String mingcheng = request.getParameter("mingcheng");
		String keshi = request.getParameter("keshi");
		String oldName = request.getParameter("oldName");
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		
		// 创建数据库操作对象
		DB db = new DB();
		PreparedStatement ps;// 创建ps对象
		String sql = "insert into kecheng(bianhao,mingcheng,keshi) values(?,?,?)";

		// 调用db中的方法
		ps = db.getPs(sql);
		// 添加数据
		try {
			ps.setString(1, bianhao);
			ps.setString(2, mingcheng);
			ps.setString(3, keshi);
			ps.executeUpdate();// 执行sql语句
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closed();// 关闭数据流
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/kechengMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
		
		
		doGet(request, response);
	}

}
