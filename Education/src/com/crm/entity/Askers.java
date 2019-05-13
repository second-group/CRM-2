package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 分量
 * @author hasee
 *
 */
@Component
public class Askers {
	private Integer a_id;
	private Integer a_studentid;
	private Integer a_checkstate;
	private String a_createtime;
	private Integer a_weight;
	private Integer a_userid;
	private String a_bakcontent;
	public Askers(Integer a_id, Integer a_studentid, Integer a_checkstate, String a_createtime, Integer a_weight,
			Integer a_userid, String a_bakcontent) {
		super();
		this.a_id = a_id;
		this.a_studentid = a_studentid;
		this.a_checkstate = a_checkstate;
		this.a_createtime = a_createtime;
		this.a_weight = a_weight;
		this.a_userid = a_userid;
		this.a_bakcontent = a_bakcontent;
	}
	public Askers() {
		super();
	}
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public Integer getA_studentid() {
		return a_studentid;
	}
	public void setA_studentid(Integer a_studentid) {
		this.a_studentid = a_studentid;
	}
	public Integer getA_checkstate() {
		return a_checkstate;
	}
	public void setA_checkstate(Integer a_checkstate) {
		this.a_checkstate = a_checkstate;
	}
	public String getA_createtime() {
		return a_createtime;
	}
	public void setA_createtime(String a_createtime) {
		this.a_createtime = a_createtime;
	}
	public Integer getA_weight() {
		return a_weight;
	}
	public void setA_weight(Integer a_weight) {
		this.a_weight = a_weight;
	}
	public Integer getA_userid() {
		return a_userid;
	}
	public void setA_userid(Integer a_userid) {
		this.a_userid = a_userid;
	}
	public String getA_bakcontent() {
		return a_bakcontent;
	}
	public void setA_bakcontent(String a_bakcontent) {
		this.a_bakcontent = a_bakcontent;
	}
	@Override
	public String toString() {
		return "Askers [a_id=" + a_id + ", a_studentid=" + a_studentid + ", a_checkstate=" + a_checkstate
				+ ", a_createtime=" + a_createtime + ", a_weight=" + a_weight + ", a_userid=" + a_userid
				+ ", a_bakcontent=" + a_bakcontent + "]";
	}
	
}
