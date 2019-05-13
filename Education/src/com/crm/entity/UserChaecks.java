package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 用户签到
 * @author hasee
 *
 */
@Component
public class UserChaecks {
	private Integer uc_id;
	private Integer uc_userid;
	private String uc_loginname;
	private String uc_checkintime;
	private Integer uc_checkstate;
	private Integer uc_iscancel;
	private String uc_checkouttime;
	public UserChaecks(Integer uc_id, Integer uc_userid, String uc_loginname, String uc_checkintime,
			Integer uc_checkstate, Integer uc_iscancel, String uc_checkouttime) {
		super();
		this.uc_id = uc_id;
		this.uc_userid = uc_userid;
		this.uc_loginname = uc_loginname;
		this.uc_checkintime = uc_checkintime;
		this.uc_checkstate = uc_checkstate;
		this.uc_iscancel = uc_iscancel;
		this.uc_checkouttime = uc_checkouttime;
	}
	public UserChaecks() {
		super();
	}
	public Integer getUc_id() {
		return uc_id;
	}
	public void setUc_id(Integer uc_id) {
		this.uc_id = uc_id;
	}
	public Integer getUc_userid() {
		return uc_userid;
	}
	public void setUc_userid(Integer uc_userid) {
		this.uc_userid = uc_userid;
	}
	public String getUc_loginname() {
		return uc_loginname;
	}
	public void setUc_loginname(String uc_loginname) {
		this.uc_loginname = uc_loginname;
	}
	public String getUc_checkintime() {
		return uc_checkintime;
	}
	public void setUc_checkintime(String uc_checkintime) {
		this.uc_checkintime = uc_checkintime;
	}
	public Integer getUc_checkstate() {
		return uc_checkstate;
	}
	public void setUc_checkstate(Integer uc_checkstate) {
		this.uc_checkstate = uc_checkstate;
	}
	public Integer getUc_iscancel() {
		return uc_iscancel;
	}
	public void setUc_iscancel(Integer uc_iscancel) {
		this.uc_iscancel = uc_iscancel;
	}
	public String getUc_checkouttime() {
		return uc_checkouttime;
	}
	public void setUc_checkouttime(String uc_checkouttime) {
		this.uc_checkouttime = uc_checkouttime;
	}
	@Override
	public String toString() {
		return "UserChaecks [uc_id=" + uc_id + ", uc_userid=" + uc_userid + ", uc_loginname=" + uc_loginname
				+ ", uc_checkintime=" + uc_checkintime + ", uc_checkstate=" + uc_checkstate + ", uc_iscancel="
				+ uc_iscancel + ", uc_checkouttime=" + uc_checkouttime + "]";
	}
	
	
}
