package com.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RoleModulesMapper;

@Service
public class RoleModulesServiceImpl implements RoleModulesService{
	@Autowired
	private RoleModulesMapper roleModulesMapper;

	@Override
	public Integer deleteRolesModulesById(Integer rm_roleid) {
		// TODO Auto-generated method stub
		return roleModulesMapper.deleteRolesModulesById(rm_roleid);
	}

	@Override
	public Integer insertRolesModulesById(String moduleid, Integer rm_roleid) {
		// TODO Auto-generated method stub
		roleModulesMapper.deleteRolesModulesById(rm_roleid);
		 String[] arr=moduleid.split(",");
		 Integer rm_moduleid;
		if(moduleid!="" && moduleid!=null) {
			for(int i=0;i<arr.length;i++) {
				rm_moduleid=Integer.parseInt(arr[i]);
				roleModulesMapper.insertRolesModulesById(rm_moduleid, rm_roleid);
			}
		}else {
			return 0;
		}
 		return 1;

	}

}
