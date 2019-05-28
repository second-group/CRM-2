package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RolesMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.util.TreeModel;
import com.crm.util.TreeNode;
@Service
public class RolesServiceImpl implements RolesService{
	@Autowired
	private RolesMapper rolesMapper;
	@Override
	public Fenye<Roles> selectRolesAll(Fenye<Roles> fenye) {
		// TODO Auto-generated method stub
		Integer total=rolesMapper.selectRolesCount(fenye);
		List<Roles> rows=rolesMapper.selectRolesAll(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public List<Roles> selectRolesExict(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesExict(roles);
	}
	@Override
	public Integer insertRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.insertRoles(roles);
	}
	@Override
	public Integer updateRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updateRoles(roles);
	}
	@Override
	public Integer deleteRoleModulesById(Integer r_id) {
		// TODO Auto-generated method stub
		return rolesMapper.deleteRoleModulesById(r_id);
	}
	
	@Override
	public Integer deleteRoles(Integer r_id) {
		// TODO Auto-generated method stub
		return rolesMapper.deleteRoles(r_id);
	}
	@Override
	public List<Modules> selectRolesModules(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesModules(roles);	
	}
	@Override
	public List<UserRoles> selectUserRolesExitUsers(Integer r_id) {
		// TODO Auto-generated method stub
		return rolesMapper.selectUserRolesExitUsers(r_id);
	}



}
