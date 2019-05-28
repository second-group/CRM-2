package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.util.TreeModel;

public interface RolesService {
	Fenye<Roles> selectRolesAll(Fenye<Roles> fenye);
	List<Roles> selectRolesExict(Roles roles);
	Integer insertRoles(Roles roles);
	Integer updateRoles(Roles roles);
	/**
	 * 删除角色时同时删除引用的模块信息
	 * @param roles
	 * @return
	 */
	Integer deleteRoleModulesById(Integer r_id);
	Integer deleteRoles(Integer r_id);
	
	List<Modules> selectRolesModules(Roles roles);
	

	/**
	 * 删除角色时查询是否有用户正在使用
	 * @return
	 */
	List<UserRoles> selectUserRolesExitUsers(Integer r_id);
}
