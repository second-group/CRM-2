package com.crm.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;

public interface UsersService {
	Fenye<Users> selectUsers(Fenye<Users> fenye);
	Integer updateResetU_password(Users users);
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
	/**
	 * 查询该角色是否存在
	 * @param userRoles
	 * @return
	 */
	List<UserRoles> SelectUserRolesEXIT(UserRoles userRoles);
	Integer insertUserRoles(Integer ur_userid,Integer ur_roleid);
	Integer deleteUserRoles(Integer ur_userid,Integer ur_roleid);
	Integer insertUsers(Users users);
	/**
	 * 新增时查询该用户名是否已存在
	 * @param users
	 * @return
	 */
	Users selectUsersIsExect(Users users);
	Integer updateUsersU_lastlogintime(Users users);
	/**
	 * 
	 * @return
	 */
	List<Users> selectUsersByStudent();
	/**
	 * 查询当天签到的咨询师
	 * @return
	 */
	List<Users> selectUsersByDay();
	/**
	 * 查询所有用户
	 * @return
	 */
	List<Users> selectUsersAll();
	/**
	 * 修改密码
	 * @param users
	 * @return
	 */
	Integer UpdatePassword(Users users);
	
	Integer deleteUsersById(Integer u_id);
	/**
	 * 修改密码错误次数
	 * @param u_id
	 * @param cs
	 * @return
	 */
	Integer updateUsersU_psdwrongtime(@Param("u_id")Integer u_id,@Param("cs")Integer cs); 
	/**
	 * 查询锁定次数
	 * @param u_id
	 * @return
	 */
	Integer  selectUsersU_psdwrongtime(Integer u_id);
	
	/**
	 * 删除用户时同时删除给用户设置的角色信息
	 * @param u_id
	 * @return
	 */
	Integer deleteUserRolesById(Integer u_id);
	
	String Login(Users users,Model model,HttpSession session,HttpServletResponse response,HttpServletRequest request,boolean ch) throws UnsupportedEncodingException;
}
