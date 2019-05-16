package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.Users;
import com.crm.util.TreeModel;

public interface ModulesService {
	Users selectUsersByLogin(Users users);
	
	ArrayList<TreeModel> selectModules(Users users);
	
	ArrayList<TreeModel> selectModulesAll();
	List<Modules> selectRoleModulesAll();
	List<Modules> selectModulesExict(Modules modules);
	
	Integer insertModules(Modules modules);
	
	Integer deleteModules(Modules modules);
	
	Modules selectModulesById(Modules modules);
	
	Integer updateModules(Modules modules);
}
