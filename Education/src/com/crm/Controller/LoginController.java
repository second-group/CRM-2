package com.crm.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.UsersService;

import net.sf.json.JSONObject;

@Controller
public class LoginController {
	
	@Autowired
	private ModulesService modulesService;
	@Autowired
	private UsersService usersService;
	public String login(Users users,Model model,HttpSession session){
		//先判断users里是否有值
		if(users!=null) {
			System.out.println(users.getU_loginname());
			Users user=modulesService.selectUsersByLogin(users);
			if(user!=null) {
				session.setAttribute("users", user);//存入session里面
			
				return "inindex";
			}else {
				model.addAttribute("LoginFlag1","登录失败,密码或账号错误！");
				model.addAttribute("message","登录失败,密码或账号错误！");
				return "inlogin";
			}
		}else {
			model.addAttribute("LoginFlag2","登录失败");
			return "inlogin";
		}
		
	}
}
