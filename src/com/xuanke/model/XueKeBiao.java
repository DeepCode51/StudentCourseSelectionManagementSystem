package com.xuanke.model;
/**
 * 学生课表实体类
 * @author Leo
 *
 */

public class XueKeBiao {
	private int id;
	private int xuesheng_id;
	private int kebiao_id;
	private KeBiao kebiao;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getXuesheng_id() {
		return xuesheng_id;
	}
	public void setXuesheng_id(int xuesheng_id) {
		this.xuesheng_id = xuesheng_id;
	}
	public int getKebiao_id() {
		return kebiao_id;
	}
	public void setKebiao_id(int kebiao_id) {
		this.kebiao_id = kebiao_id;
	}
	public KeBiao getKebiao() {
		return kebiao;
	}
	public void setKebiao(KeBiao kebiao) {
		this.kebiao = kebiao;
	}
	
	
}
