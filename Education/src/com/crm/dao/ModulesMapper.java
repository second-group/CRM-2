package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Users;

public interface ModulesMapper {
	Users selectUsersByLogin(Users users);
	
	List<Modules> selectModules(Users users);
	
	/**
	 * 分页查询总条数
	 * @param fenye
	 * @return
	 */

	
	List<Modules> selectModulesAll();
	
	List<Modules> selectModulesExict(Modules modules);
	Integer insertModules(Modules modules);

	
	Integer deleteModules(Modules modules);
		
	
	Modules selectModulesById(Modules modules);
	
	Integer updateModules(Modules modules);
	/**
	 * 查询该模块是否被角色引用
	 * @param m_id
	 * @return
	 */
	List<RoleModules> selectRoleModulesExict(Integer m_id);
}
