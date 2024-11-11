package com.xuanke.servlet;
/**
 * 删除老师数据
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuanke.util.DB;

/**
 * Servlet implementation class DeleLaoShi
 */
@WebServlet("/DeleLaoShi")
public class DeleLaoShi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleLaoShi() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");//解决乱码
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"));  //获传过来的值
		String oldName = request.getParameter("oldName");
		int oldId = Integer.parseInt(request.getParameter("oldId"));
		//创建DB对象
		DB db = new DB();
		String sql = "delete from laoshi where id=" + id;//创建sql语句
		//调用删除操作
		db.del(sql);
		//关闭数据流
		db.closed();
		PrintWriter out = response.getWriter();
		response.sendRedirect("admin/laoshiMes.jsp?oldName=" + oldName + "&oldId=" + oldId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
