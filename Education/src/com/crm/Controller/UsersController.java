package com.crm.Controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.Users;
import com.crm.service.UsersService;
@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value="/selectUsers",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Users> selectUsers(Fenye<Users> fenye,Users users,Integer page,Integer rows) {
		System.out.println(users);
		fenye.setUsers(users);
		fenye.setPage(((page-1)*rows));
		fenye.setPageSize(rows);
	/*	System.out.println(usersService.selectUsers(fenye)+"结果");*/
		return usersService.selectUsers(fenye);		
	}
	
	@RequestMapping(value="/updateResetU_password",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateResetU_password(@RequestParam(value="u_id")Integer u_id) {	
		return usersService.updateResetU_password(u_id);		
	}
	
	@RequestMapping(value="/updatelockUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatelockUsers(@RequestParam(value="u_id")Integer u_id,Users users) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		/*System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
*/		users.setU_id(u_id);
		users.setU_locktime(df.format(new Date()));
		usersService.updateu_locktime(users);
		return usersService.updatelockUsers(u_id);		
	}
	
	@RequestMapping(value="/updateUnlockUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUnlockUsers(@RequestParam(value="u_id")Integer u_id) {	
		return usersService.updateUnlockUsers(u_id);		
	}
	
	@RequestMapping(value="/updateUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUsers(Users users) {	
		return usersService.updateUsers(users);		
	}
	
	@RequestMapping(value="/selectUsersRole",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectUsersRole(@RequestParam(value="u_id")Integer u_id) {	
		return usersService.selectUsersRole(u_id);		
	}
	
	@RequestMapping(value="/selectRoles",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectRoles() {	
		return usersService.selectRoles();		
	}
	
	@RequestMapping(value="/insertUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUserRoles(@RequestParam(value="ur_userid")Integer ur_userid,@RequestParam(value="ur_roleid")Integer ur_roleid) {	
		return usersService.insertUserRoles(ur_userid, ur_roleid);		
	}
	
	@RequestMapping(value="/deleteUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteUserRoles(@RequestParam(value="ur_userid")Integer ur_userid,@RequestParam(value="ur_roleid")Integer ur_roleid) {	
		return usersService.deleteUserRoles(ur_userid, ur_roleid);		
	}
	
	@RequestMapping(value="/selectUsersIsExect",method=RequestMethod.POST)
	@ResponseBody
	public List<Users> selectUsersIsExect(Users users) {
		/*System.out.println(users+"是否存在");*/
		return usersService.selectUsersIsExect(users);		
	}
	
	@RequestMapping(value="/insertUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUsers(Users users) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		users.setU_createtime(df.format(new Date()));
		return usersService.insertUsers(users);		
	}
	@RequestMapping(value="/selectALLUsers",method=RequestMethod.POST)
	@ResponseBody
	public List<Users> selectUsersByStudent(){
		
		return usersService.selectUsersByStudent();
	}
	
}
