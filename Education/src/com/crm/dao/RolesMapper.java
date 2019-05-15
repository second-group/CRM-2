package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;

import com.crm.entity.Roles;


public interface RolesMapper {
	/**
	 * 分页查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectRolesCount(Fenye<Roles> fenye);
	/**
	 * 分页查询
	 * @param fenye
	 * @return
	 */
	List<Roles> selectRolesAll(Fenye<Roles> fenye);
	
	List<Roles> selectRolesExict(Roles roles);
	
	Integer insertRoles(Roles roles);
	
	Integer updateRoles(Roles roles);
	
	Integer deleteRoles(Roles roles);
	/**
	 * 设置角色权限
	 * @return
	 */
	List<Modules> selectRolesModules(Roles roles);
	
	Integer deleteRolesModules(Integer r_id);
	
	Integer insertRolesModules(@Param("rm_roleid")Integer rm_roleid,@Param("rm_moduleid")String rm_moduleid);
}
