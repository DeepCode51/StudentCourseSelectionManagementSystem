package com.xuanke.servlet;
/**
 * 学生信息更改
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
 * Servlet implementation class EdiXueSheng
 */
@WebServlet("/EdiXueSheng")
public class EdiXueSheng extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EdiXueSheng() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		//获取页面传过来的值
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		String oldName = request.getParameter("oldName");
		int id = Integer.parseInt(request.getParameter("id"));
		String xuehao = request.getParameter("xuehao");
		String xingming = request.getParameter("xingming");
		String xingbie = request.getParameter("xingbie");
		String nianling = request.getParameter("nianling");
		String banji = request.getParameter("banji");
		String loginname = request.getParameter("loginname");
		String loginpw = request.getParameter("loginpw");

		//创建db对象
		DB db = new DB();
		PreparedStatement ps;

		//创建更新sql语句
		String sql = "update xuesheng set xuehao=?,xingming=?,xingbie=?,nianling=?,banji=?,loginname=?,loginpw=? where id=?";
		//调用更新操作
		ps = db.getPs(sql);
		//要更新的数据
		try {
			ps.setString(1, xuehao);
			ps.setString(2, xingming);
			ps.setString(3, xingbie);
			ps.setString(4, nianling);
			ps.setString(5, banji);
			ps.setString(6, loginname);
			ps.setString(7, loginpw);
			ps.setInt(8, id);
			ps.executeUpdate();//执行更新
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();//关闭数据流
		//成功返回管理员信息页面,这里可以设置一个提示页面再跳,不设置也可以
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/xueshengMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
		doGet(request, response);
	}

}
