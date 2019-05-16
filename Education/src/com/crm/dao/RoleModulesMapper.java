package com.crm.dao;

import org.apache.ibatis.annotations.Param;

public interface RoleModulesMapper {
	Integer deleteRolesModulesById(Integer rm_roleid);
	
	Integer insertRolesModulesById(@Param("rm_moduleid")Integer rm_moduleid,@Param("rm_roleid")Integer rm_roleid );
}
