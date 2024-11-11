package com.xuanke.servlet;
/**
 * 添加课表信息
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuanke.util.DB;

/**
 * Servlet implementation class AddKeBiao
 */
@WebServlet("/AddKeBiao")
public class AddKeBiao extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddKeBiao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//添加课表记录
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 获取页面传过来的值
		int kecheng_id = Integer.parseInt(request.getParameter("kecheng_id"));
		String shijian = request.getParameter("shijian");
		String jieci = request.getParameter("jieci");
		String jiaoshi = request.getParameter("jiaoshi");
		int laoshi_id = Integer.parseInt(request.getParameter("laoshi_id"));
		String oldName = request.getParameter("oldName");
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		
		// 创建数据库操作对象
		DB db = new DB();
		PreparedStatement ps;// 创建ps对象
		String sql;
		
		//实现插入数据
		sql = "insert into kebiao(kecheng_id,shijian,jieci,jiaoshi,laoshi_id) values(?,?,?,?,?)";

		// 调用db中的方法
		ps = db.getPs(sql);
		// 添加数据
		try {
			ps.setInt(1, kecheng_id);
			ps.setString(2, shijian);
			ps.setString(3, jieci);
			ps.setString(4, jiaoshi);
			ps.setInt(5, laoshi_id);
			ps.executeUpdate();// 执行sql语句
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closed();// 关闭数据流
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/kebiaoMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
		doGet(request, response);
	}

}
