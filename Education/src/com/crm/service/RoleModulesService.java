package com.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RoleModulesMapper;


public interface RoleModulesService {
	
	
	Integer deleteRolesModulesById(Integer rm_roleid);
	
	Integer insertRolesModulesById(String moduleid,Integer rm_roleid);
}
