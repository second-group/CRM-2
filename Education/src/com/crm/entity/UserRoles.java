package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 用户角色
 * @author hasee
 *
 */
@Component
public class UserRoles {
	private Integer ur_id;
	private Integer ur_userid;
	private Integer ur_roleid;
	public UserRoles(Integer ur_id, Integer ur_userid, Integer ur_roleid) {
		super();
		this.ur_id = ur_id;
		this.ur_userid = ur_userid;
		this.ur_roleid = ur_roleid;
	}
	public UserRoles() {
		super();
	}
	public Integer getUr_id() {
		return ur_id;
	}
	public void setUr_id(Integer ur_id) {
		this.ur_id = ur_id;
	}
	public Integer getUr_userid() {
		return ur_userid;
	}
	public void setUr_userid(Integer ur_userid) {
		this.ur_userid = ur_userid;
	}
	public Integer getUr_roleid() {
		return ur_roleid;
	}
	public void setUr_roleid(Integer ur_roleid) {
		this.ur_roleid = ur_roleid;
	}
	@Override
	public String toString() {
		return "UserRoles [ur_id=" + ur_id + ", ur_userid=" + ur_userid + ", ur_roleid=" + ur_roleid + "]";
	}
	
	
}
