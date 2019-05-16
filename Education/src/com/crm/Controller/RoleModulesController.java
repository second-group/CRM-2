package com.crm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.service.RoleModulesService;

@Controller
public class RoleModulesController {
	@Autowired
	private RoleModulesService roleModulesService;
		@RequestMapping(value="/insertRolesModules",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRolesModules(String moduleid, Integer rm_roleid){
			System.out.println(moduleid+"一堆");
			System.out.println(rm_roleid);
		
		return roleModulesService.insertRolesModulesById(moduleid, rm_roleid);
		
	}
}
