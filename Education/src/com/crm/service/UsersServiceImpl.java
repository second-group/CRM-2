package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UsersMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Users;

@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersMapper usersMapper;
	@Override
	public Fenye<Users> selectUsers(Fenye<Users> fenye) {
		// TODO Auto-generated method stub
		Integer total=usersMapper.selectUsersCount(fenye);
		List<Users> rows=usersMapper.selectUsers(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public Integer updateResetU_password(Integer u_id) {
		// TODO Auto-generated method stub
		return usersMapper.updateResetU_password(u_id);
	}
	@Override
	public Integer updatelockUsers(Integer u_id) {
		// TODO Auto-generated method stub
		return usersMapper.updatelockUsers(u_id);
	}
	@Override
	public Integer updateUnlockUsers(Integer u_id) {
		// TODO Auto-generated method stub
		return usersMapper.updateUnlockUsers(u_id);
	}
	@Override
	public List<Roles> selectUsersRole(Integer u_id) {
		// TODO Auto-generated method stub
		return usersMapper.selectUsersRole(u_id);
	}
	@Override
	public List<Roles> selectRoles() {
		// TODO Auto-generated method stub
		return usersMapper.selectRoles();
	}
	@Override
	public Integer insertUserRoles(Integer ur_userid, Integer ur_roleid) {
		// TODO Auto-generated method stub
		return usersMapper.insertUserRoles(ur_userid, ur_roleid);
	}
	@Override
	public Integer deleteUserRoles(Integer ur_userid, Integer ur_roleid) {
		// TODO Auto-generated method stub
		return usersMapper.deleteUserRoles(ur_userid, ur_roleid);
	}
	@Override
	public Integer insertUsers(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.insertUsers(users);
	}
	@Override
	public Integer updateUsersU_lastlogintime(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateUsersU_lastlogintime(users);
	}
	@Override
	public Integer updateu_locktime(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateu_locktime(users);
	}
	@Override
	public List<Users> selectUsersIsExect(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.selectUsersIsExect(users);
	}
	@Override
	public Integer updateUsers(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateUsers(users);
	}
	@Override
	public List<Users> selectUsersByStudent() {
		
		return usersMapper.selectUsersByStudent();
	}

	
}
