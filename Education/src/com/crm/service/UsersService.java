package com.crm.service;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Users;

public interface UsersService {
	Fenye<Users> selectUsers(Fenye<Users> fenye);
	Integer updateResetU_password(Integer u_id);
	Integer updatelockUsers(Integer u_id);
	Integer updateu_locktime(Users users);
	Integer updateUnlockUsers(Integer u_id);
	/**
	 * 修改相应用户
	 * @param users
	 * @return
	 */
	Integer updateUsers(Users users);
	List<Roles> selectUsersRole(Integer u_id);
	List<Roles> selectRoles();
	Integer insertUserRoles(Integer ur_userid,Integer ur_roleid);
	Integer deleteUserRoles(Integer ur_userid,Integer ur_roleid);
	Integer insertUsers(Users users);
	/**
	 * 新增时查询该用户名是否已存在
	 * @param users
	 * @return
	 */
	List<Users> selectUsersIsExect(Users users);
	Integer updateUsersU_lastlogintime(Users users);
	
	List<Users> selectUsersByStudent();
	
	List<Users> selectUsersAll();
}
