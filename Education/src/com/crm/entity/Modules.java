package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 功能模块
 * @author hasee
 *
 */
@Component
public class Modules {
	private Integer m_id;
	private String m_name;
	private Integer m_parentid;
	private String m_path;
	private Integer m_weight;
	public Modules(Integer m_id, String m_name, Integer m_parentid, String m_path, Integer m_weight) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_parentid = m_parentid;
		this.m_path = m_path;
		this.m_weight = m_weight;
	}
	public Modules() {
		super();
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Integer getM_parentid() {
		return m_parentid;
	}
	public void setM_parentid(Integer m_parentid) {
		this.m_parentid = m_parentid;
	}
	public String getM_path() {
		return m_path;
	}
	public void setM_path(String m_path) {
		this.m_path = m_path;
	}
	public Integer getM_weight() {
		return m_weight;
	}
	public void setM_weight(Integer m_weight) {
		this.m_weight = m_weight;
	}
	@Override
	public String toString() {
		return "Modules [m_id=" + m_id + ", m_name=" + m_name + ", m_parentid=" + m_parentid + ", m_path=" + m_path
				+ ", m_weight=" + m_weight + "]";
	}

}
