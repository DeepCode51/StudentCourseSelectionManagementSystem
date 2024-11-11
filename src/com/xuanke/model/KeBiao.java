package com.xuanke.model;
/**
 * 课表实体类
 * @author Leo
 *
 */

public class KeBiao {
	private int id;
	private int kecheng_id;
	private String shijian;
	private String jieci;
	private String jiaoshi;
	private int laoshi_id;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getKecheng_id() {
		return kecheng_id;
	}
	public void setKecheng_id(int kecheng_id) {
		this.kecheng_id = kecheng_id;
	}
	public String getShijian() {
		return shijian;
	}
	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	public String getJieci() {
		return jieci;
	}
	public void setJieci(String jieci) {
		this.jieci = jieci;
	}
	public String getJiaoshi() {
		return jiaoshi;
	}
	public void setJiaoshi(String jiaoshi) {
		this.jiaoshi = jiaoshi;
	}
	
	public int getLaoshi_id() {
		return laoshi_id;
	}
	public void setLaoshi_id(int laoshi_id) {
		this.laoshi_id = laoshi_id;
	}

	
	
}
