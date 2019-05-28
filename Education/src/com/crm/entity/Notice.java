package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 通知消息
 * @author hasee
 *
 */
@Component
public class Notice {
	private Integer no_id;
	private String username;
	private Integer no_userid;
	private String sendingtime;
	private String receivingtime;
	private String no_content;
	private Integer no_state;
	
	public Integer getNo_id() {
		return no_id;
	}
	public void setNo_id(Integer no_id) {
		this.no_id = no_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getNo_userid() {
		return no_userid;
	}
	public void setNo_userid(Integer no_userid) {
		this.no_userid = no_userid;
	}
	public String getSendingtime() {
		return sendingtime;
	}
	public void setSendingtime(String sendingtime) {
		this.sendingtime = sendingtime;
	}
	public String getReceivingtime() {
		return receivingtime;
	}
	public void setReceivingtime(String receivingtime) {
		this.receivingtime = receivingtime;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public Integer getNo_state() {
		return no_state;
	}
	public void setNo_state(Integer no_state) {
		this.no_state = no_state;
	}
	public Notice(Integer no_id, String username, Integer no_userid, String sendingtime, String receivingtime,
			String no_content, Integer no_state) {
		super();
		this.no_id = no_id;
		this.username = username;
		this.no_userid = no_userid;
		this.sendingtime = sendingtime;
		this.receivingtime = receivingtime;
		this.no_content = no_content;
		this.no_state = no_state;
	}
	
	
	public Notice() {
		super();
	}
	@Override
	public String toString() {
		return "Notice [no_id=" + no_id + ", username=" + username + ", no_userid=" + no_userid + ", sendingtime="
				+ sendingtime + ", receivingtime=" + receivingtime + ", no_content=" + no_content + ", no_state="
				+ no_state + "]";
	}
	
}
