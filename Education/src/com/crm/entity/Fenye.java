package com.crm.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenye<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	
	private Users users;
	private String  Minu_createtime;
	private String Maxu_createtime;
	public Fenye(Integer page, Integer pageSize, Integer total, List<T> rows, Users users, String minu_createtime,
			String maxu_createtime) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.total = total;
		this.rows = rows;
		this.users = users;
		Minu_createtime = minu_createtime;
		Maxu_createtime = maxu_createtime;
	}
	public Fenye() {
		super();
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getMinu_createtime() {
		return Minu_createtime;
	}
	public void setMinu_createtime(String minu_createtime) {
		Minu_createtime = minu_createtime;
	}
	public String getMaxu_createtime() {
		return Maxu_createtime;
	}
	public void setMaxu_createtime(String maxu_createtime) {
		Maxu_createtime = maxu_createtime;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", users="
				+ users + ", Minu_createtime=" + Minu_createtime + ", Maxu_createtime=" + Maxu_createtime + "]";
	}
	
	
	
}
