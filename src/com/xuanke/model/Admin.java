package com.xuanke.model;
/**
 * 管理员实体类
 * @author Leo
 *
 */

public class Admin {
	private int userId;	//管理员id
	private String userName; //管理员姓名
	private String userPw;	//密码
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	
}
