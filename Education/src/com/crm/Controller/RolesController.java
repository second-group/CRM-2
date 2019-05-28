package com.crm.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.RolesService;
import com.crm.util.TreeModel;
import com.crm.util.TreeNode;

@Controller
public class RolesController {
	@Autowired
	private RolesService rolesService;
	@Autowired
	private ModulesService modulesService;
	@RequestMapping(value="/selectRolesAll",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Roles> selectRolesAll(Fenye<Roles> fenye,Integer page,Integer rows){
		fenye.setPage(((page-1)*rows));
		fenye.setPageSize(rows);
		return rolesService.selectRolesAll(fenye);
		
	}
	
	
	@RequestMapping(value="/selectRolesExict",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectRolesExict(Roles roles){
		/*System.out.println(rolesService.selectRolesExict(roles)+"roles");*/
		return rolesService.selectRolesExict(roles);
		
	}
	
	@RequestMapping(value="/insertRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRoles(Roles roles){
		
		return rolesService.insertRoles(roles);
		
	}
	
	@RequestMapping(value="/updateRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateRoles(Roles roles){
		
		return rolesService.updateRoles(roles);
		
	}
	
	
	@RequestMapping(value="/deleteRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteRoles(@RequestParam("r_id")Integer r_id){
		rolesService.deleteRoleModulesById(r_id);
		return rolesService.deleteRoles(r_id);
		
	}
	
	
	@RequestMapping(value="/selectUserRolesExitUsers",method=RequestMethod.POST)
	@ResponseBody
	public List<UserRoles> selectUserRolesExitUsers(@RequestParam("r_id")Integer r_id){
		/*System.out.println(rolesService.selectRolesExict(roles)+"roles");*/
		return rolesService.selectUserRolesExitUsers(r_id);
		
	}
	
	@RequestMapping(value="/selectRolesModules",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectRolesModules(Roles roles) {
		List<Modules> totalList=modulesService.selectRoleModulesAll();
		List<Modules> Roleslist=rolesService.selectRolesModules(roles);		
		List<Modules> treeTrue=TreeNode.checkTree(totalList, Roleslist);
		return TreeNode.getcheckTrue(treeTrue);
		
	}
	
	
	@RequestMapping(value="/roles",method = RequestMethod.GET)
	public String user() {
		return "roles";
	}
}
