package com.crm.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.UsersService;
import com.crm.util.TreeModel;

import net.sf.json.JSONObject;

@Controller
public class ModulesController {
	@Autowired
	private ModulesService modulesService;
	@Autowired
	private UsersService usersService;
	@RequestMapping(value="/ModulesAll",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectModules(Users users) {
		Map<String, Object> map = new HashMap<String, Object>();
		Users us=modulesService.selectUsersByLogin(users);	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		users.setU_lastlogintime(df.format(new Date()));
		usersService.updateUsersU_lastlogintime(users);
		return modulesService.selectModules(users);	
}

	
	@RequestMapping(value="/selectModulesAll",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectModulesAll() {	
		return modulesService.selectModulesAll();	
	}
	
	@RequestMapping(value="/selectModulesExict",method=RequestMethod.POST)
	@ResponseBody
	public List<Modules> selectModulesExict(Modules modules) {
		return modulesService.selectModulesExict(modules);
		
	}
	
	@RequestMapping(value="/insertModules",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertModules(Modules modules) {
		return modulesService.insertModules(modules);
		
	}
	
	
	@RequestMapping(value="/selectRoleModulesExict",method=RequestMethod.POST)
	@ResponseBody
	public List<RoleModules> selectRoleModulesExict(@RequestParam("m_id")Integer m_id) {
		return modulesService.selectRoleModulesExict(m_id);
		
	}
	
	@RequestMapping(value="/deleteModules",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteModules(Modules modules) {
		return modulesService.deleteModules(modules);
		
	}
	
	
	@RequestMapping(value="/selectModulesById",method=RequestMethod.POST)
	@ResponseBody
	public Modules selectModulesById(Modules modules) {
	
		   
		return modulesService.selectModulesById(modules);	
	}
	
	@RequestMapping(value="/updateModules",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateModules(Modules modules) {
		return modulesService.updateModules(modules);
		
	}
	@RequestMapping(value="/modules",method = RequestMethod.GET)
	public String user() {
		return "modules";
	}
}
