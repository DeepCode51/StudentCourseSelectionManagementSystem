package com.xuanke.servlet;
/**
 * 添加老师数据
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
 * Servlet implementation class AddLaoShi
 */
@WebServlet("/AddLaoShi")
public class AddLaoShi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddLaoShi() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//添加老师
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 获取页面传过来的值
		String bianhao = request.getParameter("bianhao");
		String xingming = request.getParameter("xingming");
		String xingbie = request.getParameter("xingbie");
		String nianling = request.getParameter("nianling");
		String zhicheng = request.getParameter("zhicheng");
		String loginname = request.getParameter("loginname");
		String loginpw = request.getParameter("loginpw");
		String oldName = request.getParameter("oldName");
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		
		// 创建数据库操作对象
		DB db = new DB();
		PreparedStatement ps;// 创建ps对象
		String sql = "insert into laoshi(bianhao,xingming,xingbie,nianling,zhicheng,loginname,loginpw) values(?,?,?,?,?,?,?)";

		// 调用db中的方法
		ps = db.getPs(sql);
		// 添加数据
		try {
			ps.setString(1, bianhao);
			ps.setString(2, xingming);
			ps.setString(3, xingbie);
			ps.setString(4, nianling);
			ps.setString(5, zhicheng);
			ps.setString(6, loginname);
			ps.setString(7, loginpw);
			ps.executeUpdate();// 执行sql语句
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closed();// 关闭数据流
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/laoshiMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
		doGet(request, response);
	}

}
