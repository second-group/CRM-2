package com.crm.entity;
/**
 * 角色模块
 * @author hasee
 *
 */
public class RoleModules {
	private Integer rm_id;
	private Integer rm_roleid;
	private Integer rm_moduleid;
	public RoleModules(Integer rm_id, Integer rm_roleid, Integer rm_moduleid) {
		super();
		this.rm_id = rm_id;
		this.rm_roleid = rm_roleid;
		this.rm_moduleid = rm_moduleid;
	}
	public RoleModules() {
		super();
	}
	public Integer getRm_id() {
		return rm_id;
	}
	public void setRm_id(Integer rm_id) {
		this.rm_id = rm_id;
	}
	public Integer getRm_roleid() {
		return rm_roleid;
	}
	public void setRm_roleid(Integer rm_roleid) {
		this.rm_roleid = rm_roleid;
	}
	public Integer getRm_moduleid() {
		return rm_moduleid;
	}
	public void setRm_moduleid(Integer rm_moduleid) {
		this.rm_moduleid = rm_moduleid;
	}
	@Override
	public String toString() {
		return "RoleModules [rm_id=" + rm_id + ", rm_roleid=" + rm_roleid + ", rm_moduleid=" + rm_moduleid + "]";
	}
	
}
