package com.xuanke.servlet;
/**
 * 选择课程
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

@WebServlet("/SelectKeBiao")
public class SelectKeBiao extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectKeBiao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");//解决乱码
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"));  //获传过来的值,该id是课表的id
		String oldName = java.net.URLEncoder.encode(request.getParameter("oldName"),"UTF-8");//给中文编码为UTF-8
		int oldId = Integer.parseInt(request.getParameter("oldId"));//学生的id
		
		//创建DB对象
		DB db = new DB();
		PreparedStatement ps;
		ResultSet rs;
		String sql;
		//创建sql语句
		//插入前要判断该学生之前是否有选过这门课
		sql = "select * from xuekebiao where xuesheng_id=" + oldId + " and kebiao_id=" + id ;	
		//调用db的方法
		ps = db.getPs(sql);
		try {
			rs = ps.executeQuery();//执行sql语句
			if(rs.next()) {//返回的是布尔值,假如返回的是true,即有数据了,就不能选择该课程,跳到过渡页No
				PrintWriter out = response.getWriter();
				db.closed();// 关闭数据流
				response.sendRedirect("xuesheng/no.jsp?oldName=" + oldName + "&oldId=" + oldId);
			}else {	//返回false,则可以选择		
				// 调用db中的方法
				sql = "insert into xuekebiao(xuesheng_id,kebiao_id) values(?,?)";
				ps = db.getPs(sql);
				// 添加数据
				ps.setInt(1, oldId);
				ps.setInt(2, id);
				ps.executeUpdate();// 执行sql语句
				PrintWriter out = response.getWriter();
				response.sendRedirect("xuesheng/ok.jsp?oldName=" + oldName + "&oldId=" + oldId);
			}
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
