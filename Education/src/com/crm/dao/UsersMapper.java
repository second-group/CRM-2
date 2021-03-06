package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;

public interface UsersMapper {
	/**
	 * 查询相应功能树
	 * @param users
	 * @return
	 */
	List<Modules> selectModules(Users users);
	/**
	 * 最后登录时间
	 * @param users
	 * @return
	 */
	Integer updateUsersU_lastlogintime(Users users);
	/**
	 * 多条件分页查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectUsersCount(Fenye<Users> fenye);
	/**
	 * 多条件分页查询
	 * @param fenye
	 * @return
	 */
	List<Users> selectUsers(Fenye<Users> fenye);
	/**
	 * 重置密码
	 * @param u_id
	 * @return
	 */
	Integer updateResetU_password(Users users);
	/**
	 * 锁定用户
	 * @param u_id
	 * @return
	 */
	Integer updatelockUsers(Integer u_id);
	/**
	 * 被锁定时间
	 * @param u_id
	 * @return
	 */
	Integer updateu_locktime(Users users);
	/**
	 * 解锁用户
	 * @param u_id
	 * @return
	 */
	Integer updateUnlockUsers(Integer u_id);
	/**
	 * 修改相应用户
	 * @param users
	 * @return
	 */
	Integer updateUsers(Users users);
	/**
	 * 查询用户角色
	 * @param u_id
	 * @return
	 */
	List<Roles> selectUsersRole(Integer u_id);
	/**
	 * 查询所有角色
	 * @return
	 */
	List<Roles> selectRoles();
	/**
	 * 查询该角色是否存在
	 * @param userRoles
	 * @return
	 */
	List<UserRoles> SelectUserRolesEXIT(UserRoles userRoles);
	/*
	 * 给相应用户新增角色
	 */
	Integer insertUserRoles(Integer ur_userid,Integer ur_roleid);
	/**
	 * 给相应用户移除角色
	 * @param ur_userid
	 * @param ur_roleid
	 * @return
	 */
	Integer deleteUserRoles(Integer ur_userid,Integer ur_roleid);
	/**
	 * 新增用户
	 * @param users
	 * @return
	 */
	Integer insertUsers(Users users);
	/**
	 * 新增时查询该用户名是否已存在
	 * @param users
	 * @return
	 */
	Users selectUsersIsExect(Users users);
	/**
	 * 查询所有咨询师
	 * @return
	 */
	List<Users> selectUsersByStudent();
	/**
	 * 查询当天签到并且状态为已签到的所有咨询师
	 * @return
	 */
	List<Users> selectUsersByDay();
	/**
	 * 查询所有用户，登录时进行验证
	 * @return
	 */
	List<Users> selectUsersAll();
	
	Integer UpdatePassword(Users users);
	/**
	 * 删除相应用户
	 * @param users
	 * @return
	 */
	Integer deleteUsersById(Integer u_id);
	/**
	 * 删除用户时同时删除给用户设置的角色信息
	 * @param u_id
	 * @return
	 */
	Integer deleteUserRolesById(Integer u_id);
	/**
	 * 设置用户登录时密码的错误次数
	 * @param u_id
	 * @param cs
	 * @return
	 */
	Integer updateUsersU_psdwrongtime(@Param("u_id")Integer u_id,@Param("cs")Integer cs);
	/**
	 * 查询用户密码的错误次数
	 * @param u_id
	 * @return
	 */
	Integer  selectUsersU_psdwrongtime(Integer u_id);
	
	/**
	 * 查询所有咨询师进行自动分配
	 * @return
	 */
	List<Users> selectUsersZiXunShi();
}
