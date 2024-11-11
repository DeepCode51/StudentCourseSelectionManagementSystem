package com.xuanke.servlet;
/**
 * 编辑课程(提醒:这个编辑有漏洞)
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
 * Servlet implementation class EdiKeCheng
 */
@WebServlet("/EdiKeCheng")
public class EdiKeCheng extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EdiKeCheng() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//根据传过来的id编辑课程
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//获取页面传过来的值
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		String oldName = request.getParameter("oldName");
		int id = Integer.parseInt(request.getParameter("id"));
		String bianhao = request.getParameter("bianhao");
		String mingcheng = request.getParameter("mingcheng");
		String keshi = request.getParameter("keshi");
		
		//创建db对象
		DB db = new DB();
		PreparedStatement ps;

		//创建更新sql语句
		String sql = "update kecheng set bianhao=?,mingcheng=?,keshi=? where id = ?";
		//调用更新操作
		ps = db.getPs(sql);
		//要更新的数据
		try {
			ps.setString(1, bianhao);
			ps.setString(2, mingcheng);
			ps.setString(3, keshi);
			ps.setInt(4, id);
			ps.executeUpdate();//执行更新
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();//关闭数据流
		//成功返回管理员信息页面,这里可以设置一个提示页面再跳,不设置也可以
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/kechengMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
		
		doGet(request, response);
	}

}
