package com.crm.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		@RequestMapping(value="/loginVerify",method=RequestMethod.POST)
	@ResponseBody
	 public Map<String, Object> loginVerify(Users users,HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("来啦来啊");
		String rememberme=request.getParameter("rememberme");
		Map<String, Object> map = new HashMap<String, Object>();
		Users us=modulesService.selectUsersByLogin(users);	
		if(us==null) {
			  map.put("code",0);
	          map.put("msg","用户名无效！");
		}else if(!us.getU_password().equals(users.getU_password())) {
            map.put("code",0);
            map.put("msg","密码错误！");
		} else {
            //登录成功
            map.put("code",1);
            map.put("msg","");
            //添加session
          /*  modelMap.addAttribute("users",us);*/
            request.getSession().setAttribute("users", us);
            //添加cookie
          
            if(rememberme!=null) {
                //创建两个Cookie对象
                Cookie nameCookie = new Cookie("u_lastlogintime", users.getU_lastlogintime());
                //设置Cookie的有效期为3天
                nameCookie.setMaxAge(60 * 60 * 24 * 7);
                Cookie pwdCookie = new Cookie("u_password", users.getU_password());
                pwdCookie.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }
          
    	

        }
		System.out.println(map);
		
        return map;
		
		
}
}
