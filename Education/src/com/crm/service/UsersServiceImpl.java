package com.crm.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.crm.dao.ModulesMapper;
import com.crm.dao.UsersMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;
import com.crm.util.Result;

@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private ModulesMapper modulesMapper;
	@Override
	public Fenye<Users> selectUsers(Fenye<Users> fenye) {
		Integer total=usersMapper.selectUsersCount(fenye);
		List<Users> rows=usersMapper.selectUsers(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public Integer updateResetU_password(Users users) {
		return usersMapper.updateResetU_password(users);
	}
	@Override
	public Integer updatelockUsers(Integer u_id) {
		return usersMapper.updatelockUsers(u_id);
	}
	@Override
	public Integer updateUnlockUsers(Integer u_id) {
		return usersMapper.updateUnlockUsers(u_id);
	}
	@Override
	public List<Roles> selectUsersRole(Integer u_id) {
		return usersMapper.selectUsersRole(u_id);
	}
	@Override
	public List<Roles> selectRoles() {
		return usersMapper.selectRoles();
	}
	@Override
	public List<UserRoles> SelectUserRolesEXIT(UserRoles userRoles) {
		return usersMapper.SelectUserRolesEXIT(userRoles);
	}
	@Override
	public Integer insertUserRoles(Integer ur_userid, Integer ur_roleid) {
		return usersMapper.insertUserRoles(ur_userid, ur_roleid);
	}
	@Override
	public Integer deleteUserRoles(Integer ur_userid, Integer ur_roleid) {
		return usersMapper.deleteUserRoles(ur_userid, ur_roleid);
	}
	@Override
	public Integer insertUsers(Users users) {
		return usersMapper.insertUsers(users);
	}
	@Override
	public Integer updateUsersU_lastlogintime(Users users) {
		return usersMapper.updateUsersU_lastlogintime(users);
	}
	@Override
	public Integer updateu_locktime(Users users) {
		return usersMapper.updateu_locktime(users);
	}
	@Override
	public Users selectUsersIsExect(Users users) {
		return usersMapper.selectUsersIsExect(users);
	}
	@Override
	public Integer updateUsers(Users users) {
		return usersMapper.updateUsers(users);
	}
	@Override
	public List<Users> selectUsersByStudent() {		
		return usersMapper.selectUsersByStudent();
	}
	@Override
	public List<Users> selectUsersAll() {
		return usersMapper.selectUsersAll();
	}
	@Override
	public Integer UpdatePassword(Users users) {
		return usersMapper.UpdatePassword(users);
	}
	@Override
	public Integer deleteUsersById(Integer u_id) {
		return usersMapper.deleteUsersById(u_id);
	}
	@Override
	public Integer selectUsersU_psdwrongtime(Integer u_id) {
		return usersMapper.selectUsersU_psdwrongtime(u_id);
	}
	@Override
	public Integer updateUsersU_psdwrongtime(Integer u_id, Integer cs) {
		return usersMapper.updateUsersU_psdwrongtime(u_id, cs);
	}
	@Override
	public Integer deleteUserRolesById(Integer u_id) {
		return usersMapper.deleteUserRolesById(u_id);
	}
	@Override
	public String Login(Users users, Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, boolean ch) throws UnsupportedEncodingException {
		System.out.println(users);
		String u_loginname=request.getParameter("nameCookie");
		String u_password=request.getParameter("pwdCookie");
		if(u_loginname!=null && u_loginname !="" && u_password !=null && u_loginname != "") { //判断cookie中是否存在信息，存在则跳过验证进行登录，否则进行验证			
			users.setU_loginname(u_loginname);
			users.setU_password(u_password);
			Users us=modulesMapper.selectUsersByLogin(users);
			session.setAttribute("users", us);//存入session里面
			return Result.toClient(true, "登录成功");
		}else {	
			String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");//获取后台随机生成的验证码和前台发送过来的进行比对
			String inputStr=request.getParameter("inputStr");			
			List<Users> uu=usersMapper.selectUsersAll();
			session.setAttribute("uu", uu);//存入session里面
			String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
			String ph = "^[1][34578]\\d{9}$";
			if(users.getU_loginname().matches(ph)){//手机号登录
				users.setU_protectmtel(users.getU_loginname());
				users.setU_loginname(null);
				if(random.equals(inputStr)) {	
					for (int i = 0; i < uu.size(); i++) {
					if(uu.get(i).getU_protectmtel().equals(users.getU_protectmtel())){//验证手机号是否存在，存在则进行密码验证，否则退出重新输入
						if(uu.get(i).getU_password().equals(users.getU_password())) {//验证密码是否正确，正确进行锁定验证，查看用户是否被锁定，不正确退出重新输入				           															
							if(uu.get(i).getU_islockout()==1) {//验证用户是否被锁定，没有被锁定则通过验证，然后进行是否记住密码验证，如果复选框值为true，则将用户名以及密码存入cookie，并设置7天期限
									return Result.toClient(false, "该用户已锁定"); 
								}else {
									Users us=modulesMapper.selectUsersByLogin(users);								
									if(us!=null) {
										usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 0);
										session.setAttribute("users", us);//存入session里面
										if(ch) {																			
											Cookie nameCookie = new Cookie("nameCookie",URLEncoder.encode(us.getU_loginname(), "utf-8"));//不可存储中文字符，进行转码操作
											/*Cookie nameCookie = new Cookie("u_loginname", us.getU_loginname());*/
							                //设置Cookie的有效期为7天
							                nameCookie.setMaxAge(60 * 60 * 24 * 7);					              
							                Cookie pwdCookie = new Cookie("pwdCookie",URLEncoder.encode(us.getU_password(), "utf-8"));
							                pwdCookie.setMaxAge(60 * 60 * 24 * 7);
							                nameCookie.setPath(request.getContextPath());
							                pwdCookie.setPath(request.getContextPath());
							                response.addCookie(nameCookie);
							                response.addCookie(pwdCookie);						                
							                return Result.toClient(true, "登录成功");
										}
										return Result.toClient(true, "登录成功");																										
									}
								}						
						}else {//如果密码错误进行密码错误次数累加，错误达三次进行用户锁定
							Integer ErrorPassword=usersMapper.selectUsersU_psdwrongtime(uu.get(i).getU_id());
							if(ErrorPassword==0) {
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 1);							
								return Result.toClient(false, "密码错误,还有两次机会");
							}else if(ErrorPassword==1){
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 2);							
								return Result.toClient(false, "密码错误,还有一次机会");
							}else if(ErrorPassword==2){
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 3);						
								usersMapper.updatelockUsers(uu.get(i).getU_id());
									return Result.toClient(false, "密码错误三次,用户已被锁定,请联系管理员");
								
								
							}else {
								return Result.toClient(false, "该用户已锁定");
							}
						}
				
					}else {
						if(i>=uu.size()-1) {
							return Result.toClient(false, "手机号不存在");
						}
							continue;																						
					}
					}
				}else{
					System.out.println("验证码？");
					return Result.toClient(false, "验证码错误！！！");				
				}
			}else if(users.getU_loginname().matches(em)) {
				System.out.println("我是邮箱验证");
				System.out.println(users+"之前的");
				
				users.setU_protectemail(users.getU_loginname());
				users.setU_loginname(null);
				System.out.println(users+"之后的");
				if(random.equals(inputStr)) {	
					for (int i = 0; i < uu.size(); i++) {
					if(uu.get(i).getU_protectemail().equals(users.getU_protectemail())){//验证邮箱是否存在，存在则进行密码验证，否则退出重新输入
						
					
						if(uu.get(i).getU_password().equals(users.getU_password())) {//验证密码是否正确，正确进行锁定验证，查看用户是否被锁定，不正确退出重新输入				           															
								if(uu.get(i).getU_islockout()==1) {//验证用户是否被锁定，没有被锁定则通过验证，然后进行是否记住密码验证，如果复选框值为true，则将用户名以及密码存入cookie，并设置7天期限
									return Result.toClient(false, "该用户已锁定"); 
								}else {
									Users us=modulesMapper.selectUsersByLogin(users);								
									if(us!=null) {
										usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 0);
										session.setAttribute("users", us);//存入session里面
										if(ch) {																			
											Cookie nameCookie = new Cookie("nameCookie",URLEncoder.encode(us.getU_loginname(), "utf-8"));//不可存储中文字符，进行转码操作
											/*Cookie nameCookie = new Cookie("u_loginname", us.getU_loginname());*/
							                //设置Cookie的有效期为7天
							                nameCookie.setMaxAge(60 * 60 * 24 * 7);					              
							                Cookie pwdCookie = new Cookie("pwdCookie",URLEncoder.encode(us.getU_password(), "utf-8"));
							                pwdCookie.setMaxAge(60 * 60 * 24 * 7);
							                nameCookie.setPath(request.getContextPath());
							                pwdCookie.setPath(request.getContextPath());
							                response.addCookie(nameCookie);
							                response.addCookie(pwdCookie);						                
							                return Result.toClient(true, "登录成功");
										}
										return Result.toClient(true, "登录成功");																										
									}
								}						
						}else {//如果密码错误进行密码错误次数累加，错误达三次进行用户锁定
							Integer ErrorPassword=usersMapper.selectUsersU_psdwrongtime(uu.get(i).getU_id());
							if(ErrorPassword==0) {
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 1);							
								return Result.toClient(false, "密码错误,还有两次机会");
							}else if(ErrorPassword==1){
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 2);							
								return Result.toClient(false, "密码错误,还有一次机会");
							}else if(ErrorPassword==2){
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 3);						
								usersMapper.updatelockUsers(uu.get(i).getU_id());
									return Result.toClient(false, "密码错误三次,用户已被锁定,请联系管理员");
								
								
							}else {
								return Result.toClient(false, "该用户已锁定");
							}
						}
						
					}else {
						if(i>=uu.size()-1) {
							return Result.toClient(false, "邮箱不存在");
						}
							continue;																						
					}
					}
				}else{
					System.out.println("验证码？");
					return Result.toClient(false, "验证码错误！！！");				
				}
			}else {
				if(random.equals(inputStr)) {	
					for (int i = 0; i < uu.size(); i++) {
					if(uu.get(i).getU_loginname().equals(users.getU_loginname())){//验证用户名是否存在，存在则进行密码验证，否则退出重新输入
						
					
						if(uu.get(i).getU_password().equals(users.getU_password())) {//验证密码是否正确，正确进行锁定验证，查看用户是否被锁定，不正确退出重新输入				           															
								if(uu.get(i).getU_islockout()==1) {//验证用户是否被锁定，没有被锁定则通过验证，然后进行是否记住密码验证，如果复选框值为true，则将用户名以及密码存入cookie，并设置7天期限
									return Result.toClient(false, "该用户已锁定"); 
								}else {
									Users us=modulesMapper.selectUsersByLogin(users);								
									if(us!=null) {
										usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 0);
										session.setAttribute("users", us);//存入session里面
										if(ch) {																			
											Cookie nameCookie = new Cookie("nameCookie",URLEncoder.encode(us.getU_loginname(), "utf-8"));//不可存储中文字符，进行转码操作
											/*Cookie nameCookie = new Cookie("u_loginname", us.getU_loginname());*/
							                //设置Cookie的有效期为7天
							                nameCookie.setMaxAge(60 * 60 * 24 * 7);					              
							                Cookie pwdCookie = new Cookie("pwdCookie",URLEncoder.encode(us.getU_password(), "utf-8"));
							                pwdCookie.setMaxAge(60 * 60 * 24 * 7);
							                nameCookie.setPath(request.getContextPath());
							                pwdCookie.setPath(request.getContextPath());
							                response.addCookie(nameCookie);
							                response.addCookie(pwdCookie);						                
							                return Result.toClient(true, "登录成功");
										}
										return Result.toClient(true, "登录成功");																										
									}
								}						
						}else {//如果密码错误进行密码错误次数累加，错误达三次进行用户锁定
							Integer ErrorPassword=usersMapper.selectUsersU_psdwrongtime(uu.get(i).getU_id());
							if(ErrorPassword==0) {
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 1);							
								return Result.toClient(false, "密码错误,还有两次机会");
							}else if(ErrorPassword==1){
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 2);							
								return Result.toClient(false, "密码错误,还有一次机会");
							}else if(ErrorPassword==2){
								usersMapper.updateUsersU_psdwrongtime(uu.get(i).getU_id(), 3);						
								usersMapper.updatelockUsers(uu.get(i).getU_id());
									return Result.toClient(false, "密码错误三次,用户已被锁定,请联系管理员");
								
								
							}else {
								return Result.toClient(false, "该用户已锁定");
							}
						}
					
					}else {
						if(i>=uu.size()-1) {
							return Result.toClient(false, "用户名不存在");
						}
							continue;																						
					}
					}
				}else{
					System.out.println("验证码？");
					return Result.toClient(false, "验证码错误！！！");				
				}
			}
		
		}
		return u_password;		
	}
	public List<Users>  selectUsersByDay(){
		
		return usersMapper.selectUsersByDay();
		
	}

	
}
