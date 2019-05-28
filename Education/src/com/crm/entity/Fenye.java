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
	
	private Notice notice;
	
	/*咨询师模块的*/
	private Students students;
	private Netrollows netrollows;
	private UserChaecks userChaecks;
	public UserChaecks getUserChaecks() {
		return userChaecks;
	}

	public void setUserChaecks(UserChaecks userChaecks) {
		this.userChaecks = userChaecks;
	}

	public Fenye(Students students, Netrollows netrollows) {
		super();
		this.students = students;
		this.netrollows = netrollows;
	}
	
	public Students getStudents() {
		return students;
	}
	public void setStudents(Students students) {
		this.students = students;
	}
	public Netrollows getNetrollows() {
		return netrollows;
	}
	public void setNetrollows(Netrollows netrollows) {
		this.netrollows = netrollows;
	}

	/*网络咨询师模块的*/
	private String s_name;
	private String s_phone;
	private Integer s_ispay;
	private Integer s_isvalid;
	private Integer s_isreturnvist;
	private String s_qq;
	private String s_createtime;
	private String s_hometime;
	private String s_firstvisittime;
	private String s_paytime;
	private String s_inclasstime;
	private Integer s_userid;
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public Integer getS_ispay() {
		return s_ispay;
	}
	public void setS_ispay(Integer s_ispay) {
		this.s_ispay = s_ispay;
	}
	public Integer getS_isvalid() {
		return s_isvalid;
	}
	public void setS_isvalid(Integer s_isvalid) {
		this.s_isvalid = s_isvalid;
	}
	public Integer getS_isreturnvist() {
		return s_isreturnvist;
	}
	public void setS_isreturnvist(Integer s_isreturnvist) {
		this.s_isreturnvist = s_isreturnvist;
	}
	public String getS_qq() {
		return s_qq;
	}
	public void setS_qq(String s_qq) {
		this.s_qq = s_qq;
	}
	public String getS_createtime() {
		return s_createtime;
	}
	public void setS_createtime(String s_createtime) {
		this.s_createtime = s_createtime;
	}
	public String getS_hometime() {
		return s_hometime;
	}
	public void setS_hometime(String s_hometime) {
		this.s_hometime = s_hometime;
	}
	public String getS_firstvisittime() {
		return s_firstvisittime;
	}
	public void setS_firstvisittime(String s_firstvisittime) {
		this.s_firstvisittime = s_firstvisittime;
	}
	public String getS_paytime() {
		return s_paytime;
	}
	public void setS_paytime(String s_paytime) {
		this.s_paytime = s_paytime;
	}
	public String getS_inclasstime() {
		return s_inclasstime;
	}
	public void setS_inclasstime(String s_inclasstime) {
		this.s_inclasstime = s_inclasstime;
	}
	

	public Fenye(Integer page, Integer pageSize, Integer total, List<T> rows, Users users, String minu_createtime,
			String maxu_createtime, Notice notice, Students students, Netrollows netrollows, UserChaecks userChaecks,
			String s_name, String s_phone, Integer s_ispay, Integer s_isvalid, Integer s_isreturnvist, String s_qq,
			String s_createtime, String s_hometime, String s_firstvisittime, String s_paytime, String s_inclasstime,
			Integer s_userid) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.total = total;
		this.rows = rows;
		this.users = users;
		Minu_createtime = minu_createtime;
		Maxu_createtime = maxu_createtime;
		this.notice = notice;
		this.students = students;
		this.netrollows = netrollows;
		this.userChaecks = userChaecks;
		this.s_name = s_name;
		this.s_phone = s_phone;
		this.s_ispay = s_ispay;
		this.s_isvalid = s_isvalid;
		this.s_isreturnvist = s_isreturnvist;
		this.s_qq = s_qq;
		this.s_createtime = s_createtime;
		this.s_hometime = s_hometime;
		this.s_firstvisittime = s_firstvisittime;
		this.s_paytime = s_paytime;
		this.s_inclasstime = s_inclasstime;
		this.s_userid = s_userid;
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
	
	public Integer getS_userid() {
		return s_userid;
	}

	public void setS_userid(Integer s_userid) {
		this.s_userid = s_userid;
	}
	

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", users="
				+ users + ", Minu_createtime=" + Minu_createtime + ", Maxu_createtime=" + Maxu_createtime + ", notice="
				+ notice + ", students=" + students + ", netrollows=" + netrollows + ", userChaecks=" + userChaecks
				+ ", s_name=" + s_name + ", s_phone=" + s_phone + ", s_ispay=" + s_ispay + ", s_isvalid=" + s_isvalid
				+ ", s_isreturnvist=" + s_isreturnvist + ", s_qq=" + s_qq + ", s_createtime=" + s_createtime
				+ ", s_hometime=" + s_hometime + ", s_firstvisittime=" + s_firstvisittime + ", s_paytime=" + s_paytime
				+ ", s_inclasstime=" + s_inclasstime + ", s_userid=" + s_userid + "]";
	}

	

	
	
	
	
}
