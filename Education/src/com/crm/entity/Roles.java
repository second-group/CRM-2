package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 角色
 * @author hasee
 *
 */
@Component
public class Roles {
	private Integer r_id;
	private String r_name;
	public Roles(Integer r_id, String r_name) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
	}
	public Roles() {
		super();
	}
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	@Override
	public String toString() {
		return "Roles [r_id=" + r_id + ", r_name=" + r_name + "]";
	}

}
