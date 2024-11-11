package com.xuanke.util;

import java.sql.*;

/**
 * 数据库操作类
 * @author Leo
 *
 */

public class DB {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private Statement stmt;
	private String user = "root";
	private String password = "123456";
	private String className = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/graduation_59_xuanke?useUnicode=true&characterEncoding=utf8";

	public DB() {
		try {
			Class.forName(this.className);
		} catch (ClassNotFoundException e) {
			System.out.println("加载数据库驱动失败!");
			e.printStackTrace();
		}
	}

	public Connection getCon() {
		try {
			this.con = DriverManager.getConnection(this.url, this.user, this.password);
		} catch (SQLException e) {
			System.out.println("创建数据库联接失败!");
			this.con = null;
			e.printStackTrace();
		}
		return this.con;
	}
	
	//增加,更新,查找
	public PreparedStatement getPs(String sql) {
		con = getCon();
		// 向数据表添加信息
		try {
			ps = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}
	
	//删除操作
	public int del(String sql) {
		con = getCon();
		try {
			stmt = con.createStatement();//创建statement对象
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;//删除失败
		}
		return 1;//删除成功
	}
	
	//分页begin 数据记录从第几条开始    begin=(当前页数-1)*size size 每页的记录数
	//select * from xxx order by id desc limit begin,size
	public ResultSet getPage(String sql,int begin,int size) {
		con = getCon();
		String s = " limit " + begin + "," + size;
		sql = sql + s;
		try {
			stmt = con.createStatement();//创建statement对象
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public void closed() {
		try {
			if (this.ps != null) {
				this.ps.close();
			}
		} catch (SQLException e) {
			System.out.println("关闭ps对象失败!");
			e.printStackTrace();
		}
		try {
			if(this.stmt != null) {
				this.stmt.close();			
			}
		} catch (Exception e) {
			System.out.println("关闭stmt对象失败!");
			e.printStackTrace();
		}
		try {
			if(this.rs != null) {
				this.rs.close();			
			}
		} catch (Exception e) {
			System.out.println("关闭rs对象失败!");
			e.printStackTrace();
		}
		try {
			if (this.con != null) {
				this.con.close();
			}
		} catch (SQLException e) {
			System.out.println("关闭con对象失败!");
			e.printStackTrace();
		}
	}
}
