package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.Roles;
import com.crm.entity.Users;

public interface UsersMapper {
	List<Modules> selectModules(Users users);
	
	Integer selectUsersCount(Fenye<Users> fenye);
	List<Users> selectUsers(Fenye<Users> fenye);
	
	Integer updateResetU_password(Integer u_id);
	
	Integer updatelockUsers(Integer u_id);
	
	Integer updateUnlockUsers(Integer u_id);
	/**
	 * 查询用户角色
	 * @param u_id
	 * @return
	 */
	List<Roles> selectUsersRole(Integer u_id);
	
	List<Roles> selectRoles();
	
	Integer insertUserRoles(Integer ur_userid,Integer ur_roleid);
	Integer deleteUserRoles(Integer ur_userid,Integer ur_roleid);
}
