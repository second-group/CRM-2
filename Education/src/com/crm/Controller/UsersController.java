package com.crm.Controller;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.UsersService;
import com.crm.util.RandomValidateCode;
import com.crm.util.Result;
@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	@RequestMapping(value="/selectUsers",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Users> selectUsers(Fenye<Users> fenye,Users users,Integer page,Integer rows) {
		fenye.setUsers(users);
		fenye.setPage(((page-1)*rows));
		fenye.setPageSize(rows);
		return usersService.selectUsers(fenye);		
	}
	
	@RequestMapping(value="/updateResetU_password",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateResetU_password(Users users) {	
		return usersService.updateResetU_password(users);		
	}
	
	@RequestMapping(value="/updatelockUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatelockUsers(@RequestParam(value="u_id")Integer u_id,Users users) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		users.setU_id(u_id);
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
	@RequestMapping(value="/SelectUserRolesEXIT",method=RequestMethod.POST)
	@ResponseBody
	public List<UserRoles> SelectUserRolesEXIT(UserRoles userRoles) {
		return usersService.SelectUserRolesEXIT(userRoles);		
	}
	@RequestMapping(value="/insertUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUserRoles(@RequestParam(value="ur_userid")Integer ur_userid,@RequestParam(value="ur_roleid")Integer ur_roleid) {	
		return usersService.insertUserRoles(ur_userid, ur_roleid);		
	}
	
	
	
	@RequestMapping(value="/deleteUsersById",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteUsersById(@RequestParam(value="u_id")Integer u_id) {
		usersService.deleteUserRolesById(u_id);
		return usersService.deleteUsersById(u_id);		
	}
	
	@RequestMapping(value="/deleteUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteUserRoles(@RequestParam(value="ur_userid")Integer ur_userid,@RequestParam(value="ur_roleid")Integer ur_roleid) {	
		return usersService.deleteUserRoles(ur_userid, ur_roleid);		
	}
	
	@RequestMapping(value="/selectUsersIsExect",method=RequestMethod.POST)
	@ResponseBody
	public String selectUsersIsExect(Users users) {
		System.out.println(users+"判断");
		Users userExect=usersService.selectUsersIsExect(users);
		System.out.println(userExect+"查询");
		if(userExect!=null) {
			if(userExect.getU_loginname().equals(users.getU_loginname())) {
				return Result.toClient(false, "用户名重复");
			}else if(userExect.getU_protectmtel().equals(users.getU_protectmtel())) {
				return Result.toClient(false, "手机号重复");
			}else if(userExect.getU_protectemail().equals(users.getU_protectemail())){
				return Result.toClient(false, "邮箱重复");
			}
		}
	
		return Result.toClient(true, "");	
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
	/*返回当天登录的所有咨询师*/
	@RequestMapping(value="/selectUserByDay",method=RequestMethod.POST)
	@ResponseBody
	public List<Users> selectUserByDay(){
		return usersService.selectUsersByDay();
	}
	@RequestMapping(value="/UpdatePassword",method=RequestMethod.POST)
	@ResponseBody
	public Integer UpdatePassword(Users users) {
	/*	String password=MD5.getMd5(users.getU_password());
		users.setU_password(password);*/
		return usersService.UpdatePassword(users);		
	}
	
	/**
	 * 拦截器拦截进入登录页面
	 * @return
	 */
	@RequestMapping(value="/inlogin",method = RequestMethod.GET)
		public String inlogin() {
			return "login";
		}
	
	/**
	 * 数据验证通过放行进入主页面
	 * @return
	 */
	@RequestMapping(value="/inindex",method = RequestMethod.GET)
	public String inindex() {
		return "index";
	}
	
	@RequestMapping(value="/user",method = RequestMethod.GET)
	public String user() {
		return "users";
	}
	
	/**
	 * 点击登录
	 * @param users 用户信息实体类
	 * @param map
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/login",method = RequestMethod.POST)
	@ResponseBody
		public String Login(Users users,Model model,HttpSession session,HttpServletResponse response,HttpServletRequest request,boolean ch) throws UnsupportedEncodingException{				
			return usersService.Login(users, model, session, response, request, ch);
		}
	
	/**
	 * 退出
	 * @param session
	 * @return
	 */
	 @RequestMapping(value="/tologin",method = RequestMethod.GET)
	    public String tologin(HttpSession session){
	        session.invalidate();//清除Session
	        return "login";
	    }
	 
	 /**
	     * 登录页面生成验证码
	     */
	    @RequestMapping(value="/getVerify")
	    public void getVerify(HttpServletRequest request, HttpServletResponse response){
	        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
	        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
	        response.setHeader("Cache-Control", "no-cache");
	        response.setDateHeader("Expire", 0);
	        RandomValidateCode randomValidateCode = new RandomValidateCode();
	        try {
	            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
