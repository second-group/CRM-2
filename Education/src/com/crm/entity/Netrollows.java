package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 网络跟踪
 * @author hasee
 *
 */
@Component
public class Netrollows {
	private Integer n_id;
	private Integer n_studentid;
	private String n_studentname;
	private String n_followtime;
	private String n_nextfollowtime;
	private String n_content;
	private Integer n_userid;
	private String n_followtype;
	private String n_createtime;
	private Integer n_followstate;
	private Users users;
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Netrollows(Integer n_id, Integer n_studentid, String n_studentname, String n_followtime,
			String n_nextfollowtime, String n_content, Integer n_userid, String n_followtype, String n_createtime,
			Integer n_followstate) {
		super();
		this.n_id = n_id;
		this.n_studentid = n_studentid;
		this.n_studentname = n_studentname;
		this.n_followtime = n_followtime;
		this.n_nextfollowtime = n_nextfollowtime;
		this.n_content = n_content;
		this.n_userid = n_userid;
		this.n_followtype = n_followtype;
		this.n_createtime = n_createtime;
		this.n_followstate = n_followstate;
	}
	public Netrollows() {
		super();
	}
	public Integer getN_id() {
		return n_id;
	}
	public void setN_id(Integer n_id) {
		this.n_id = n_id;
	}
	public Integer getN_studentid() {
		return n_studentid;
	}
	public void setN_studentid(Integer n_studentid) {
		this.n_studentid = n_studentid;
	}
	public String getN_studentname() {
		return n_studentname;
	}
	public void setN_studentname(String n_studentname) {
		this.n_studentname = n_studentname;
	}
	public String getN_followtime() {
		return n_followtime;
	}
	public void setN_followtime(String n_followtime) {
		this.n_followtime = n_followtime;
	}
	public String getN_nextfollowtime() {
		return n_nextfollowtime;
	}
	public void setN_nextfollowtime(String n_nextfollowtime) {
		this.n_nextfollowtime = n_nextfollowtime;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Integer getN_userid() {
		return n_userid;
	}
	public void setN_userid(Integer n_userid) {
		this.n_userid = n_userid;
	}
	public String getN_followtype() {
		return n_followtype;
	}
	public void setN_followtype(String n_followtype) {
		this.n_followtype = n_followtype;
	}
	public String getN_createtime() {
		return n_createtime;
	}
	public void setN_createtime(String n_createtime) {
		this.n_createtime = n_createtime;
	}
	public Integer getN_followstate() {
		return n_followstate;
	}
	public void setN_followstate(Integer n_followstate) {
		this.n_followstate = n_followstate;
	}
	@Override
	public String toString() {
		return "Netrollows [n_id=" + n_id + ", n_studentid=" + n_studentid + ", n_studentname=" + n_studentname
				+ ", n_followtime=" + n_followtime + ", n_nextfollowtime=" + n_nextfollowtime + ", n_content="
				+ n_content + ", n_userid=" + n_userid + ", n_followtype=" + n_followtype + ", n_createtime="
				+ n_createtime + ", n_followstate=" + n_followstate + "]";
	}
	
}
