package com.crm.Controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.security.auth.Subject;
import javax.servlet.ServletException;
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
import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.UsersService;
import com.crm.util.RandomValidateCode;
@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private ModulesService modulesService;
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
	
	@RequestMapping(value="/UpdatePassword",method=RequestMethod.POST)
	@ResponseBody
	public Integer UpdatePassword(Users users) {
	
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
	 */
	@RequestMapping(value="/login",method = RequestMethod.POST)
	@ResponseBody
		public String Login(Users users,Model model,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
	/*	String userCaptchaResponse = request.getParameter("japtcha");
		    boolean captchaPassed = SimpleImageCaptchaServlet.validateResponse(request, userCaptchaResponse);	*/
		/*    System.out.println(userCaptchaResponse+"我是图片");
		    System.out.println(captchaPassed+"我是图片");*/
		
		if(users!=null) {
			List<Users> uu=usersService.selectUsersAll();
			session.setAttribute("uu", uu);//存入session里面
			System.out.println(uu);
		/*	for (int i = 0; i < uu.size(); i++) {
				if(uu.get(i).getU_lastlogintime().equals(users.getU_loginname())){
					session.setAttribute("usersChecked", "用户名不存在");
					
				}else if(uu.get(i).getU_password().equals(users.getU_password())){
					System.out.println("密码错误");
					session.setAttribute("usersChecked", "密码错误");
					
				}else if(uu.get(i).getU_islockout()==1) {
					alert("该用户已锁定");
					session.setAttribute("usersChecked", "该用户已锁定");
					
				}
				
			}*/
			 /* for(Users us:uu){
				   System.out.println(us.getU_loginname());
				  } */ 
			Users us=modulesService.selectUsersByLogin(users);
			String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
			String inputStr=request.getParameter("inputStr");
			System.out.println(inputStr+"页面验证码");
			System.out.println(random+"后台验证码");
			System.out.println(us+"585858585858");
			 /*&& random.equals(inputStr)*/
			if(us!=null) {
				/*if(ch.equals(true)) {
					
					Cookie nameCookie = new Cookie("u_loginname", us.getU_loginname());
	                //设置Cookie的有效期为7天
	                nameCookie.setMaxAge(60 * 60 * 24 * 7);
	                Cookie pwdCookie = new Cookie("u_password", us.getU_password());
	                pwdCookie.setMaxAge(60 * 60 * 24 * 7);
	                response.addCookie(nameCookie);
	                response.addCookie(pwdCookie);
				}*/
				if(random.equals(inputStr)) {
					session.setAttribute("users", us);//存入session里面
					return "inindex";
				}else {
					System.out.println("验证码？");
					/*session.setAttribute("imgCheck", "验证码错误");*/
					return "验证码错误";
				}
				
			}else /*if(!users.getU_loginname().equals(us.getU_lastlogintime()))*/{
				model.addAttribute("msg","登录失败,用户名错误！");
				System.out.println("我是用户名错误");
				return "inlogin";
			}/*else if(!users.getU_password().equals(us.getU_password())){
				model.addAttribute("msg","登录失败,密码错误！");
				return "inlogin";
			}else {
				model.addAttribute("msg","登录失败,权限不足！");
				return "inlogin";
			}*/
		}else {
			model.addAttribute("msg","请输入用户名密码");
			return "inlogin";
		}
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

	 * 获取生成验证码显示到 UI 界面

	 * @param request

	 * @param response

	 * @throws ServletException

	 * @throws IOException

	 */

	@RequestMapping(value="/checkCode")

	public void checkCode(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

		//设置相应类型,告诉浏览器输出的内容为图片

        response.setContentType("image/jpeg");

        

        //设置响应头信息，告诉浏览器不要缓存此内容

        response.setHeader("pragma", "no-cache");

        response.setHeader("Cache-Control", "no-cache");

        response.setDateHeader("Expire", 0);

        

        RandomValidateCode randomValidateCode = new RandomValidateCode();

        try {

            randomValidateCode.getRandcode(request, response);//输出图片方法

        } catch (Exception e) {

            e.printStackTrace();

        }

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
