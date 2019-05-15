package com.crm.service;

import java.util.ArrayList;
import java.util.List;



import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.util.TreeModel;
public interface RolesService {
	Fenye<Roles> selectRolesAll(Fenye<Roles> fenye);
	List<Roles> selectRolesExict(Roles roles);
	Integer insertRoles(Roles roles);
	Integer updateRoles(Roles roles);
	Integer deleteRoles(Roles roles);
	
	ArrayList<TreeModel> selectRolesModules(Roles roles);
	
	Integer insertRolesModules(Integer rm_roleid,String rm_moduleid);
}
